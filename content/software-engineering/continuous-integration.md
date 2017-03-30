# Continuous Integration
Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early.

## Benefits
 - Say goodbye to long and tense integrations
 - Increase visibility enabling greater communication
 - Catch issues early and nip them in the bud
 - Spend less time debugging and more time adding features
 - Build a solid foundation
 - Stop waiting to find out if your code’s going to work
 - Reduce integration problems allowing you to deliver software more rapidly

## Practice
 - Maintain a single source repository
 - Automate the build
 - Make your build self-testing
 - Every commit should build on an integration machine
 - Keep the build fast
 - Test in a clone of the production environment
 - Make it easy for anyone to get the latest executable version
 - Everyone can see what’s happening
 - Automate deployment

## How to do it
 - Developers check out code into their private workspaces
 - When done, commit the changes to the repository
 - The CI server monitors the repository and checks out changes when they occur
 - The CI server builds the system and runs unit and integration tests
 - The CI server releases deployable artifacts for testing
 - The CI server assigns a build label to the version of the code it just built
 - The CI server informs the team of the successful build
 - If the build or tests fail, the CI server alerts the team
 - The team fixes the issue at the earliest opportunity
 - Continue to continually integrate and test throughout the project

## Team Responsibilities
 - Check in frequently
 - Don’t check in broken code
 - Don’t check in untested code
 - Don’t check in when the build is broken
 - Don’t go home after checking in until the system builds

# iOS Development
 - Fastlane
 - Jenkins
 - Fabric: Fastlane, Crashlytics, Stripe, Amazon

### Xcode Server
Xcode Server is Apple's continuous integration tool, similar to Jenkins or TravisCI.  You usually use it to run Unit Tests automatically after any team member checks in code to the project's repo.


#### Resources
[Continuous Integration: Improvement Software Quality and Reducing Risk (Book)](http://amzn.to/2oeAEzA)

[Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation (Book)](http://amzn.to/2o4E37f)
