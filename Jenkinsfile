pipeline {
    agent any

    parameters {
        string(
            name: 'RELEASE_VERSION'
        )
        string(
            name: 'RELEASE_DESCRIPTION',
            defaultValue: ''
        )
    }

    stages {
        stage('Build') {
            steps {
                sh 'python setup.py sdist'
            }
        }
        stage('Deploy Stage') {
            when { branch "main" }
            steps {
                echo 'Deploying...'
            }
        }
        stage('Deploy PROD') {
            when { tag "*.*.*" }
            steps {
                echo 'Deploying...' 
            }
        }
        // stage('Create release on Github and upload artifacts') {
        //     when { tag "v*" }

        //     steps {

        //         withCredentials([string(credentialsId: 'jenkins-release-token', variable: 'JENKINS_TOKEN')]) {
        //             script {


        //                 def release_curl_command = "curl -XPOST -H 'Authorization:token ${JENKINS_TOKEN}' " +
        //                     "--data '{\"tag_name\": \"${env.TAG_NAME}\", \"name\": \"Release ${env.TAG_NAME}\", \"body\": \"${release_notes}\", \"draft\": false, \"prerelease\": false }'"+
        //                     "https://api.github.com/repos/jramcast/versioning/releases"

        //                 release = sh(returnStdout: true, script: release_curl_command).trim()

        //                 if (release.contains("already_exists")) {
        //                     release_curl_command = "curl -H 'Authorization:token ${JENKINS_TOKEN}' https://api.github.com/repos/jramcast/versioning/releases"
        //                     releases = sh(returnStdout: true, script: release_curl_command).trim()

        //                     def existing_release_props = readJSON text: "${releases}"
        //                     def existing_release_id = ""
        //                     existing_release_props.any { release ->
        //                         if (release.tag_name == "${env.TAG_NAME}") {
        //                             existing_release_id = release.id
        //                             return true
        //                         }
        //                     }
        //                     release_curl_command = "curl -X DELETE -H 'Authorization:token ${JENKINS_TOKEN}' https://api.github.com/repos/jramcast/versioning/releases/${existing_release_id}"
        //                     release = sh(returnStdout: true, script: release_curl_command).trim()

        //                     release_curl_command = "curl -XPOST -H 'Authorization:token ${JENKINS_TOKEN}' -H 'Content-Type: application/json; charset=utf-8' --data '{\"tag_name\": \"${env.TAG_NAME}\", \"name\": \"Release ${env.TAG_NAME}\", \"body\": \"${params.RELEASE_DESCRIPTION}\", \"draft\": false, \"prerelease\": false }' https://api.github.com/repos/jramcast/versioning/releases"
        //                     release = sh(returnStdout: true, script: release_curl_command).trim()
        //                 }

        //                 def release_props = readJSON text: "${release}"
        //                 release_id = release_props.id

        //                 def file_name = findFiles(glob: '**/ge-validator-*-runner')[0].name

        //                 sh "upx -7 -q build/*-runner"

        //                 def asset_name = file_name.replace( "runner", "linux" )

        //                 dir( 'build' ) {
        //                     sh "curl -X POST -H 'Authorization:token ${JENKINS_TOKEN}' -H 'Content-Type:application/octet-stream' --data-binary @${file_name} https://uploads.github.com/repos/jramcast/versioning/releases/${release_id}/assets?name=${asset_name}"
        //                 }
        //             }
        //         }

        //         script {
        //             image = docker.build("${CONTAINER_IMAGE}:${env.TAG_NAME}", "-f Containerfile .")

        //             withDockerRegistry([url: "https://quay.io/", credentialsId: "rht_jenkins_quay"]) {
        //                 image.push("${env.TAG_NAME}")
        //             }

        //             sh "docker rmi ${CONTAINER_IMAGE}:${env.TAG_NAME}"
        //         }
                
        //     }
        // }
    }
}