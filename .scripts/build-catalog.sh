#!/bin/bash

TO=./by
FROM=$(pwd)
CATALOG=./catalog

VERBOSE=false
CHECK_CHANGES=

if test ! -e $CATALOG; then
    echo "catalog not found"
    exit 1
fi

while getopts 'cnv' OPT; do
    case "$OPT" in
        c) # clean
            echo rm -rf $TO
            rm -rf $TO
            exit 0
            ;;
        n) # no changes
            CHECK_CHANGES=echo
            ;;
        v) # verbose
            VERBOSE=true
            ;;
        \?)
            echo read the script :pleading:
            exit 1
            ;;
    esac
done

for row in $(seq 1 $(wc -l < $CATALOG)); do
    raw=( $(awk -v row=$row -F':' 'FNR == row { printf("%s %s %s %s", substr($1, 2, 3), substr($2, 2, 3), tolower($3), $4) }' $CATALOG) )
    class=${raw[2]}${raw[3]}
    subject=${raw[2]}
    year=${raw[0]}
    qtr=${raw[1]}

    by_yr_qtr=$TO/year/$year/quarter/$qtr
    by_subject=$TO/subject/$subject

    # make source dirs
    if test ! -d "$FROM/$class"; then
        if $VERBOSE; then echo mkdir -p $FROM/$class; fi
        $CHECK_CHANGES mkdir -p $FROM/$class
    fi

    # make year/?/quarter-? dirs
    if test ! -d "$by_yr_qtr"; then
        if $VERBOSE; then echo mkdir -p $by_yr_qtr; fi
        $CHECK_CHANGES mkdir -p $by_yr_qtr
    fi

    # make subject/???? dirs
    if test ! -d "$by_subject"; then
        if $VERBOSE; then echo mkdir -p $by_subject; fi
        $CHECK_CHANGES mkdir -p $by_subject
    fi

    # make year/?/quarter-? symlinks
    if test ! -L $by_yr_qtr/$class; then
        if $VERBOSE; then echo ln -s $FROM/$class $by_yr_qtr; fi
        $CHECK_CHANGES ln -s $FROM/$class $by_yr_qtr
    fi

    # make subject/???? symlinks
    if test ! -L $by_subject/$class; then
        if $VERBOSE; then echo ln -s $FROM/$class $by_subject; fi
        $CHECK_CHANGES ln -s $FROM/$class $by_subject
    fi

done
