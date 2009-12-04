package com.yakraud

import grails.test.*

class UserIntegrationTests extends GrailsUnitTestCase {

    def authenticateService

    void testSave() {
        def user = new User(username: "save",
            userRealName: "Save",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "save@example.com")
        assertNotNull(user.save())
        assertNotNull(user.id)

        def foundUser = User.get(user.id)
        assertEquals("save@example.com", foundUser.email)
    }

    void testSaveAndUpdate() {
        def user = new User(username: "update",
            userRealName: "Update",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "save@example.com")
        assertNotNull(user.save())
        assertEquals("save@example.com", user.email)

        def foundUser = User.get(user.id)
        foundUser.email = "update@example.com"
        foundUser.save()

        def editedUser = User.get(user.id)
        assertEquals("update@example.com", editedUser.email)
    }

    void testSaveThenDelete() {
        def user = new User(username: "delete",
            userRealName: "Delete",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "delete@example.com")
        assertNotNull(user.save())

        def foundUser = User.get(user.id)
        foundUser.delete()

        assertFalse(User.exists(user.id))
    }

    void testEvilSave() {
        def user = new User(username: "evil",
            userRealName: "Evil",
            pass: "pass",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "evil")

        assertFalse(user.validate())
        assertTrue(user.hasErrors())

        def errors = user.errors

        assertEquals("email.invalid", errors.getFieldError("email").code)
        assertEquals("evil", errors.getFieldError("email").rejectedValue)

        assertEquals("size.toosmall", errors.getFieldError("pass").code)
        assertEquals("pass", errors.getFieldError("pass").rejectedValue)

        assertNull(errors.getFieldError("username"))
    }

    void testEvilSaveCorrected() {
        def user = new User(username: "evil",
            userRealName: "Evil",
            pass: "pass",
            passwd: authenticateService.encodePassword("pass"),
            enabled: true,
            email: "evil")

        assertFalse(user.validate())
        assertTrue(user.hasErrors())
        assertNull(user.save())

        user.email = "correct@example.com"
        user.pass = "password"
        user.passwd = authenticateService.encodePassword("password")
        assertTrue(user.validate())
        assertFalse(user.hasErrors())
        assertNotNull(user.save())
    }

}
