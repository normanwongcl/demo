## Setup 🖥️
- If you are using **Windows 10**, and you have the following setup: WSL2 + Ubuntu 20.04, you can run the following commands

```bash
# Install ruby environment
sudo apt-get install rbenv \
    git-core \ 
    zlib1g-dev \
    libssl-dev \
    libreadline-dev \ 
    libyaml-dev \ 
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \ 
    libffi-dev \
    nodejs \
    yarn
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
rbenv install 3.1.0 
rbenv global 3.1.0
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo "gem: --no-document" > ~/.gemrc
sudo gem install bundler

# Install ruby on rails
gem install rails
rbenv rehash
```

## Runt linter and code formatter
```bash
# Run rubocop to lint code
bundle exec rubocop --lint

# Run rubocop to format code 
bundle exec rubocop --auto-correct
```

## To run project
```bash
# Start development server
rails server

# Open your browser and navigate to localhost:3000
```

## To test project
```bash
# Run unit tests
bundle exec rspec
```
