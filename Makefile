ENV := $(CURDIR)/env
PIP := $(ENV)/bin/pip

clean:
	rm -rf $(ENV)

$(ENV):
	virtualenv $(ENV)

test_2_4_2_0: clean $(ENV)
		$(PIP) install ansible==2.4.2.0
		$(ENV)/bin/ansible-playbook test-playbook.yml -vvvv

test_2_4_1_0: clean $(ENV)
		$(PIP) install ansible==2.4.1.0
		$(ENV)/bin/ansible-playbook test-playbook.yml -vvvv

.PHONY: clean test_2_4_1_0 test_2_4_2_0
