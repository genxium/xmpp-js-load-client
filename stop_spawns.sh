basedir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

kill $(ps aux | grep "$basedir" | awk '{print $2}')
