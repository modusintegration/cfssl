
export LOG_LEVEL=1 #info

TEST_FAILED=false
for test_script in ./test_scripts/test*sh; do
  echo Running test: $test_script
  $test_script
  [[ $? != 0 ]] && TEST_FAILED=true
done

if $TEST_FAILED; then
  echo "NOT ALL TESTS PASSED"
else
  echo "ALL TESTS PASSED"
fi