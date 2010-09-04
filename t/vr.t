#!/usr/bin/env perl
use warnings;
use strict;
use Test::More;
# use Test::Exception;


BEGIN {
    use_ok("Picom::VR");
}

ok( my $ui = Picom::VR::UI->new("1.3.6.1.4.1.36460.1234567890"),
    "1.3.6.1.4.1.36460.1234567890" );



done_testing();

__DATA__

UIs to test
1
0? allowed or not?

Fine
1.2.3

malformed
1..2.3

Not too long
123456789.123456789.123456789.123456789.123456789.123456789.1234

Too long
123456789.123456789.123456789.123456789.123456789.123456789.12345


