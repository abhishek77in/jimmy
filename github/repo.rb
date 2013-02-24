require 'github_api'

github = Github.new

user_name = ARGV[0]
repo_name = ARGV[1]

# Get a repository
#
# = Examples
#  github = Github.new
#  github.repos.get 'user-name', 'repo-name'

puts "=== START REPO Details ==="
repo = github.repos.get user_name, repo_name
puts repo.to_yaml
puts "=== END REPO Details ===\n\n"


# Get the README
#
# This method returns the preferred README for a repository.
#
# = Examples
#  github = Github.new
#  github.repos.contents.readme 'user-name', 'repo-name'

puts "=== START REPO README ==="
repo = github.repos.contents.readme user_name, repo_name
puts repo.to_yaml
puts "=== END REPO README ===\n\n"

# Get archive link
#
# This method will return a 302 to a URL to download a tarball or zipball
# archive for a repository. Please make sure your HTTP framework is configured
# to follow redirects or you will need to use the Location header to make
# a second GET request.
#
# Note: For private repositories, these links are temporary and expire quickly.
#
# = Parameters
# * <tt>:archive_format</tt> - Required string - either tarball or zipball
# * <tt>:ref</tt> - Optional string - valid Git reference, defaults to master
#
# = Examples
#  github = Github.new
#  github.repos.contents.archive 'user-name', 'repo-name',
#    "archive_format" =>  "tarball",
#    "ref" => "master"
#

# List contributors
#
# = Parameters
#  <tt>:anon</tt> - Optional flag. Set to 1 or true to include anonymous contributors.
#
# = Examples
#
#  github = Github.new
#  github.repos.contributors 'user-name','repo-name'
#  github.repos.contributors 'user-name','repo-name' { |cont| ... }

# List languages
#
# = Examples
#  github = Github.new
#  github.repos.languages 'user-name', 'repo-name'
#  github.repos.languages 'user-name', 'repo-name' { |lang| ... }

# List teams
#
# == Examples
#   github = Github.new
#   github.repos.teams 'user-name', 'repo-name'
#   github.repos.teams 'user-name', 'repo-name' { |team| ... }
