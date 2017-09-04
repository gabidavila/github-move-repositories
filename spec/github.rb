require_relative '../config/environment'
def login
  visit '/login'
  fill_in 'login_field', with: GITHUB[:login]
  fill_in 'password', with: GITHUB[:password]
  click_button 'Sign in'
end

def moveRepository(url, repository)
  visit url
  click_button 'Transfer'
  fill_in 'confirm_repository_name', with: repository[:name]
  fill_in 'confirm_new_owner', with: GITHUB[:destination_user]
  click_button 'I understand, transfer this repository.'
end

describe "the authentication process", :type => :feature do
  Octokit.auto_paginate = true
  github_client = Octokit::Client.new(access_token: GITHUB[:access_token])
  repositories = github_client.repositories GITHUB[:origin_user]

  let(:urls) {
    repositories.collect do |repo|
      "/#{repo.full_name}/settings"
    end
  }

  it "transfers repo" do
    login
    urls.each.with_index do |url, i|
      moveRepository(url, repositories[i])
    end
  end
end