# Github Transfer Ownership Tool

This is just a hack to transfer repositories between users or GitHub organizations. It was created because the current API does not support transfer of repositories.

Use this **at your own risk**. Currently this package moves **all** public repositories to _destination user_, unless specified condition `ONLY_FORKS` equal to `true`. Private repositories aren't affected. If you want to customize which repositories are moved, change the `repositories` variable in the `spec/github.rb` file. Probably around this part:

```ruby
if ['true', 1, true].include?(GITHUB[:only_forks])
  repositories = repositories.select do |repo|
    repo[:fork]
  end
end
```

# Requirements

* Ruby 2.2+
* Mozilla's [geckodriver](https://github.com/mozilla/geckodriver/releases). If you use Mac OS and have `brew`, run `brew install geckodriver`.
* [rspec](https://github.com/rspec/rspec)
* You need to **disable** Two-Factor authentication on Github for this to work
* GitHub's: username, password and [access token](https://github.com/settings/tokens). It is recommended to create a new personal token and delete it afterwards.

## How to move between repositories

1. Copy the `.env.example` to `.env`
2. Fill the `.env` file with the required fields, (remember, 2FA should be disabled). `GITHUB_USER_TO_MOVE_REPOSITORIES_FROM` and `GITHUB_USER_TO_MOVE_REPOSITORIES_TO` receives the **username**, not the profile URL.
3. `ONLY_FORKS` filters the repositories to transfer only **forks**
4. Run `bundle install`
5. Run `rspec spec/github.rb` on the root folder of this project

## Observations

The `.env` files are not tracked by default in this repository, do not put your data inside `.env.example` and push it. Change your password before and after the usage of this package.

Already cloned repositories may give you a permission error when trying to push because it is trying to access the previous URL for the repository, to update on your local clone, run:

```
$ git remote --set-url http://github/{my-org}/{repository-name}
```

## License

This repository is covered under the [MIT license](LICENSE.md)
