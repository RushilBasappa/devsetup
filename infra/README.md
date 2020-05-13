
To generate kubeconfig for CI/CD
`wget -O - https://raw.githubusercontent.com/gravitational/teleport/master/examples/gke-auth/get-kubeconfig.sh | bash`
`kubectl create configmap kubeconfig --from-file=kubeconfig`

