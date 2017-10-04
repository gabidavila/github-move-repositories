GITHUB = {
  :access_token => ENV['GITHUB_ACCESS_TOKEN'],
  :login => ENV['GITHUB_USERNAME'],
  :password => ENV['GITHUB_PASSWORD'],
  :all_forks => ENV['ALL_FORKS'],
  :destination_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_TO'],
  :origin_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_FROM']
}

REPO_OPTIONS = {
  :forked_from => ENV['USERS_FORKED_FROM'],
  :exclude => ENV['EXCLUDED_REPOS'],
  :include_only => ENV['INCLUDED_REPOS']
}
