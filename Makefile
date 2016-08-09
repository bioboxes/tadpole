env = PATH=./env/bin:${PATH}

build:
	docker build --tag=tadpole .

env:
	@virtualenv -p python3 $@
	@$@/bin/pip install biobox_cli
