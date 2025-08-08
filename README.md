# sphinx-docs

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

## Adding or updating repository documentation

Currently the directories in `source/0.3.0/` are managed using
`git sparse-checkout`, and are active mirrors of the `/docs` directory of each
Slinky product.

#### Adding a repository

```bash
cd source/0.3.0
git clone -n --depth=1 --filter=tree:0 git@gitlab.com:SchedMD/slinky/slurm-bridge.git
cd slurm-bridge
git sparse-checkout set --no-cone /docs
git checkout
```

#### Updating a repository

# TODO Flesh this out
