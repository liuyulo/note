for f in `find -name '*.html' -not -name index.html`; do
    echo $f
    mkdir -p ${f%.html}
    mv $f ${f%.html}/index.html
done
