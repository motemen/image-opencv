package Image::OpenCV;

use strict;
use warnings;
#use base qw(Exporter);
#our @EXPORT_OK = ();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=head1 NAME

Image::OpenCV -

=head1 SYNOPSIS

  use Image::OpenCV;

=head1 DESCRIPTION

Image::OpenCV is

=head1 AUTHOR

Hironao OOTSUBO E<lt>motemen@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
