# Thomas Smith's Website
This repository contains static HTML and CSS files for Thomas Smith's website.
The site is hosted on GitHub Pages at
[thomasebsmith.github.io](https://thomasebsmith.github.io). It contains
information about Thomas, descriptions of his programming projects, and ways to
contact him.

## Philosophy
- Avoid JavaScript when possible
- Use a simple, consistent color scheme
- Make the site fast and lightweight
- Highlight important content

## Deployment
This site can be deployed by cloning this repository and hosting it as a static
site. Ideally, README.md should be excluded from deployment. The site is
optimized for GitHub Pages but should work in any standard hosting environment.
This site should be hosted at the root of a domain, or else relative URLs
would need to be modified.

For example, to deploy it with Python 3 at http://localhost:8000:
```sh
$ git clone https://github.com/thomasebsmith/thomasebsmith.github.io.git site
$ cd site
$ python3 -m http.server 8000
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
```
Note: This does not exclude README.md from deployment.

## License
This site is **not** released as open-source software. It is source-available;
however, copyright and ownership are retained fully by Thomas Smith.
