#!/bin/bash

VENDOR_ASSETS=$(pwd)/vendor/assets
mkdir tmp && cd tmp
curl -O http://codemirror.net/codemirror.zip
unzip codemirror.zip
cd codemirror-*
rm -rf $VENDOR_ASSETS

mkdir -p $VENDOR_ASSETS/javascripts/codemirror/{keymaps,modes,utils}
cp lib/*.js $VENDOR_ASSETS/javascripts/
cp keymap/*.js $VENDOR_ASSETS/javascripts/codemirror/keymaps/
cp mode/**/*.js $VENDOR_ASSETS/javascripts/codemirror/modes/
cp addon/**/*.js $VENDOR_ASSETS/javascripts/codemirror/utils/

mkdir -p $VENDOR_ASSETS/stylesheets/codemirror/{modes,themes,utils}
cp lib/*.css $VENDOR_ASSETS/stylesheets/
cp theme/*.css $VENDOR_ASSETS/stylesheets/codemirror/themes/
cp addon/**/*.css $VENDOR_ASSETS/stylesheets/codemirror/utils/

cd ../.. && rm -rf tmp/