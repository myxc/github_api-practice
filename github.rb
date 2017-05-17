require 'github_api'

class RepoReader
  
  def initialize
    @repo_hash = {}
    #will request and then print details of 10 latest github repos and their last 10 commits.
    @agent = Github.new oauth_token: ENV["gitToken"]
  
  end
  
  def retrieve_info
    @agent.repos.list do |repo|
      repo_name = repo.name 
      @agent.repos.commits.list 'myxc', "#{repo_name}" do |commit| @repo_hash["#{repo_name}"] = commit end
    end
    
    @repo_hash.each_pair do |key, value|
    puts "#{key} contains these commits: #{value}."
    end
    
  end
end

git = RepoReader.new
git.retrieve_info

  