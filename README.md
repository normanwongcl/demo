## Future Todo
- What I will be adding if I have more time: [Futuretodo.md](./Futuretodo.md)

## Requirement
- The requirements for this assessment can be found in [Requirements.md](./Requirements.md)

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

# To run requirement 1
```bash
rails console

# When you see irb(main):001:0>
# You can run the following command to get the result
load 'generate_monthly_payslip.rb'
generate_monthly_payslip("John",60000)

# Expected result:
#
# Monthly Payslip for: Hogn
# Gross Monthly Income: $5000.00
# Monthly Income Tax: $500.00
# Net Monthly Income: $4500.00
```

# Requirement 2,3
```bash
# Send a POST request to salaries endpoint
curl --header "Content-Type: application/json" --request POST --data '{"name": "Ren", "annual_amount": "60000"}' http://localhost:3000/api/v1/salaries -v

# For requirement 3, 4 you can run the following command to get back the data stored
curl http://localhost:3000/api/v1/salaries -v
```
# Requirement 4
```bash
# Send a GET Request to get back a JSON response
curl http://localhost:3000/api/v1/salaries -v
```
# Requirement 2,3,4
```bash
# To show the routes that I created
rails routes | grep salaries
```