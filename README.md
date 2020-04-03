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
	
