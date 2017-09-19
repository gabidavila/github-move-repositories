GITHUB = {
  :access_token => ENV['GITHUB_ACCESS_TOKEN'],
  :login => ENV['GITHUB_USERNAME'],
  :password => ENV['GITHUB_PASSWORD'],
  :only_forks => ENV['ONLY_FORKS'],
  :destination_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_TO'],
  :origin_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_FROM']
}