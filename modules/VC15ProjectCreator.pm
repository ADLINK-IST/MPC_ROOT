package VC15ProjectCreator;

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

use VC14ProjectCreator;

use vars qw(@ISA);
@ISA = qw(VC14ProjectCreator);

## NOTE: We call the constant as a function to support Perl 5.6.
my %info = (Creator::cplusplus() => {'ext'      => '.vcxproj',
                                     'dllexe'   => 'vc15exe',
                                     'libexe'   => 'vc15libexe',
                                     'dll'      => 'vc15dll',
                                     'lib'      => 'vc15lib',
                                     'template' => [ 'vc10', 'vc10filters' ],
                                    },
           );

my %config = ('vcversion' => '15.00',
              'prversion' => '19.11.25507',
              'toolsversion' => '14.1',
              'targetframeworkversion' => '4.6.1',
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
