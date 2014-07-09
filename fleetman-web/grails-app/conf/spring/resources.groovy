import org.apache.shiro.authc.credential.HashedCredentialsMatcher

// Place your Spring DSL code here
beans = {
	
	credentialMatcher(HashedCredentialsMatcher) {
		hashAlgorithmName = "SHA-512"
		storedCredentialsHexEncoded = true
	}
}
