.PHONY: build up down shell init install start web

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

install:
	docker compose exec expo npm install

start:
	docker compose exec expo npx expo start

web:
	docker compose exec expo npx expo start --web

web-build:
	docker compose exec expo npx expo export:web
