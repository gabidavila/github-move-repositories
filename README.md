# Github Transfer Ownership Tool

This is just a hack to transfer repositories between users or GitHub organizations. It was created because the current API does not support transfer of repositories.

Use this **at your own risk**. Currently this package moves **all** public repositories to _destination user_. Private repositories aren't affected. If you want to customize which repositories are moved, change the `repositories` variable in the `spec/github.rb` file.

# Requirements

* Ruby 2.2+
* Mozilla's [geckodriver](https://github.com/mozilla/geckodriver/releases). If you use Mac OS and have `brew`, run `brew install geckodriver`.
* [rspec](https://github.com/rspec/rspec)
* You need to **disable** Two-Factor authentication on Github for this to work
* GitHub's: username, password and [access token](https://github.com/settings/tokens). It is recommended to create a new personal token and delete it afterwards.

## How to move between repositories

1. Copy the `.env.example` to `.env`
2. Fill the `.env` file with the required fields, (remember, 2FA should be disabled)
3. Run `bundle install` 
4. Run `rspec spec/github.rb` on the root folder of this project

## Observations

The `.env` files are not tracked by default in this repository, do not put your data inside `.env.example` and push it. Change your password before and after the usage of this package.

## License

This repository is covered under the [MIT license](LICENSE.md)