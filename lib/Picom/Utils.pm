package Picom::Utils;
use strictures;

sub import {
    my $pkg = shift;
    my $callpkg = caller();
    no strict "refs";
    *{"$callpkg\::$_"} = \&{"$pkg\::$_"} for qw( trim );
}

sub trim {
    local $_ = shift;
    s/\A\s+//;
    s/\s+\z//;
    y/\0//d;
    $_[0] = $_ unless defined wantarray;
    $_
}

1;


