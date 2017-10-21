package Magic;

use strict;
use warnings;

use Exporter 5.57;
use Variable::Magic qw( wizard cast );
use XSLoader;

our $VERSION   = '0.001';
our @ISA       = qw( Exporter );
our @EXPORT_OK = qw( magify_pp magify_xs );

sub magify_pp {
    my $wiz = wizard(
        set  => sub { print "set => ${$_[0]}\n" }, 
        free => sub { print "destroy\n" },
    );
    cast $_[0], $wiz;
    return;
}

XSLoader::load 'Magic', $VERSION;

1;

=head1 NAME

Magic - Learning XS the fun way

=cut
