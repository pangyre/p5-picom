package Picom::VRtype;
use Moose::Util::TypeConstraints;

subtype "PICOM::VRtype::CS"
    => as "Str"
    => where { /\A[A-Z 0-9_]+\z/ and 16 >= length }
    => message { qq{CS (Code String) "$_" is invalid} },
    ;

coerce "PICOM::VRtype::CS" => from "Str" => via { s/\A +| +\z//g; $_ };

subtype "PICOM::VRtype::SH"
    => as "Str"
    => where { 16 >= length }
    => message { qq{SH (Short String) "$_" is invalid} },
    ;

subtype "PICOM::VRtype::UI"
    => as "Str"
    => where { /\A(?=[^0])(?:(?:[1-9][0-9]*\.?)|(?:(?<=\.)0\.))+(?<=\d)\z/ and 64 >= length }
#=> where { /\A(?=[^0])(?:(?:0)|(?:[1-9][0-9]+)\.?)+(?<=\d)\z/ and 64 >= length }
    => message { qq{UI (Unique Identifier) "$_" is invalid} },
    ;

no Moose::Util::TypeConstraints;

1;

__DATA__



=> where { /\A(?=\d)(?:[0-9]+\.?)+(?<=\d)\z/ and 64 >= length }

 /\A(?=\d)



(?<=\d)\z/


