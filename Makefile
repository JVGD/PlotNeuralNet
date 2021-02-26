SHELL=/bin/bash

default: run

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

run:
	if [ -z "$$FILE" ];	then \
		echo "This should be called as:"; \
		echo "$$ make FILE=/path/to/file"; \
	else \
		docker run --rm -v $$(pwd):/workdir plotneuralnet:latest ${FILE}; \
	fi

.SILENT: