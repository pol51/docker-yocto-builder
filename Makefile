GIT_CONFIG_USER_NAME:=$(shell git config user.name)
GIT_CONFIG_USER_EMAIL:=$(shell git config user.email)

docker:
	echo $(GIT_CONFIG_USER_EMAIL)
	docker build \
		--build-arg git_config_user_name="$(GIT_CONFIG_USER_NAME)" \
		--build-arg git_config_user_email="$(GIT_CONFIG_USER_EMAIL)" \
		-t yocto:latest \
		. 

.PHONY: docker
