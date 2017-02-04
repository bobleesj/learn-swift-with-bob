
PaaS is primarily a development and deployment platform that is responsible for executing the code and managing the application runtime.

PaaS provisions the application and connects it with services like in-memory cache and databases. It then throws a URL where the application becomes available.


BaaS exposes the right endpoints for developers to consume relevant services within their applications. BaaS is not expected to manage the application runtime and execution. It is left to the developers.


IaaS - Infrastructure as a Service
Provides access to computing resources in a virtualized environment. Basically users of IaaS will receive virtual servers that they will manage:

AWS - One of the oldest cloud providers and according to Gartner Magic Quadrant has most of the market share. For new customers they offer a Free Tier that enables them to use it freely for 1 year with some limited resources. For a new application or website with few users, the resources should be more than enough.
Azure - Microsoft cloud solution is intensively promoted and has a large base of customers, most notably Apple. The solution is not limited to Microsoft products and can be used on any OS's like Linux.
Google Compute Engine - The new kid on the block, is stable and lowering the price continuously. Their datacenter is limited at this time only to a few countries but expanding.



PaaS - Platform as a Service
Is a form of cloud computing that provides a platform (runtime) and environment to allow developers to build applications.

One of the advantages of PaaS is that there is no need to have operations teams to monitor infrastructure. User is focusing only on the application itself. Most notable PaaS providers are Heroku, Google App Engine, IBM Bluemix, OpenShift, SalesForce.

We work with all of them but we recommend to use either Heroku, Google App Engine or SalesForce. The choice depends on the application requirements, as some of them have different strengths.

One of the advantages of Google App Engine is the datastore database, a schema-less NoSQL database. Most notable users of GAE are Snapchat, Khan Academy.

Heroku is very friendly for developers but lacks storage so you will need to rely on third parties like Amazon S3.
