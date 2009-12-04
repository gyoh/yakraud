security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "com.yakraud.User"
	authorityDomainClass = "com.yakraud.Role"

    useRequestMapDomainClass = false
    useControllerAnnotations = true

    useMail = true

    // OpenId
    /*
    useOpenId = true
    openIdNonceMaxSeconds = 300 // max time between auth start and end
    openIdAttributeExchange {

        active = true			// false: disable attribute exchange completely
        autoRegister = true		// false: user will be redirected to registration
                        // page in any case. useful for solving a captcha.

        // attributes definition (required, optional, preset)
        // attention:
        // supplying "required" attributes here doesn't apply any constraints on the
        // manual registration process the openid auto-registration might fall back to
        required = [
            email: "http://schema.openid.net/contact/email",
            userRealName: "http://schema.openid.net/namePerson"
        ]
        optional = []
        preset = [
            enabled: true
        ]

    }
    */

}
