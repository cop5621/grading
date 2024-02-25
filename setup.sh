compiler_project=${1}

if [[ "${compiler_project}" == "" ]]; then
  echo "USAGE: $0 compiler_project"
  exit 1
fi

cd $compiler_project
python3 -m venv .env/
source .env/bin/activate
pip3 install -e ./
make -C compiler/grammar
deactivate
cd ../
