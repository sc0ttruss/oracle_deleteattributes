# oracle_deleteattributes

This is an example of how to delete node attributes, in a way that depends on the creation of a template file, to kick off the node attributes deletion.  Be careful on how this is used.  If you absolutely need to delete the node attributes, take out the "action :nothing" in the delete-attributes ruby block and make it the last piece of code that you run in the given recipe.  

It is intended purely for eductation, not for production readiness....


