package Picom::Util;
use strict;
use Carp;
use Math::BigInt ();
use Data::UUID;
use Digest::SHA1;
use Time::HiRes qw( gettimeofday );
# use Memoize; memoize("rot_hash_uid"); # premature optimization?

# perl -Mbigint -MData::UUID -le 'print "2.25." . Math::BigInt->new(Data::UUID->new->create_hex())'

my $DUID = Data::UUID->new;
# NO... digest salt must be repeatable forever... so hardcode something here? Digest::file::digest_file(__FILE__)?
my $DIGEST_SALT = $ENV{PICOM_DIGEST_SALT} || join("", gettimeofday(), $$, rand(100_000) );

sub make_uid {
    "2.25." . Math::BigInt->new($DUID->create_hex);
}

# Must be repeatable within an individual run.
sub rot_hash_uid {
    my $uid = shift || confess "No uid provided";
    "2.25." . Math::BigInt->new( sha1_hex($DIGEST_SALT,$uid) );
}

1;

__DATA__

$ENV{PICOM_DIGEST_SALT} to allow repeatable tests, for example.

=> where { /\A(?=\d)(?:[0-9]+\.?)+(?<=\d)\z/ and 64 >= length }

 /\A(?=\d)



(?<=\d)\z/


