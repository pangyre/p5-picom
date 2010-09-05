package Picom::DICOM::VR;
use Moose;
use namespace::autoclean;
use Config;
use Picom::Utils;

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

has "value" =>
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


sub BUILD {
    my $self = shift;
    $self->value($self->inflate($self->raw));
}

{
    package Picom::DICOM::VR::UI;
    use Moose;
    use Picom::DICOM::VRtype;
    extends "Picom::DICOM::VR";
    use overload '""' => sub { +shift->value }, fallback => 1;
    sub inflate {
        my $self = shift;
        $self->value( Picom::Utils::trim( $self->raw ) );
    }
    sub deflate {
        my $value = +shift->value; # charset issue?
        $value & 1 ? "$value " : $value;
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
