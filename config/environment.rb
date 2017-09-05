GITHUB = {
  :access_token => ENV['GITHUB_ACCESS_TOKEN'],
  :login => ENV['GITHUB_USERNAME'],
  :password => ENV['GITHUB_PASSWORD'],
  :destination_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_FOR'],
  :origin_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_FROM']
}