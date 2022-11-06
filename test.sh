if [ "$(satysfi --version)" != "SATySFi version 0.1.0 alpha" ]; then
  echo 'SATySFi version 0.1.0 alpha needed' 1>&2
  exit 1
fi
cp src/mathml.satyh-html $HOME/.satysfi/dist/packages/
for f in `find tests/*.saty`; do
  satysfi --text-mode html $f -o "${f%.*}.html"
done
