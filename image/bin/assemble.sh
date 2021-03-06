#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

TASK=$1
CMD=$(fetch_task_from_taskfile.sh $TASKFILE $TASK)
READS=$(biobox_args.sh 'select(has("fastq")) | .fastq | map(.value) | join(",")')
CONTIGS=${OUTPUT}/contigs.fa

eval ${CMD}

cat << EOF > ${OUTPUT}/biobox.yaml
version: 0.9.0
arguments:
  - fasta:
    - id: tadpole_contigs_1
      value: contigs.fa
      type: contigs
EOF
