SHELL = bash

init:
	pip install -r requirements.txt
	pip install -e .

test:
	py.test tests/unittest --runslow --cov=glyph --cov-config tox.ini

integration:
	py.test tests --runslow -n8 --cov=glyph --cov-config tox.ini

dev:
	pip install -r requirements.txt
	pip install -r requirements-dev.txt

freeze:
	pip install pip-tools
	pip-compile --output-file requirements.txt requirements-to-freeze.txt

doc:
	make -C doc clean
	make -C doc html

pypi:
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine upload dist/*

environment:
	python doc/make_envyml.py
