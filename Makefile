.ONESHELL:
SHELL := /bin/bash
SRC = $(wildcard ./*.ipynb)

init_repository:
	echo "----- make the repo ready for the new package ------"
	nbdev_install_hooks
	nbdev_export
	nbdev_clean
	rm -rf hpd_nbdev_template _docs _proc docs
	echo "--- (1) REMEMBER to modify the settings.ini --- "
	echo "--- (2) REMEMBER to modify the _quarto.yml --- "
	echo "--- (3) REMEMBER to modify the notebooks --- "

deploy_to_githubpage:
	echo "-----------------START----------------------"
	rm -rf _docs _procs docs
	nbdev_install_hooks
	nbdev_export
	nbdev_clean
	nbdev_docs
	nbdev_readme
	cp -rf _docs docs
	git add *
	git commit -m "deploy htmls to githubpage"
	git push
	echo "------------------DONE---------------------"
