dev-build:
	docker build -f docker/dev/Dockerfile -t myapi-frontend:dev .

dev-docker-run: dev-build
	docker run -it --rm -v ${PWD}/app:/app -v /app/node_modules -p 3001:3000 -e CHOKIDAR_USEPOLLING=true myapi-frontend:dev

dev-run: dev-build
	docker-compose -f docker-compose-dev.yml up --build --remove-orphans

build:
	docker build -f docker/prod/Dockerfile -t myapi-frontend:prod .

docker-run: build
	docker run -it --rm -p 1337:80 myapi-frontend:prod

run: build
	docker-compose -f docker-compose-prod.yml up --build --remove-orphans
