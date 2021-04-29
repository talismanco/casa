######################
# Kubernetes Aliases #
######################

# General aliases
alias kb="kubectl"
alias kbci="kubectl cluster-info"
alias kba="kubectl get all"

# Prune an entire namepsace
function kbrm() {
	kubectl delete "$(kubectl api-resources --namespaced=true --verbs=delete -o name | tr "\n" "," | sed -e 's/,$//')" --all "$@"
}