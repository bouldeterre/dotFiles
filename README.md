# DotFiles
.files

## Emacs ##

  $ M-x package-refresh-contents
	$ M-x package-install helm
	$ M-x package-install-selected-packages

## Atom ##

Export package list:

	$ apm list --installed --bare > atom-package-list.txt

Install packages elsewhere:

	$ apm install --packages-file atom-package-list.txt

## Python global virtualenv ## 

	$ make init
	
## Python pyenv
	
	$ brew install pyenv pyenv-virtualenv
	$ pyenv 
	$ pyenv virtualenv 3.10.7 dotfile-3.10.7
	$ pyenv local dotfile-3.10.7