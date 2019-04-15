package VC16ProjectCreator;

# ************************************************************
# Description   : A VC15 Project Creator
# Author        : Thijs Sassen
# Create Date   : 09/10/2017
# $Id$
# ************************************************************

# ************************************************************
# Pragmas
# ************************************************************

use strict;

use VC15ProjectCreator;

use vars qw(@ISA);
@ISA = qw(VC15ProjectCreator);

## NOTE: We call the constant as a function to support Perl 5.6.
my %info = (Creator::cplusplus() => {'ext'      => '.vcxproj',
                                     'dllexe'   => 'vc16exe',
                                     'libexe'   => 'vc16libexe',
                                     'dll'      => 'vc16dll',
                                     'lib'      => 'vc16lib',
                                     'template' => [ 'vc10', 'vc10filters' ],
                                    },
           );

my %config = ('vcversion' => '16.00',
              'prversion' => '19.20.27508',
              'toolsversion' => '15',
              'targetframeworkversion' => '4.7.2',
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
