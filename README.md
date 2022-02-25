# Thomas Smith's Website
This repository contains the code for Thomas Smith's website.
The site is hosted statically on GitHub Pages at
[thomasebsmith.github.io](https://thomasebsmith.github.io). It contains
information about Thomas, descriptions of his programming projects, and ways to
contact him.

## Deployment
This site can be deployed by cloning this repository, running its build script,
and hosting the build output as a static site. The site is optimized for GitHub
Pages but should work in any standard hosting environment. This site should be
hosted at the root of a domain, or else relative URLs must be modified.

For example, to deploy it with Python 3 at http://localhost:8000:
```sh
$ git clone https://github.com/thomasebsmith/thomasebsmith.github.io.git site
$ cd site
$ make build/release
$ cd build/release/final
$ python3 -m http.server 8000
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
```

## Philosophy
- Use a simple, consistent color scheme
- Make the site fast and lightweight
- Highlight important content
- Make the site cross-browser compatible

## Technical Details
This site uses a combination of Jinja templates and static files.
All templates excluding `base.html` are compiled from `jinja/templates`.
Then, all files in `static` are added to the same folder. These files form
the static site.

## License
This site is **not** released as open-source software. It is source-available;
however, copyright and ownership are retained fully by Thomas Smith.
