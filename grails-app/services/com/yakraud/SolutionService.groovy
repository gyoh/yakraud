package com.yakraud

class SolutionException extends RuntimeException {
    String message
    Solution solution
}

class SolutionService implements Serializable {

    boolean transactional = true

    def create(userId, projectId, title, content) {
        def solution = new Solution(
            title: title,
            content: content)
        def user = User.get(userId)
        def project = Project.get(projectId)
        if (user && project) {
            user.addToSolutions(solution)
            project.addToSolutions(solution)
            if (user.save()) {
                return solution
            } else {
                throw new SolutionException(
                    message: "Invalid or empty solution", solution: solution)
            }
        }
        throw new SolutionException(message: "Invalid username")
    }

}
