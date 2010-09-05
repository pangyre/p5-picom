#!/usr/bin/env perl
use warnings;
use strict;
use Test::More;
# use Test::Exception;


BEGIN {
    use_ok("Picom::DICOM::VR");
}

ok( my $ui = Picom::DICOM::VR::UI->new("1.3.6.1.4.1.36460.123456789\0"),
    "1.3.6.1.4.1.36460.123456789" );

is( $ui, "1.3.6.1.4.1.36460.123456789",
    "Stringifies correctly" );

is( length($ui), 27,
    "Stringified length doesn't include DICOM padding" );
is( length($ui->raw), 28,
    "Raw length does include DICOM padding" );

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


