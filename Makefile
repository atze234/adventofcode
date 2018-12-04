IMAGE := adventofcode:latest

start_container:
	docker run \
		--rm \
		-it \
		-v ${PWD}:/go/src/adventofcode \
		--name adventofcode \
	${IMAGE}
build_container:
	docker build -t adventofcode .
