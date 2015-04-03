package ScalarUtil;

use strict;
use warnings;
use XSLoader;

use Exporter 5.57 'import';

our $VERSION = '0.001';
our %EXPORT_TAGS = ( 'all' => ['dualvar'] );
our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

XSLoader::load('ScalarUtil', $VERSION);

1;

=head1 NAME

ScalarUtil - Learning XS the fun way

=cut
