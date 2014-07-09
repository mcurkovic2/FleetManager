package hr.fleetman.crypto

import org.apache.shiro.crypto.hash.Sha512Hash;

import grails.transaction.Transactional

class Sha512CryptoService {

    def encrypt() {
		return new Sha512Hash(value).toHex();
    }
}
