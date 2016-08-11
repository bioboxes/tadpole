#!/bin/bash

set -o errexit
set -o xtrace

READS=$1

cd $(mktemp -d)
echo $(tadwrapper.sh in=${READS} out=contigs_%.fa k=65 2>&1 \
	| grep "Recommended K:" \
	| cut -f 2 -d ':' \
	| tr -d "\t")