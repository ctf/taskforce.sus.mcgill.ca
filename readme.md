[Computer taskforce](http://taskforce.sus.mcgill.ca)
====================================================

Source code of the user-facing website for McGill's computer taskforce.

Uses Jekyll to generates a static website in the `_site/` directory which can then be deployed using any web server.

Dependencies
------------

* [Jekyll](https://github.com/mojombo/jekyll), with [rdiscount](https://github.com/rtomayko/rdiscount) for Markdown - both are installable using [rubygems](http://rubygems.org/)
* [Bootstrap 1.4](http://bootstrapdocs.com/v1.4.0/docs/), a frontend development framework released by Twitter (don't need to install anything for this)
* [Less.js](http://lesscss.org/), the node module, for generating the CSS from the LESS files
* [Fabric](http://fabfile.org/), to streamline some common commands and deployment (optional)

Building
--------

* Run `jekyll` in the root of the repository. This will generate the site in the _site/ directory.
* Use the less.js node module to compile the LESS files and save the resulting CSS file as `_site/css/style.css`:

```
lessc css/styles.less -x > _site/css/style.css
```

If you have fabric installed, you can use the included `fabfile.py` (just run `fab prepare`). Ensure that the `lessc` binary (found in `/usr/local/lib/node_modules/less/bin/` on my machine; YMMV) is in your path. Ignore the archive/transfer/etc options; those are just there to make it easier for me to deploy the site.

### Editing content

Most of the content is stored in the *.md files in the root of this directory and is formatted using [Markdown](http://daringfireball.net/projects/markdown/syntax).

### Editing layouts

The HTML files that determine the layout of the site can be found in the _layouts and the _includes directories. The `layout` attribute of a page (as configured in the [YAML front matter block](https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter) of a .md file) determines which file in _layouts is used to display the page. For example, if the layout specified for test.md is `default`, then the generated page test.html will use _layouts/default.html for its layout file. The files in _includes are used in conjunction with the `{{ "{% include %}" }}` tag, which is part of Liquid (the templating language used - see the [Liquid for designers](https://github.com/shopify/liquid/wiki/liquid-for-designers) documentation for more information).

### Editing the CSS

The stylesheet files can all be found under the css directory. [LESS](http://lesscss.org/#docs) is used, with server-side compilation (see the instructions for [building](#building) above). All the site-specific styles are defined in css/taskforce.less; all the other LESS files are those included with [Bootstrap 1.4](http://bootstrapdocs.com/v1.4.0/docs/).

Contributing
------------

Fork/clone this repository on either GitHub or the CTF Gitorious installation and send a pull/merge request when you're done. See the [Contributor guidelines](/dellsystem/ctf-website/wiki/Contributor-guidelines) page on the wiki for more information.

Licensing
---------

The content belongs to Computer Taskforce. The images were taken from the KDE and Gnome icon sets, or were released under a license that permits usage without attribution, or were created by myself and released under the same sort of license (see the [Image sources](/dellsystem/ctf-website/wiki/Image-sources) page for details). The Bootstrap and jQuery files are available under their respective licenses (well, Apache for both), and the rest (Javascript, Ruby) of the code is MIT-licensed.
