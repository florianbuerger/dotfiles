# Extension for zsh that cd to a simulator data container of the app with the given bundle identifier. 
# Thanks, Simon https://skagedal.github.io/2018/01/02/simcd.html

function simdir () { 
	xcrun simctl get_app_container booted $1 data 
}

function simcd () {
	cd `simdir $1`
}

function simpushd () { 
	pushd `simdir $1` 
}

function simopen() {
	open `simdir $1`
}

function _bundle_identifiers () {
	xcrun simctl listapps booted | grep CFBundleIdentifier | cut -d '=' -f 2 | grep -oE '[a-zA-Z0-9.-]+'
}

_simdir() {
	local state

	_arguments \
		'1: :->bundle_identifier'\
		'*: :->rest'

	case $state in
		(bundle_identifier) _arguments '1:Bundle identifier:($(_bundle_identifiers))' ;;
              	(*) compadd "$@"
  	esac
  }

compdef _simdir simdir simcd simpushd simopen
