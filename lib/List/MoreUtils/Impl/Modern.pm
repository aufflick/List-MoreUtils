package List::MoreUtils::Impl::Modern;

use 5.008001;
use strict;
use warnings;

our $VERSION   = '0.400';

use List::MoreUtils::XS qw(); # try load XS stuff ...

unless(defined &any)
{
    my @pp_imp = map { "*$_ = \\&List::MoreUtils::Impl::Modern::PP::$_;" } qw(any all none notall);
    my $pp_stuff = join( "\n", "use List::MoreUtils::Impl::Modern::PP;", @pp_imp );
    eval $pp_stuff;
    die $@ if $@;
}

1;

__END__

=pod

=head1 NAME

List::MoreUtils::Impl::Modern - Provide List::MoreUtils implementation from List::Util

=head1 SYNOPSIS

  use List::MoreUtils qw(:modern);

=head1 SEE ALSO

L<List::Util>

=head1 AUTHOR

Jens Rehsack E<lt>rehsack AT cpan.orgE<gt>

Adam Kennedy E<lt>adamk@cpan.orgE<gt>

Tassilo von Parseval E<lt>tassilo.von.parseval@rwth-aachen.deE<gt>

=head1 COPYRIGHT AND LICENSE

Some parts copyright 2011 Aaron Crane.

Copyright 2004 - 2010 by Tassilo von Parseval
Copyright 2013 by Jens Rehsack

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.4 or,
at your option, any later version of Perl 5 you may have available.

=cut
