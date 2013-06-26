#!/usr/bin/env perl
use strictures;
use Test::More;

BEGIN {
    use_ok("Picom");
    use_ok("Picom::Utils");
}

my %trim = ( " this " => "this",
             "that" => "that",
             "\0\0\0" => "" );

while ( my ( $in, $out ) = each %trim )
{
    is $out, trim($in), qq{Trimmed "$in" -> "$out"};
}

{
    my $abc = " abc ";
    trim($abc);
    is $abc, "abc", "In place trim works";
}




done_testing();

__DATA__
