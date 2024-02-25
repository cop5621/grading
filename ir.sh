for test in  ../hiddentests/outparam.while ../tests/seq.while ../tests/whileterm.while ../tests/not.while; do
	echo $test
  cat $test | while2ir
	echo
done

echo ../hiddentests/outparam.while 10
cat ../hiddentests/outparam.while | while2ir 2>/dev/null | timeout 5 interpreter - 10 2>/dev/null | grep Output
echo
echo ../tests/fact.while 1
cat ../tests/fact.while | while2ir 2>/dev/null | timeout 5 interpreter - 1 2>/dev/null | grep Output
echo
echo ../tests/fact.while 5
cat ../tests/fact.while | while2ir 2>/dev/null | timeout 5 interpreter - 5 2>/dev/null | grep Output
echo
echo ../hiddentests/digitcount.while 99
cat ../hiddentests/digitcount.while | while2ir 2>/dev/null | timeout 5 interpreter - 99 2>/dev/null | grep Output
echo
