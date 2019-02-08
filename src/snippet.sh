#!/usr/bin/sh
set -eu

# print options
showOpts(){
  OPTS=`cat -s << EOS
OPTIONS:
  -haml5, haml5
  -html5, html5
  -ruby,  ruby
  -md,    markdown
  -plain, plain
  -jqc,   jquery coffee
  -jqpc,  jquery plugin coffee
EOS`
  echo "$OPTS"
  exit 0
}

# check arg length. if less then 1, then exit.
if [ $# -le 0 ]; then
  showOpts
fi

HAML5=`cat << EOS
!!!5
  %html{lang: 'ja'}
  %head
    %meta{charset: 'utf-8'}
    %title test
  %body
    %script{type: 'text/javascript', src: 'https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js'}
    %script{type: 'text/javascript', src: 'https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js'}
    :coffee
      jQuery(document).ready ($)->
        
EOS`

HTML5=`cat << EOS
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
<script>
jQuery(document).ready(function($){
  
})
</script>
</body>
</html>

EOS`

RUBY=`cat << EOS
require 'nokogiri'
EOS`

MD=`cat << EOS
# HEADER1

## HEADER2 {{{1
}}}
### HEADER3 {{{1
}}}

#### HEADER4
EOS`

JQUERY_COFFEE=`cat << EOS
jQuery(document).ready ($)->
  
EOS`

JQUERY_PLUGIN_COFFEE=`cat << EOS
# SCRIPT_NAME - jQuery Plugin
# version: 0.0.1
# Licensed under the MIT license.
# Copyright 2016 AUTHOR
(($)->
  $.fn.PLUGIN_NAME = (options)->
    opts = $.extend {}, {
      # some opts 1
      opt1: ''
      opt2: ''
      opt3: ''
    }, options

    # func1
    someFunctionHere = (arg1, arg2) ->
      # do something here

    # main chain type
    @.each ()->
      # do something here

    # main function type
    (->
      # do something here
    )()
)(jQuery)
EOS`

for arg in $@
do
  case $arg in
    "-haml5" )
      SRC="$HAML5"
      FILENAME="index.html.haml" ;;
    "-html5" )
      SRC="$HTML5"
      FILENAME="index.html" ;;
    "-ruby" )
      SRC="$RUBY"
      FILENAME="main.rb" ;;
    "-plain" )
      SRC=""
      FILENAME="plain.txt" ;;
    "-md" )
      SRC="$MD"
      FILENAME="markdown.md" ;;
    "-jqc" )
      SRC="$JQUERY_COFFEE"
      FILENAME="main.coffee" ;;
    "-jqpc" )
      SRC="$JQUERY_PLUGIN_COFFEE"
      FILENAME="jquery.pluginname.coffee" ;;
    *) showOpts ;;
  esac
  echo "${SRC}" > `dirname pwd`/"${FILENAME}"
done
