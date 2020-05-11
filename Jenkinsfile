def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(
    label: label, 
    containers: [
        containerTemplate(name: 'busybox', image: 'busybox', ttyEnabled: true, command: 'cat'),
        containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', ttyEnabled: true, command: 'cat')
    ], 
    volumes: [configMapVolume(mountPath: '/root/.kube', configMapName: 'kubeconfig')]
) {
    node(label) {
        stage('Get Host'){
            container('busybox') {
                sh "hostname"
            }
        }
        stage('Get Pods'){
            container('kubectl') {
                sh "kubectl get pods"
            }
        }
    }
}
