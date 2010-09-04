package Picom::VR;
use Moose;
use namespace::autoclean;
use Config;

$Config{byteorder} =~ /\A(.)(.)/;
my $endian = $2 > $1 ? "little" : "big";

has "endian" =>
    is => "rw",
    isa => "Str",
    default => $endian,
    ;

has "raw" =>
    is => "rw",
    
    ;


    around BUILDARGS => sub {
        my $orig = shift;
        my $class = shift;
        if ( @_ == 1 && ! ref $_[0] ) {
            return $class->$orig(raw => $_[0]);
        }
        else {
            return $class->$orig(@_);
        }
    };

{
    package Picom::VR::UI;
    use Moose;
    use Picom::VRtype;
    extends "Picom::VR";
    sub inflate {
        unpack "A*", +shift->raw;
    }
}


__PACKAGE__->meta->make_immutable;

1;

__END__

inflate
deflate
raw
dicom
is_weak => 1
subtype "PICOM::VRtype::UI"
    => as "Str"
    => where { /\A(?=[^0])(?:(?:[1-9][0-9]*\.?)|(?:(?<=\.)0\.))+(?<=\d)\z/ and 64 >= length }
#=> where { /\A(?=[^0])(?:(?:0)|(?:[1-9][0-9]+)\.?)+(?<=\d)\z/ and 64 >= length }
    => message { qq{UI (Unique Identifier) "$_" is invalid} },
    ;
