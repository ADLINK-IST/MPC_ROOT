package VC14ProjectCreator;

# ************************************************************
# Description   : A VC12 Project Creator
# Author        : Paul Gallagher
# Create Date   : 06/12/2013
# $Id$
# ************************************************************

# ************************************************************
# Pragmas
# ************************************************************

use strict;

use VC12ProjectCreator;

use vars qw(@ISA);
@ISA = qw(VC12ProjectCreator);

## NOTE: We call the constant as a function to support Perl 5.6.
my %info = (Creator::cplusplus() => {'ext'      => '.vcxproj',
                                     'dllexe'   => 'vc14exe',
                                     'libexe'   => 'vc14libexe',
                                     'dll'      => 'vc14dll',
                                     'lib'      => 'vc14lib',
                                     'template' => [ 'vc10', 'vc10filters' ],
                                    },
           );

my %config = ('vcversion' => '14.00',
              'prversion' => '19.00.23506',
              'toolsversion' => '14.0',
              'targetframeworkversion' => '4.6',
              'xmlheader' => 1
              );

# ************************************************************
# Subroutine Section
# ************************************************************

sub get_info_hash {
  my($self, $key) = @_;

  ## If we have the setting in our information map, the use it.
  return $info{$key} if (defined $info{$key});

  ## Otherwise, see if our parent type can take care of it.
  return $self->SUPER::get_info_hash($key);
}

sub get_configurable {
  my($self, $name) = @_;
  return $config{$name};
}

1;
