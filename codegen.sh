for test in ../tests/constprop.while ../tests/dce.while ../tests/seq.while ../tests/livevars.while ../hiddentests/digitcount.while; do
	echo $test
  stem=${test%.while}
  incfg=${stem}.cfg
	name=$(basename $stem)
	outasm=${name}.s
  cat $incfg | codegen > $outasm
	gcc -o $name $outasm runtime/io.c
	echo "10" | ./$name
	echo
done
