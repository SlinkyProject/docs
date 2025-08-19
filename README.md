# docs

## Getting started

This documentation site uses [Sphinx](https://www.sphinx-doc.org/en/master/)
with the
[PyData Theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/index.html).

To work on this site, we have provided a make target that runs
`sphinx-autobuild` in a containerized environment, and serves the development
site on http://127.0.0.1:8000

```bash
make run-docs
```

The docs will be available on: http://127.0.0.1:8000
