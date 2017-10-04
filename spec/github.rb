require_relative 'spec_helper'
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

def is_fork?(repo)
  repo[:fork]
end

def selected_fork_origin?(repo)
  REPO_OPTIONS[:forked_from].include?(repo[:parent][:login])
end

def excluded_repo?(repo)
  REPO_OPTIONS[:exclude].include?(repo[:name])
end

def included_repo?(repo)
  REPO_OPTIONS[:include_only].include?(repo[:name])
end

def filter_repositories
  GITHUB[:all_forks] ? @repositories.keep_if { |repo| is_fork?(repo) } : nil
  REPO_OPTIONS[:forked_from].any? ? @repositories.keep_if { |repo| selected_fork_origin?(repo) } : nil
  REPO_OPTIONS[:exclude].any? ? @repositories.delete_if { |repo| excluded_repo?(repo) } : nil
  REPO_OPTIONS[:include_only].any? ? @repositories.keep_if { |repo| included_repo?(repo) } : nil
end

describe 'the authentication process', :type => :feature do
  Octokit.auto_paginate = true
  github_client = Octokit::Client.new(access_token: GITHUB[:access_token])
  @repositories = github_client.repositories GITHUB[:origin_user]

  filter_repositories

  let(:urls) {
    @repositories.collect do |repo|
      "/#{repo.full_name}/settings"
    end
  }

  it 'transfers repo' do
    login
    urls.each.with_index do |url, i|
      moveRepository(url, @repositories[i])
    end
  end
end
