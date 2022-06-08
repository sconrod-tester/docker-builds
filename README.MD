#Required to Manually bump the tag.
#To Do: Add in Tag Bump
Each Docker File version has its own branch
bump_aliases is set to true
When Alias is bumped, the upstream pipelines consuming the new version need to be updated

Use the Params file for docker build pipelines

If testing locally...so systemctl will work.....
docker run -d -p 80:8080/tcp --privileged=true fcea073246ad /usr/sbin/init