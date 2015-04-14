package ListUtil::PP;

use strict;
use warnings;
use B qw( svref_2object SVf_IOK SVf_NOK );

use Exporter 5.57 'import';

our $VERSION = '0.001';
our %EXPORT_TAGS = ( 'all' => [qw( sum_args_iterative sum_args_recursive )] );
our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

sub sum_args_iterative {
    my (@args) = @_;

    my $sum = 0;
    while (@args > 0) {
        my $n = pop @args;
        if (ref $n) {
            if (ref $n eq 'SCALAR') {
                push @args, $$n;
            }
            elsif (ref $n eq 'ARRAY') {
                push @args, @$n;
            }
            elsif (ref $n eq 'HASH') {
                push @args, values %$n;
            }
            # else { 0 }
        }
        else {
            my $sv = svref_2object(\$n);
            if ($sv->FLAGS & SVf_IOK || $sv->FLAGS & SVf_NOK) {
                $sum += $n;
            }
        }
    }
    return $sum;
}

sub sum_args_recursive {
    my (@args) = @_;

    my $sum = 0;
    foreach (@args) {
        if (ref) {
            if (ref eq 'SCALAR') {
                $sum += sum_args_recursive($$_);
            }
            elsif (ref eq 'ARRAY') {
                $sum += sum_args_recursive(@$_);
            }
            elsif (ref eq 'HASH') {
                $sum += sum_args_recursive( values %$_ );
            }
            # else { 0 }
        }
        else {
            my $sv = svref_2object(\$_);
            if ($sv->FLAGS & SVf_IOK || $sv->FLAGS & SVf_NOK) {
                $sum += $_;
            }
        }
    }
    return $sum;
}

1;

=head1 NAME

ListUtil::PP - Learning XS the fun way

=cut
