.ONESHELL:

check_coverage:
	flutter test test/unit_test.dart --coverage
	lcov --remove coverage/lcov.info '*/config/*' '*/common/*' '*/utils/debug.dart' '*/repository/*ref.dart' -o coverage/lcov.info
	genhtml coverage/lcov.info --output=coverage

open coverage:
	open coverage/index.html