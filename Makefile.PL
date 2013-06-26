#!/usr/bin/env perl
use inc::Module::Install;
name "Picom";
author 'Ashley Pond V <ashley@cpan.org>';
license "perl";
repository "git://github.com/pangyre/p5-picom";
all_from "lib/Picom.pm";

auto_install;

WriteAll;

__END__

