all: help

help:
	@echo '✦ pub-get'
	@echo '✦ analyze'

pub-get:
	@fvm flutter pub get

analyze:
	@fvm flutter analyze
