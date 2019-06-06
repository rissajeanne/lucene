#!/bin/bash

# Execute this script on *nix systems to stop the solr server. Please read
# the README file that comes with this plugin first to understand how to install
# and configure Solr. You'll find usage examples there, too.
#
# Usage: stop.sh

# Source common variables.
EXEC_PATH=`dirname $0`
source "$EXEC_PATH/script-startup"

# Stop the solr process.
$PLUGIN_DIR/lib/solr/bin/solr stop
