package hr.fleetman.utils

import org.apache.shiro.crypto.hash.Sha512Hash

class Utils {
	static def encrypt(String value) {
		return new Sha512Hash(value).toHex();
	}
}
