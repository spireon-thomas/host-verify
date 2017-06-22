#!/usr/bin/env bash
# shellcheck disable=SC2162
#  PURPOSE: In the case that someone has requested access/user-accounts on an
#           arbitrary list of hosts, this script will help validate those host
#           names and split them into 1/2 files; they are either good or bad.
#           After that, Chef Knife can be run with confidence.
# -----------------------------------------------------------------------------
#  PREREQS: a) Bash v4; to check: `which bash` --version.
#           b)
#           c)
# -----------------------------------------------------------------------------
#  EXECUTE:
# -----------------------------------------------------------------------------
#     TODO: 1) The ping test became problematic but there is likely a solution.
#           2)
#           3)
# -----------------------------------------------------------------------------
#   AUTHOR: Todd E Thomas
# -----------------------------------------------------------------------------
#  CREATED: 2017/22/06
# -----------------------------------------------------------------------------
set -x


###----------------------------------------------------------------------------
### VARIABLES
###----------------------------------------------------------------------------
# ENV Stuff
declare coDomain='spireon.com'
declare -a remoteHosts=()
# Data Files
declare inputList='myhosts.in'
#declare inputList='myhosts-test.in'
declare hostsBad='hosts-bad.out'
declare hostsGood='hosts-good.out'


###----------------------------------------------------------------------------
### FUNCTIONS
###----------------------------------------------------------------------------
### Limited test to make sure there is more than just a host name and the host
### is pingable.
###---
nameTest() {
    host="$1"
    # Is there an FQDN or no?
    if [[ "$host" != *"$coDomain" ]]; then
        printf '%s\n' "$host will need further verification."
        echo "!domain:$host" >> "$hostsBad"
    else
        printf '%s\n' "The host does hava a domain name."
        remoteHosts+=("$hostName")
        echo "$host" >> "$hostsGood"
        # Is it there?
        #if ! ping -q -c 1 -t1 "$host" > /dev/null 2>&1; then
        #    echo "!ping:$host" >> "$hostsBad"
        #else
        #    printf '%s\n' "$host is pingable too."
        #    echo "$host" >> "$hostsGood"
        #fi
    fi
}

###---
### Verify the array is being populated with the correct data
###---
arrayTest() {
    printf '\n%s\n' "New Element: ${remoteHosts[*]}"
}


###----------------------------------------------------------------------------
### MAIN PROGRAM
###----------------------------------------------------------------------------
### Zero-out the data files for every fresh run
###---
cat /dev/null > "$hostsBad"
cat /dev/null > "$hostsGood"


###---
### Process the list of hosts from the input file
###---
while IFS= read -r hostName; do
    [[ "$hostName" = \#* ]] || \
    [[ -z "$hostName" ]] && continue
    printf '\n%s\n' "Checking: $hostName"
    nameTest "$hostName"
    #arrayTest
done < "$inputList"


###---
### Pull hosts from array and hit them with chef, one at a time
###---
for host in "${remoteHosts[@]}" ; do
    printf '\n%s\n' "Array Host: $host"
    #knife ssh "name:$hostName" 'sudo chef-client -W -o spireon:group_qa' -x tthomas
done


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### REQ
###---


###---
### fin~
###---
exit 0
