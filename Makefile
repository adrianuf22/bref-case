include .env.aws

config-aws:
	@serverless config credentials -o --aws-profile default --provider aws --key ${AWS_KEY} --secret ${AWS_SECRET}

run: build
	docker run -v `pwd`:`pwd` -w `pwd` --env-file ./.env -it serverless-bref:dev bash

build:
	DOCKER_BUILDKIT=1 docker build -t serverless-bref:dev .

deploy:
	serverless deploy
