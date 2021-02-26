default: run

build:
	docker build \
		--build-arg UID=${UID} \
		-t plotneuralnet:latest \
		-f Dockerfile .

run: build
	docker rm -f plotneuralnet || true
	docker run \
		-ti  \
		-d \
		-v $$(pwd):/workdir \
		--name plotneuralnet \
		plotneuralnet:latest || true
	docker exec -it plotneuralnet bash || true
