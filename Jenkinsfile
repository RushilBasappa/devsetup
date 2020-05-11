def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(
    label: label, 
    containers: [
        containerTemplate(name: 'busybox', image: 'busybox', ttyEnabled: true, command: 'cat'),
        containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
        containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', ttyEnabled: true, command: 'cat')
    ], 
    volumes: [configMapVolume(mountPath: '/root/.kube', configMapName: 'kubeconfig')]
) {
    node(label) {
        stage('Build docker image for sample api'){
            container('docker') {
                sh "cd sample_api"
                sh "docker build ."
                sh "tail -f /dev/null"
            }
        }
        stage('Get Pods'){
            container('kubectl') {
                sh "kubectl get pods"
            }
        }
    }
}
