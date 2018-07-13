# Data Science Portal
This portal is a web server that allow a data scientist to create a stack that will be only reserved to him and no one else will have access.

This server is executing the Makefile on the parent folder and setting the parameter that the data scientist have set on the web page.

**This is currently under development is not working yet**

## TODO
- Add the following fields to the web page: password
- Generate the namespace name randomly
- Save the stack and the namespace in Dynamodb (or similar)
- Allow the data scientist to get the link of Jupyter and the spark UI directly in the portal
- Make this server able to work and deploy things directly from a container (currently it requires to be executed locally)
- [Think to other ideas]