use strict;
use warnings;
use Devel::Peek;

my @ar;
$ar[0] = \( $ar[1] );
$ar[1] = \( $ar[0] );

# see http://stackoverflow.com/questions/4091358/how-does-work-in-perl-subroutines
my $ar = sub {\@_}->( @ar[0,1,0] );

# set elts 0 & 2 to 'x'
# ${ ${ $ar->[0] } } = "x";

Dump $ar;
