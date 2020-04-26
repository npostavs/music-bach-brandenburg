#!/bin/bash

date=$(date --iso-8601=date)

shopt -s globstar

pdfs=(**/*.pdf)

attach_args=()
rm -rf uploads/
mkdir -p uploads
for pdf in "${pdfs[@]}" ; do
    flatname=${pdf//\//-}
    ln "$pdf" "uploads/$flatname" || exit $?
    attach_args+=(--attach "uploads/$flatname")
done

git hub release create --browse "${attach_args[@]}" --message "Pdf output for ${date}" "${date}"
