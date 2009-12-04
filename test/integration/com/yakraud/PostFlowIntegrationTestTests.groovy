package com.yakraud

import grails.test.*

class PostFlowIntegrationTestTests extends WebFlowTestCase {

    def projectController = new ProjectController()

    def getFlow() { projectController.postFlow }

    void testBasicFlow() {
        startFlow()
        assertCurrentStateEquals("displayTerms")
    }
}
