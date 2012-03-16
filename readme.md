[Computer taskforce](http://taskforce.sus.mcgill.ca)
====================================================

Source code of the user-facing website for McGill's computer taskforce.

Uses Jekyll to generates a static website in the `_site/` directory which can then be deployed using any web server.

Dependencies
------------

* [Jekyll](https://github.com/mojombo/jekyll), with [rdiscount](https://github.com/rtomayko/rdiscount) for Markdown - both are installable using [rubygems](http://rubygems.org/)
* [Bootstrap 1.4](http://twitter.github.com/bootstrap/) (don't need to install anything for this)
* [Less.js](http://lesscss.org/), the node module, for generating the CSS from the LESS files
* [Fabric](http://fabfile.org/), to streamline some common commands and deployment (optional)

Building
--------

* Run `jekyll` in the root of the repository. This will generate the site in the _site/ directory.
* Use the less.js node module to compile the LESS and save the resulting CSS file as `_site/css/style.css`

If you have fabric installed, you can use the included `fabfile.py` (just run `prepare`). Ensure that the `lessc` binary (found in `/usr/local/lib/node_modules/less/bin/` on my machine; YMMV) is in your path. Ignore the deploy option, that's just for me.

Contributing
------------

Fork/clone this repository on either GitHub or the CTF Gitorious and send a pull/merge request when you're done. See the [Contributor guidelines](/dellsystem/ctf-website/wiki/Contributor-guidelines) page on the wiki for more information.

Licensing
---------

The content belongs to Computer Taskforce. The images were taken from the KDE and Gnome icon sets, or were released under a license that permits usage without attribution, or were created by myself and released under the same sort of license (see the [Image sources](/dellsystem/ctf-website/wiki/Image-sources) page for details). The Bootstrap and jQuery files are available under their respective licenses (well, Apache for both), and the rest (Javascript, Ruby) of the code is MIT-licensed.
