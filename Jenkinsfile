pipeline {
    agent any
    environment {
        APP_NAME = "devopsback"
    }
    stages {
        stage('GIT CHECKOUT') {
            steps {
                checkout scm
            }
        }
        stage('Update manifest') {
            steps {
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        withCredentials([usernamePassword(credentialsId: 'git', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                            //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                            sh "git config --global user.email amitkumar.singh@vsit.edu.in"
                            sh "git config --global user.name AMITSINGHHACKS"
                            //sh "git switch master"
                            sh "cat deployment.yml"
                            sh "sed -i 's+${APP_NAME}.*+${APP_NAME}:${IMAGE_TAG}+g' deployment.yml"
                            sh "cat deployment.yml"
                            sh "git add ."
                            sh "git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'"
                            withCredentials([gitUsernamePassword(credentialsId: 'git', gitToolName: 'Default')]) {
                                sh "git push https://github.com/AMITSINGHHACKS/manifestfullstack HEAD:backend"
                            }
                        }
                    }
                }
            }
        }
    }
}
