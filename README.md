# host-verify
verify an arbitrary list of hosts and rule them in or out

This script was built when a user requested access to over 200 new hosts, loosely grouped. This script effectively parses the input list into 1 of 2 output lists; hostnames are accompanied by domain names or they are not.
1. If they are not, they can't be processed until they are further verified.
2. If so, they are at least reachable.

