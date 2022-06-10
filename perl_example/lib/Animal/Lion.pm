use strict;
use warnings;

package Animal::Lion;
use Animal::Cat;

our @ISA = qw(Animal::Cat); #inherit the Cat class

sub getSound {
    my ($self) = @_;
    return $self->{name}, " says Rawr";
}

