package Picom::Utils;

use parent qw(Exporter);
@EXPORT = qw( trim );

use strict;

sub trim { $_[0] =~ s/\A\s+|\s+\z//g; $_[0] =~ y/\0//d; $_[0] }

1;


