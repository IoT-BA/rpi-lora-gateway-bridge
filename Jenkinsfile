node {
    def image
    stage('Build') {
        echo 'Building..'
        checkout scm
        docker.image('multiarch/qemu-user-static:register').run()
        image = docker.build("iotba/rpi-lora-gateway-bridge")
    }
    stage('Test') {
        image.inside {
            sh "grep 'ENV LORA_GATEWAY_BRIDGE_VERSION' Dockerfile | tr -d '\r' | awk '//{print \$3}' > version"
            sh 'ls -al'
        }
    }
    stage('Deploy') {
        def version = readFile 'version'
        def imageName = image.imageName()
        echo "Deploying version: ${version}"
        sh "docker tag ${imageName} ${imageName}:${version}"

        withCredentials([usernamePassword(credentialsId: 'hub.docker.com', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
            sh "docker login -u='$DOCKER_USER' -p='$DOCKER_PASS'"
            sh "docker push ${imageName}:${version}"
            sh "docker push ${imageName}"
        }
    }
}
