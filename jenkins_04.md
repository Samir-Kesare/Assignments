Assignment 4:
Create a Declarative CI pipeline for java based project that contains various stages like
Code checkout
Run below stages in parallel
- Code stability.
- Code quality analysis.
- Code coverage analysis.
Generate a report for code quality & analysis.
Publish artifacts.
Send Slack and Email notifications.
The user should have the option to skip various scans in the build execution. And before publish there should be an approval stage to be set in place to approve or deny the publish and if approved the step should execute and the user should be notified post successful/failed
Repeat the same using Scripted Pipeline.
----------------------------------

DECLARATIVE PIPELINE CODE:

pipeline {
    agent any

    tools {
        maven 'mymvn'
    }
    parameters {
        booleanParam(name: 'skip_test', defaultValue: false, description: 'Set to true to skip the test stage')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/samirkesare/DevOpsCodeDemo.git'
            }
        }

        stage('Parallel Stages') {
            parallel {
                stage('Code Stability') {
                    steps {
                        sh 'mvn test'
                    }
                }

                stage('Code Quality Analysis') {
                    when { expression { params.skip_test != false } }
                    steps {
                        sh 'mvn pmd:pmd'
                        

                    }
                }
                

                stage('Code Coverage Analysis') {
                    steps {
                        jacoco()
                        
                    }
                }
            }
        }
        
        stage('Build Artifact') {
            steps {
                sh 'mvn package'
            }
        }
        
        stage('Approval') {
            steps {
                input message: 'Do you want to proceed with publishing?', ok: 'Approve'
            }
        }

        stage('Publish Artifact') {
            steps {
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
        }

     post {
        success {
            script {
                emailext body: 'Job Succesfully Done', subject: 'Status of job', to: 'samirkesare372@gmail.com'
                slackSend channel: 'jenkin_task', message: 'Job run successfully'
            }
        }
        failure {
            script {
                emailext body: 'Job failed', subject: 'Status of job', to: 'samirkesare372@gmail.com'
                slackSend channel: 'jenkin_task', message: 'Job failed'
            }
        }
    }
}
-------------------

![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/48e58400-5ed6-40bc-9fa2-241b0124ed2c)



