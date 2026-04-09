.PHONY: build up down shell init start

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

shell:
	docker compose exec expo bash

init:
	docker compose exec expo npx create-expo-app@latest .

start:
	docker compose exec expo npx expo start
