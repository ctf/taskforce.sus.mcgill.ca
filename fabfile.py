from fabric.api import local, run, env

PATH_TO_LESS = '/var/www/taskforce/node_modules/less/bin/lessc'

# Usage: fab cs deploy to deploy to http://cs.mcgill.ca/~wliu65/taskforce

# Environments

def cs():
	env.hosts = ['wliu65@linux.cs.mcgill.ca']

# Commands

def prepare():
	local('jekyll')
	local('%s css/styles.less -x > _site/css/style.css' % PATH_TO_LESS)
	local('rm _site/css/*.less')

def archive():
	local('tar cvzf taskforce.tar.gz _site')

def transfer():
	local('scp taskforce.tar.gz %s:~' % env.hosts[0])
	run('tar xvzf taskforce.tar.gz')
	run('rm -rf public_html/taskforce')
	run('mv _site public_html/taskforce')

def deploy():
	prepare()
	archive()
	transfer()
