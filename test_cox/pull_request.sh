#!/bin/bash

# Set GitHub Personal Access Token and GitHub host
export GH_PAT="your_github_personal_access_token"
export GH_HOST="github.com"

# GitHub API endpoint for listing open pull requests
api_url="https://$GH_HOST/api/v3/search/issues?q=is:pr+is:open"

# Make HTTP GET request to GitHub API and parse JSON response
curl -s -H "Authorization: token $GH_PAT" "$api_url" | jq -r '.items[] | [.html_url, .title, .user.login] | @tsv'

exit 0
