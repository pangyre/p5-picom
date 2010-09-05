#!/usr/bin/env perl
use warnings;
use strict;
use Test::More;
use Test::Exception;

BEGIN {
    package XYZ;
    use Moose;
    use Picom::DICOM::VRtype;

    has uid =>
        is => "rw",
        isa  => "Picom::DICOM::VRtype::UI",
        ;
}


ok( my $xyz = XYZ->new, "XYZ->new" );

dies_ok( sub { $xyz->uid(0) } );

ok( $xyz->uid("1.2.3") );

dies_ok( sub { $xyz->uid("1.02.3") } );



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


