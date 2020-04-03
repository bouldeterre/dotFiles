python_version = 3.8.1
venv_prefix = global
venv_name = ${venv_prefix}-${python_version}

pyenv_instructions=https://github.com/pyenv/pyenv#installation
pyenv_virt_instructions=https://github.com/pyenv/pyenv-virtualenv#pyenv-virtualenv


install_python:
	pip install -r requirements.txt

require_pyenv:
	@if ! [ -x "$$(command -v pyenv)" ]; then\
	  echo  '\n\033[0;31m ❌ pyenv is not installed.  Follow instructions here: $(pyenv_instructions)\n\033[0m';\
	  exit 1;\
	else\
	  echo  "\033[0;32m ✔️  pyenv installed\033[0m";\
	fi
	@if ! [[ "$$(pyenv virtualenv --version)" == *"pyenv-virtualenv"* ]]; then\
	  echo  '\n\033[0;31m ❌ pyenv virtualenv is not installed.  Follow instructions here: $(pyenv_virt_instructions) \n\033[0m';\
	  exit 1;\
	else\
	  echo  "\033[0;32m ✔️  pyenv-virtualenv installed\033[0m";\
	fi


init: require_pyenv  ## Setup a dev environment for local development.
	@pyenv install $(python_version) -s
	@echo "\033[0;32m ✔️  🐍 $(python_version) installed \033[0m"
	@if ! [ -d "$$(pyenv root)/versions/$(venv_name)" ]; then\
		pyenv virtualenv $(python_version) $(venv_name);\
	fi;
	@pyenv local $(venv_name)
	@echo "\033[0;32m ✔️  🐍 $(venv_name) virtualenv activated \033[0m"
	@make -s install_python
	@echo  "\nEnvironment setup! ✨ 🍰 ✨ 🐍 \n\nCopy this path to tell PyCharm where your virtualenv is. You may have to click the refresh button in the pycharm file explorer.\n"
	@echo  "\033[0;32m"
	@pyenv which python
	@echo  "\n\033[0m"
