FROM bioboxes/biobox-minimal-base@sha256:a113a86e849b802b5d678c4d9a4fd18f10acc48630edba2754492261c60d67a7

ADD image/bin     /usr/local/bin
ADD image/include /usr/local/include

RUN install_bbmap.sh && rm /usr/local/bin/install_bbmap.sh

ENV TASKFILE    /usr/local/include/Taskfile
