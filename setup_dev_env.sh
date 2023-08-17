
PYTHON_VERSION=3.9.5

echo "Setup python pyenv..."
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
else
  echo ""
  echo "[ERROR] Missing pyenv!"
  echo ""
  echo "> Please refer to install it: https://github.com/pyenv/pyenv#installation"
  echo ""
  exit 1
fi

pyenv install $PYTHON_VERSION
pyenv local $PYTHON_VERSION

echo "Installing pipenv..."
# Ref: https://docs.python-guide.org/dev/virtualenvs/
python3 -m pip install --user pipenv

echo "Installing project dependencies..."
pipenv install

echo "Configuring github pre-commit hooks..."
pipenv run pre-commit install

echo "All ready to start coding :)"
echo ""
