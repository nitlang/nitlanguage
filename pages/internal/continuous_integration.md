# Continuous integration

A Jenkins instance is running on [[http://gresil.org/jenkins]].

It is mainly used for 3 purposes:

* Automatic tests for feature development and proposal of code. Especially trough the integration with github to validate pull requests.
These are the CI* jobs, especially [[CIGithub|http://gresil.org/jenkins/job/CI_github/]]
* Big integration tests run on the merge of new code in the master branch.
It is the [[nitnext|http://gresil.org/jenkins/job/nit_next/]] job and its subjobs
* Deployment of artefacts (eg. nitdoc) when the master branch is updated.
It is the [[nit|http://gresil.org/jenkins/job/nit/]] job

Interesting things are :

* [[Results of the regression tests|http://gresil.org/jenkins/job/nit_tests/lastCompletedBuild/testReport/]]
* [[Callgrind traces|http://gresil.org/jenkins/job/nit_bootstrap/]]
* [[Git statistics|http://gresil.org/jenkins/job/nit/ws/gitstats/index.html]]
* [[Benchmark results|http://gresil.org/jenkins/job/nit_bench/ws/benchmarks/index.html]]
