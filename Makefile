ENV := $(CURDIR)/env
PIP := $(ENV)/bin/pip

clean:
	rm -rf $(ENV)

$(ENV):
	virtualenv $(ENV)

test_01b6c7c: clean $(ENV)
	$(PIP) install git+git://github.com/ansible/ansible.git@01b6c7c9c6b7459a3cb53ffc2fe02a8dcc1a3acc
	$(ENV)/bin/ansible-playbook test-playbook.yml -vvvv

test_03abce2: clean $(ENV)
	$(PIP) install git+git://github.com/ansible/ansible.git@03abce2d39a1ff4ad5d1f7f8d916ba33a3be44d5
	$(ENV)/bin/ansible-playbook test-playbook.yml -vvvv

test_2_4_2_0: clean $(ENV)
	$(PIP) install ansible==2.4.2.0
	$(ENV)/bin/ansible-playbook test-playbook.yml -vvvv

test_2_4_1_0: clean $(ENV)
	$(PIP) install ansible==2.4.1.0
	$(ENV)/bin/ansible-playbook test-playbook.yml -vvvv

.PHONY: clean test_2_4_1_0 test_2_4_2_0 test_01b6c7c test_03abce2
