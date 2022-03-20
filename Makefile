TAG = v0.1.5-0.3.8-bullseye

.PHONY=build
build:
	docker build . -t bloveless/litestream:$(TAG)

.PHONY=push
push: build
	docker push bloveless/litestream:$(TAG)
