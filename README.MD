#Required to Manually bump the tag.
#To Do: Add in Tag Bump
Each Docker File version has its own branch
bump_aliases is set to true
When Alias is bumped, the upstream pipelines consuming the new version need to be updated

****ALWAYS BUMP THE VERSION OR YOU WILL OVERWRITE THE EXISTING IMAGE AND COULD BREAK STUFF***** As many pipelines use this image - tagging is critical.

fly -t prod-ci set-pipeline -c sdwan-ubuntu-pipe.yml -p viptela-sdwan-ubuntu-oci -l /Users/sconrod/dev/cisco-fso-lab-gen/params/sdwan/Docker.yml

For each new OCI container - create a new branch
Create a New Directory and place a copy of the pipeline file and the Dockerfile

Set your docker creds in the params file - this will tell the pipeline to use those creds to push to dockerhub

Copy just the Dockerfile into the root of the repo 