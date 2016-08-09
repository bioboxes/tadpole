env = PATH=./env/bin:${PATH}

ssh: env
	$(env) biobox login short_read_assembler tadpole

build:
	docker build --tag=tadpole .

env:
	@virtualenv -p python3 $@
	@$@/bin/pip install biobox_cli
