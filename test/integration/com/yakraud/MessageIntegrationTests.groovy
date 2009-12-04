package com.yakraud

import grails.test.*

class MessageIntegrationTests extends GrailsUnitTestCase {

    def authenticateService

    void testSendingMessage() {
        def owner = new User(username: "owner",
            userRealName: "Owner",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "owner@example.com")
        def project = new Project(title: "Project",
                                   description: "Project description goes here.",
                                   reward: 20000,
                                   deadline: new Date())
        owner.addToOwnedProjects(project)
        assertNotNull(owner.save())

        def member = new User(username: "member",
            userRealName: "Member",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "member@example.com")
        project.addToMembers(member)
        assertNotNull(member.save())

        def message1 = new Message(title: "Message 1", content: "Message 1 content goes here.")
        message1.addToRecipients(member)
        owner.addToSentMessages(message1)
        project.addToMessages(message1)

        def message2 = new Message(title: "Message 2", content: "Message 2 content goes here.")
        message2.addToRecipients(owner)
        member.addToSentMessages(message2)
        project.addToMessages(message2)

        def foundUser = User.get(owner.id)
        def sentTitles = foundUser.sentMessages*.title
        assertEquals([ "Message 1" ], sentTitles.sort())
        def receivedTitles = foundUser.receivedMessages*.title
        assertEquals([ "Message 2" ], receivedTitles.sort())

        foundUser = User.get(member.id)
        sentTitles = foundUser.sentMessages*.title
        assertEquals([ "Message 2" ], sentTitles.sort())
        receivedTitles = foundUser.receivedMessages*.title
        assertEquals([ "Message 1" ], receivedTitles.sort())
    }

}
