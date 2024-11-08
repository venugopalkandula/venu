#!/bin/bash
helper()
#Github API URL
 API_URL="https://api-github.com"
#Github username and personal access token 
 USERNAME = $username
 TOKEN  = $token
#User and Repository information
 REPO_OWNER =$1
 REPO_OWNER =$2
#Funtion to make a GET request to the the Github API
 Funtion github_api_get{
   local endpoint="$1"
   local url="${API_UPI}/${Endpoint}"
   #Send a GET request to the Github API with authentication
   Curl -s -u "${USERNAME}: ${TOKEN}" "$url"
}
#Funtion to list users with read access to the repository
 Funtion list_users_with_read_access{local enpoint="repos/${REPO_OWNER}/${REPO_NAME}/Collaborators"
 #fetch the list of collaborators on the repository
 Collaborators="$(github_api_get"$endpoint"|jq -r'.[] |select(permissions.pull == true)|.login')"
#Display the list of collaboratour with read access
 if [[-Z"$Collaborators"]]; 
 then
   echo "No users with read access found for ${REPO_OWNER} / $ {REPO_NAME} "
    else
   echo "users with read access to ${REPO_OWNER}/${REPO_NAME}:"
   echo"$Collaborators"
 fi
}
function 
helper{Expected_cmd_args=2 
if [$# -ne $Expected_cmd_args]; 
then
echo"Please execute the script with required cmd args"echo"asd"}
#main script
echo "Listing users with red access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
