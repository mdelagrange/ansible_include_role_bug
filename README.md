This repo demonstrates an recursion bug when using the `include_role`
task in conjunction with a large Ansible inventory.

I'm pretty sure the bug was introduced by this Ansible PR: https://github.com/ansible/ansible/pull/27175.
In this test repo, `make test_01b6c7c` fails
but its parent commit `make test_03abce2` succeeds.  Ansible will attempt a
deep copy [here](https://github.com/ansible/ansible/blob/8d78a829c60cc63e668683fb5d626eba942e6a39/lib/ansible/executor/task_result.py#L100).
In the case of the `include_role` task, that will include an
`ansible.playbook.role_include.IncludeRole` instance with a reference to the
current Ansible inventory.  The resulting deep copy may exceed the default
recursion limit in Python.  The sample inventory in this repository will
trigger the error and is less than half the size of my current EC2 inventory
file.

# How to run the test case

1. Clone this repository
1. Run `make test_2_4_2_0`

Alternatively, you can run the test inside a Docker container.

1. Clone this repository
1. Run `docker build . --tag ansible_include_role_bug`
1. Run `docker run ansible_include_role_bug make test_2_4_2_0`

PR [#32565](https://github.com/ansible/ansible/pull/32565) seems to fix this
issue.
