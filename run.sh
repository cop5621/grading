test_script=${1}
compiler_project=${2}

if [[ "${compiler_project}" == "" || "${test_script}" == "" ]]; then
  echo "USAGE: $0 test_script compiler_project"
  exit 1
fi

cd $compiler_project
source .env/bin/activate
grep $(echo $compiler_project | cut -f1 -d/) ../students.csv | cut -f2 -d, | tee ${test_script}.out
bash ../${test_script} |& tee -a ${test_script}.out
deactivate
cd ../
