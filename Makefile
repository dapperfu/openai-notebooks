VENV_NAME?=venv
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python3

.PHONY: all
all: venv

.PHONY: venv
venv: $(VENV_NAME)/bin/activate
$(VENV_NAME)/bin/activate: requirements.txt
	test -d $(VENV_NAME) || python3 -m venv $(VENV_NAME)
	${PYTHON} -m pip install --upgrade pip
	${PYTHON} -m pip install -r requirements.txt
	touch $(VENV_NAME)/bin/activate

.PHONY: install-reqs
install-reqs: venv
	${PYTHON} -m pip install -r requirements.txt

.PHONY: clean
clean:
	rm -rf $(VENV_NAME)
