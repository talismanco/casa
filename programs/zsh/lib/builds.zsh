####################################
# Quick Build Directory Navigation #
####################################

declare -A organizations

organizations[m]="misc"
organizations[mir]="mirror"
organizations[sc]="sam.craig"
organizations[t]="talisman"
organizations[v]="vaynerx"

# Navigate to the project in the designated organization,
function bd() {
	local organization=$organizations[$1]
	local project=$2

	cd $HOME/builds/${organization}/${project}
}
