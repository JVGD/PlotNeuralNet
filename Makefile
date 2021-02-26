SHELL=/bin/bash

default: test

build:
	docker build \
		--build-arg UID=${UID} \
		-t plotneuralnet:latest \
		-f Dockerfile .

dev: build
	docker rm -f plotneuralnet || true
	docker run \
		-ti  \
		-d \
		-v $$(pwd):/workdir \
		--name plotneuralnet \
		plotneuralnet:latest || true
	docker exec -it plotneuralnet bash || true

test:
	if [ -z "$$FILE" ];	then echo "This should be called as:"; echo "$$ make FILE=/path/to/file"; exit; fi
	docker run --rm -v $$(pwd):/workdir plotneuralnet:latest ${FILE}

.SILENT: