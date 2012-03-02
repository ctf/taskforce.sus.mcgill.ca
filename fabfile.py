from fabric.api import local, run, env

# Usage: fab cs deploy to deploy to http://cs.mcgill.ca/~wliu65/taskforce

# Environments

def cs():
	env.hosts = ['wliu65@linux.cs.mcgill.ca']

# Commands

def prepare():
	local('jekyll')
	local('lessc css/styles.less -x > _site/css/style.css')
	local('rm _site/css/*.less')
	local('rm -rf _site/.git')
	local('rm _site/fabfile.py _site/fabfile.pyc')

def archive():
	local('tar cvzf taskforce.tar.gz _site')

def transfer():
	local('scp taskforce.tar.gz %s:~' % env.hosts[0])
	local('rm taskforce.tar.gz')

def unpack():
	run('tar xvzf taskforce.tar.gz')
	run('rm -rf public_html/taskforce')
	run('mv _site public_html/taskforce')

def deploy():
	prepare()
	archive()
	transfer()
	unpack()
