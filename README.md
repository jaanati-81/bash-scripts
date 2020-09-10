# bash-scripts
Scripts to configure hadoop project on a cluster
This repository has a set of scripts witten in bash that makes it easy to connect to nodes in the cluster and action commands.

Scripts are provided for the following:
-configuring /etc/hosts file at all nodes (in case you add/delete nodes from the cluster)
-connect to all nodes and do basic tasks like deletign hadoop storage directories and logs (this is needed if you want to restart the cluster after formatting it to avoid NameSpaceID issue)
-configue new hadoop project and make all required settings ready to start the cluster with the new version of the project (after a new build to effect changes made to hadoop modules)



  
