package io.caffeinestudio.telecom_manager

import android.annotation.SuppressLint
import android.content.SharedPreferences
import android.provider.ContactsContract
import android.telecom.Call
import android.telecom.CallScreeningService

data class Contact(
    val phone: String,
)

class CustomScreeningService : CallScreeningService() {
    private val prefs
        get(): SharedPreferences = applicationContext.getSharedPreferences(
            "FlutterSharedPreferences",
            MODE_PRIVATE,
        )

    private fun readBool(key: String) = prefs.getBoolean("flutter.$key", false)

    private fun readContacts(group: String): Set<Contact> {
        val prefs = prefs.getString("flutter.$group", null) ?: return emptySet()
        return prefs.split("!")[1].split(",").map { Contact(it) }.toSet()
    }

    private val blacklist get(): Set<Contact> = readContacts("blacklist")

    private val contacts: Set<Contact>
        @SuppressLint("Range") get() {
            val whitelist = mutableSetOf<String>()
            val cursor = contentResolver.query(
                ContactsContract.Contacts.CONTENT_URI,
                null,
                null,
                null,
                null,
            )
            if (cursor != null && cursor.count > 0) {
                while (cursor.moveToNext()) {
                    val ci = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts._ID))
                    val ni = cursor.getColumnIndex(ContactsContract.Contacts.HAS_PHONE_NUMBER)
                    if (cursor.getString(ni).toInt() > 0) {
                        val phones = contentResolver.query(
                            ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                            null,
                            ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = ?",
                            arrayOf(ci),
                            null,
                        )
                        if (phones != null) {
                            while (phones.moveToNext()) {
                                val pi = phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER)
                                whitelist.add(phones.getString(pi))
                            }
                            phones.close()
                        }
                    }
                }
                cursor.close()
            }
            return whitelist.map { Contact(it) }.toSet()
        }

    private fun phoneIncludedIn(contacts: Set<Contact>, phone: String): Boolean {
        val nonDigits = Regex("\\D")
        val phone = phone.replace(nonDigits, "")
        val contacts = contacts.map { it.phone.replace(nonDigits, "") }
        return contacts.any { it.contains(phone.reversed().take(8).reversed()) }
    }

    override fun onScreenCall(details: Call.Details) {
        val phone = details.handle.schemeSpecificPart
        when {
            phoneIncludedIn(blacklist, phone) -> rejectCall(details)
            phoneIncludedIn(contacts, phone) -> return
            rejectUnknownCallers -> rejectCall(details)
        }
    }

    private val rejectUnknownCallers get() = readBool("reject_unknown_callers")

    private fun rejectCall(details: Call.Details) {
        respondToCall(
            details,
            CallResponse.Builder()
                .setRejectCall(true)
                .setDisallowCall(true)
                .setSkipNotification(true)
                .setSkipCallLog(true)
                .build(),
        )
    }
}