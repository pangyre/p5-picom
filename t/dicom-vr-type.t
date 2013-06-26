#!/usr/bin/env perl
use strictures;
use Test::More;
use Test::Fatal;

BEGIN {
    package XYZ;
    use Moose;
    use Picom::DICOM::VRtype;

    has uid =>
        is => "rw",
        isa  => "Picom::DICOM::VRtype::UI",
        ;
}

ok my $xyz = XYZ->new, "XYZ->new";

isnt exception { $xyz->uid(0) },
    undef,
    '$xyz->uid(0) throws exception';

ok $xyz->uid("1.2.3"), '$xyz->uid("1.2.3")';

isnt exception { $xyz->uid("1.02.3") },
    undef,
    '$xyz->uid("1.02.3") throws exception';

done_testing(4);

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


