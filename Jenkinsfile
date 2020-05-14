def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(
    label: label,
    containers: [
        containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
        containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', ttyEnabled: true, command: 'cat')
    ],
    volumes: [
        configMapVolume(mountPath: '/root/.kube', configMapName: 'kubeconfig'),
        hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
        secretVolume(mountPath: '/etc/gcp', secretName: 'jenkins-gcp-service-account'),
    ]
) {
    node(label) {
        def CONTAINER_REGISTRY_PATH = "gcr.io/groovy-student-275113"
        def K8S_DEPLOYMENT_NAME = 'sampleapi'

        stage('Checkout'){
            checkout(
                [
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [[$class: 'WipeWorkspace']],
                    submoduleCfg: [],
                    userRemoteConfigs: [[url: 'https://github.com/RushilBasappa/devsetup.git']]
                ]
            )
        }
        stage('Build docker image for sample api'){
            container('docker') {
                dir("sample_api"){
                    sh "docker login -u _json_key --password-stdin https://gcr.io < /etc/gcp/credentials.json"
                    sh "docker build -t ${CONTAINER_REGISTRY_PATH}/users:${env.BUILD_ID} ."
                    sh "docker push ${CONTAINER_REGISTRY_PATH}/users:${env.BUILD_ID}"
                }
            }
        }
        stage('Update Deployment'){
            container('kubectl') {
                sh "kubectl set image deployment/${K8S_DEPLOYMENT_NAME} users=${CONTAINER_REGISTRY_PATH}/users:${env.BUILD_ID} -n sampleapi"
            }
        }
    }
}
