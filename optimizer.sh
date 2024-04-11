for test in ../tests/constprop.while ../tests/dce.while ../tests/seq.while ../tests/livevars.while; do
	echo $test
  stem=${test%.while}
  outir=${stem}.ir
  cat $outir | controlflow | optimizer | cfg2ir 2>&1 | timeout 5 interpreter - 10 # 2>/dev/null | grep Output
	echo
done
