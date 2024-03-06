for test in  ../hiddentests/outparam.while ../tests/nested.while ../tests/whileterm.while ../hiddentests/digitcount.while; do
	echo $test
  stem=${test%.while}
  outir=${stem}.ir
	outpng=$(basename ${stem}.png)
	outcfg=$(basename ${stem}.cfg)
  cat $outir | controlflow | graphview $outpng | tee $outcfg
	echo
done

# echo ../hiddentests/outparam.while 10
# cat ../hiddentests/outparam.while | while2ir 2>/dev/null | controlflow | cfg2ir | timeout 5 interpreter - 10 2>/dev/null | grep Output
# echo
# echo ../tests/fact.while 1
# cat ../tests/fact.while | while2ir 2>/dev/null | controlflow | cfg2ir | timeout 5 interpreter - 1 2>/dev/null | grep Output
# echo
# echo ../tests/fact.while 5
# cat ../tests/fact.while | while2ir 2>/dev/null | controlflow | cfg2ir | timeout 5 interpreter - 5 2>/dev/null | grep Output
# echo
# echo ../hiddentests/digitcount.while 99
# cat ../hiddentests/digitcount.while | while2ir 2>/dev/null | controlflow | cfg2ir | timeout 5 interpreter - 99 2>/dev/null | grep Output
# echo
