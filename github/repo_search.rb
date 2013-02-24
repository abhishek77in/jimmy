require 'github_api'

github = Github.new
keyword = "ruby"

repos = github.search.repos keyword: keyword 
# http://developer.github.com/v3/search/#search-repositories
# returns 100 results by default, option=lang
repo = repos.first

# REPO DETAILS
# "type": "repo",
# "created": "2011-09-05T11:07:54-07:00",
# "watchers": 2913,
# "has_downloads": true,
# "username": "mathiasbynens",
# "homepage": "http://mths.be/dotfiles",
# "url": "https://github.com/mathiasbynens/dotfiles",
# "fork": false,
# "has_issues": true,
# "has_wiki": false,
# "forks": 520,
# "size": 192,
# "private": false,
# "followers": 2913,
# "name": "dotfiles",
# "owner": "mathiasbynens",
# "open_issues": 12,
# "pushed_at": "2012-06-05T03:37:13-07:00",
# "score": 3.289718,
# "pushed": "2012-06-05T03:37:13-07:00",
# "description": "sensible hacker defaults for OS X",
# "language": "VimL",
# "created_at": "2011-09-05T11:07:54-07:00
