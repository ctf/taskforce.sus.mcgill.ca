from fabric.api import local, run, put

"""
Usage: `fab deploy` to deploy to http://taskforce.cs.mcgill.ca
"""

def prepare():
	local('jekyll')
	local('lessc css/styles.less -x > _site/css/style.css')
	local('rm _site/css/*.less')
	local('rm -rf _site/.git')
	local('rm _site/fabfile.py _site/fabfile.pyc')

def archive():
	local('tar cvzf taskforce.tar.gz _site')

def transfer():
	put('taskforce.tar.gz', '~/')
	local('rm taskforce.tar.gz')

def unpack():
	run('tar xvzf taskforce.tar.gz')
	run('rm taskforce.tar.gz')
	run('cp -R _site/* ./')

def deploy():
	prepare()
	archive()
	transfer()
	unpack()
