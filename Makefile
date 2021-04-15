#!/usr/bin/make -f
# Copyright (c) 2020 Red Hat Training <training@redhat.com>
#
# All rights reserved.
# No warranty, explicit or implied, provided.
#
# You MUST define the PS_PASSWD variable before running that Makefile.
# The variable must be set with the password of the PyPI server.

SHELL=/bin/bash

PYPI_USER=pypi
PYPI_SERVER_DEV=https://pypi.apps.tools.dev.nextcle.com/repository/labs/
PYPI_SERVER_PROD=https://pypi.apps.tools-na.prod.nextcle.com/repository/labs/

DIST_FILES=dist/$(shell ls -1A dist)

default: build

clean:
	-rm -rf dist build .eggs

lint:
	flake8 do400 tests

test:
	python -m pytest

test-unit:
	python -m pytest tests/lib

build: clean
	python setup.py sdist

publish-stage: clean build
ifdef PS_PASSWD
	@twine upload --verbose --repository-url ${PYPI_SERVER_DEV} -u ${PYPI_USER} -p $(PS_PASSWD) ${DIST_FILES}
else
	$(error The PS_PASSWD environment variable is not set. Please set it with the password of the stage PyPI server.)
endif

publish-prod: clean build
ifdef PS_PASSWD_PROD
	@twine upload --verbose --repository-url ${PYPI_SERVER_PROD} -u ${PYPI_USER} -p $(PS_PASSWD_PROD) ${DIST_FILES}
else
	$(error The PS_PASSWD_PROD environment variable is not set. Please set it with the password of the production PyPI server.)
endif
