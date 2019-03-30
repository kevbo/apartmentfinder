PYTHON = $(ENV)/bin/python3


deps:
	pipenv install --dev

shell:
	pipenv shell

start: deps
	pipenv run tmuxp load .

serve:
	pipenv run python manage.py runserver 0:8000

test:
	pipenv run coverage erase
	pipenv run coverage run -m unittest
	pipenv run coverage report -m
	pipenv run coverage xml
	pipenv check
	pipenv check --style *.py

ci-install:
	pip install pipenv
	pipenv install --dev --ignore-pipfile

outdated:
	pipenv run pip list --outdated

black-diff: deps
	pipenv run black --diff .

clean:
	pipenv --rm

.PHONY: deps shell start serve clean test coverage pep8 outdated black-diff
