# docs

## Getting started

This documentation site uses [Sphinx](https://www.sphinx-doc.org/en/master/)
with the
[PyData Theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/index.html).

To work on this site, you will need to install `sphinx`, `sphinx-autobuild`, and
`pydata-sphinx-theme`. It is recommended that you work within a Python virtual
environment while working on this site.

```bash
python -m venv docs-venv
source docs-venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

Serve the site locally using Python's `http.server` or `sphinx-autobuild`:

```bash
cd build/html
python -m http.server
```

or

```bash
sphinx-autobuild source build/html
```
