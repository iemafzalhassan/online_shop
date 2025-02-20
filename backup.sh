#this is backup of dockewr file 
#
#

src=$1
dest=$2

timestpam=$(date '+%Y-%m-%d:%H:%M:%S')
zip -r "$dest/Backup-$timestamp.zip" $src >/dev/null
