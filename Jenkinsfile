def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true)
]) {
    node(label) {
        stage('Run kubectl') {
            container('kubectl') {
                sh "kubectl get pods"
            }
        }
        stage('Run helm') {
            container('helm') {
                sh "helm list"
            }
        }
    }
}