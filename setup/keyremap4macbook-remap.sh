#!/bin/sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set repeat.wait 25
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.uk_saneuklayout 1
/bin/echo -n .
$cli set repeat.consumer_wait 15
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.escape2eject 1
/bin/echo -n .
/bin/echo
