#!/usr/bin/env perl
use inc::Module::Install;

name "Picom";
all_from "lib/Picom.pm";
# repository "git://github.com/pangyre/p5-picom";

auto_install;

WriteAll;

__END__

