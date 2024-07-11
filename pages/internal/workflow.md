## Repos and Branches

The official Nit repository is [[https://github.com/nitlang/nit.git]].
A [[Github mirror|https://github.com/nitlang/nit]] is also available for social coding.

The **master** branch is the most stable, up-to-date and trustworthy :

* Reliable since it passes every [[continuous integration test|continuous integration]]: everything must pass at all times, no regression is allowed
* Stable since it is never rebased/rewritten: we encourage new development projects in Nit to be based on master (the newer, the better)
* Up-to-date since everything that has not been integrated in master has no official existence and we try to integrate novelties as fast as we can

A lot of free software or academic projects tend to fail since they do not apply these criteria. The continuous flow of students or casual developers make the code base hard to maintain up to a point that the project itself is neither reliable, stable nor up-to-date. The only way to keep the head out of the sand in this case is to have a development process that guarantees a stable and up-to-date code.

Other development branches are not for public use and are to be deleted once merged into master.

## Development workflow

Nit's workflow is inspired by [[Github's|http://scottchacon.com/2011/08/31/github-flow.html]].

* [[Pull-Requests|https://github.com/nitlang/nit/pulls]] (PR) are submitted
* A code-review phase follows, and comments are issued on the code
* Automatically, one superficial continuous integration test phase is run on the new code
* Once the aforementioned tests pass, a deeper test routine is launched against the commits introduced by the PR. If it passes, the branch is then merged into master, and the PR is closed.

Since a lot of programmers already possess a Github account, it is very easy and efficient for anyone to contribute either via reviewing or submitting code to the project.

The main difference with the original Github workflow is that we often ask for rebasing/rewritting patches as we require individual commits to be cohesive.

* A branch should only undertake one task (bugfix, addition of a functionality, etc.)
* A branch is composed a few commits (if a branch unnecessarily contains too much commits, we might ask to split it in several PRs)
* Each commit needs to be cohesive, self explanatory and well documented

Projects like the Linux kernel or git itself consider that the best way to ensure code quality is to only integrate patches that have been reviewed and approved by an independent third-party. Having a history of cohesive and documented patches has a positive impact on maintenance since modifications can be traced back, and the reasons of their introduction are easily found. In the case of Nit, being a new language and due to its academic nature, contributors to the language are mostly students. Because of that, patches often require several iterations before their final integration.

## Code reviewing

Code reviews are mainly done through Github.
Submitted PRs are tagged as [[need_review|https://github.com/nitlang/nit/issues?direction=desc&labels=need_review&page=1&sort=updated&state=open]].

Contributors are then strongly advised to review the submitted code for several reasons:

* Code review helps understanding the language, libraries and tools
* It makes clearer everyone's undergoing tasks and specialities
* It helps the reviewer becoming more proficient with Nit, since good practices of other contributors are visible in this context
* The more reviewed, the faster a branch is integrated

A review of well-documented and clean code is often signified by a "+1" which might be interpreted as "I read the diff, nothing seems wrong with it".

## Integration

Once a consensus has been reached within reviewers of the code, the branch is ready to be merged into master, it is then tagged [[ok_will_merge|https://github.com/nitlang/nit/issues?direction=desc&labels=ok_will_merge&page=1&sort=updated&state=open]].
Deep integration tests are then launched to ensure nothing is broken by the newly submitted code.

If tests are passing, the PR is then integrated in master by merging.

This integration scheme by branches has the benefit of having every commit  respect the quality criteria of *master*.
