  pipeline() {

    agent{label 'master'}
    tools {nodejs "NodeJS 8.9.4"}
    options {
        skipStagesAfterUnstable()
    }
    stages{
  stage ('Tests'){
            steps {
                script {
                    img = docker.image("<image from Dockerfile in this project>")
                    img.inside('-u root') {
                        try{
                        git credentialsId: '<git credentials>', poll: false, url: "<project url>", branch: "<branch_name>"
                        sh "chmod 777 -R ."
                        sh "npm install -g grunt-cli"
                        sh "npm config set registry <custom docker registry>"
                        sh "npm set strict-ssl false"
                        sh "cd <project_folder> && npm install"
                        sh "npm install webdriver-manager"
                        sh "npm install protactor"
                        sh "./node_modules/protractor/bin/webdriver-manager update"
                        sh "npm install chromedriver"
                        sh "apt-get upgrade -y google-chrome-stable"
                        sh "npm run e2e" //running tests from e2e script defined in package.json
                        sh "rm -rf *" //clean workspace
                        }catch(e){
                        println("Error in test execution")
                        sh "rm -rf *"
                        }

                    }
               }
               
           }
                }
            }

        }
