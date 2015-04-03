package ListUtil;

use strict;
use warnings;
use XSLoader;

use Exporter 5.57 'import';

our $VERSION = '0.001';
our %EXPORT_TAGS = ( 'all' => [qw( sum_arrayref sum_array )] );
our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

XSLoader::load('ListUtil', $VERSION);

1;

=head1 NAME

ListUtil - Learning XS the fun way

=cut
