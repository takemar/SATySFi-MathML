if [ "$(satysfi --version)" != "SATySFi version 0.1.0 alpha" ]; then
  echo 'SATySFi version 0.1.0 alpha needed' 1>&2
  exit 1
fi
satysfi solve .
mkdir -p $HOME/.satysfi/dist/packages/mathml/mathml.0.0.1/src
cp satysfi.yaml $HOME/.satysfi/dist/packages/mathml/mathml.0.0.1/
cp package.satysfi-lock $HOME/.satysfi/dist/packages/mathml/mathml.0.0.1/
cp src/mathml.satyh-html $HOME/.satysfi/dist/packages/mathml/mathml.0.0.1/src/
for f in `find tests/*.saty`; do
  satysfi solve $f && satysfi build --text-mode html $f -o "${f%.*}.html"
done
