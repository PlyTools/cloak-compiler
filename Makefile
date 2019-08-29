# Convenience wrapper for some quick commands

# run unit tests
unit-test:
	cd src && ../bpl-docker.sh make test

# test compiling & running an example contract
example-contract:
	# compile example contract
	cd eval-ccs2019 && ../bpl-docker.sh python3 "../src/main.py" --output ./examples/exam/compiled ./examples/exam/exam.sol
	# generate scenario for example contract
	cd eval-ccs2019 && ../bpl-docker.sh ./generate-scenario.sh ./examples/exam
	# run example scenario
	cd eval-ccs2019 && ../bpl-docker.sh ./examples/exam/scenario/runner.sh

# run evaluation
evalation:
	./eval-ccs2019/bpl-eval-docker.sh

# test most important commands in repo
test: unit-test example-contract evalation

# generate a zip file of this repository
archive:
	git archive -o bpl.zip HEAD