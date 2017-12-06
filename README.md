This repo demonstrates an infinite recursion bug when using the `include_role` task.

I'm pretty sure the bug was introduced by this Ansible PR: https://github.com/ansible/ansible/pull/27175.
In this test repo, `make test_01b6c7c` fails
but its parent commit `make test_03abce2` succeeds.  Apparently, there was a previous recursion issue
(https://github.com/ansible/ansible/issues/23609), but this symptom is now much more pronounced with
PR #27175.
