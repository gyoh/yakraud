package com.yakraud

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

class ProfileController {

    def authenticateService
    def profileService
    
    def scaffold = true

    @Secured(['ROLE_USER'])
    def myProfile = {
        def user = authenticateService.userDomain()
        user = User.get(user.id)
        [ user: user ]
    }

    @Secured(['ROLE_USER'])
    def editProfile = {
        def user = authenticateService.userDomain()
        user = User.get(user.id)
        [ user: user ]
    }

    @Secured(['ROLE_USER'])
    def saveProfile = {
        def user = authenticateService.userDomain()
        try {
            profileService.save(
                user.id,
                params.photo,
                params.bio,
                params.homepage,
                params.timezone,
                params.country
            )
            flash.message = "Saved new profile for ${user.id}"
        } catch (ProfileException e) {
            flash.message = e.message
        }

        redirect(action: "myProfile", id: params.id)
    }

}
