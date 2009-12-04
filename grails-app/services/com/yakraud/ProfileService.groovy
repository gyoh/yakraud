package com.yakraud

class ProfileException extends RuntimeException {
    String message
    Profile profile
}

class ProfileService {

    boolean transactional = true

    def save(properties) {
        def user = User.findByUsername(properties.id)
        if (user) {
            def profile = new Profile(properties)
            user.profile = profile
            if (user.save()) {
                return profile
            } else {
                throw new ProfileException(
                    message: "Invalid or empty profile", profile: profile)
            }
        }
        throw new ProfileException(message: "Invalid username")
    }

    def save(userId, photo, bio, homepage, timezone, country) {
        def profile = new Profile(
            photo: photo,
            bio: bio,
            homepage: homepage,
            timezone: timezone,
            country: country
        )
        def user = User.get(userId)
        if (user) {
            user.profile = profile
            if (user.save()) {
                return profile
            } else {
                throw new ProfileException(
                    message: "Invalid or empty profile", profile: profile)
            }
        }
        throw new ProfileException(message: "Invalid username")
    }

}
