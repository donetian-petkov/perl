use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";

use v5.16;

use lib "lib";
use Animal::Cat;

print "Hello World!\n";

my $name = 'Donnie';

my ($age, $street) = (29, 'Sofia');

my $my_info = "$name leaves on \"$street\"\n";

=begin html

This is a test comment.
Still, I like to point out that we may use double quotes in a string with the below qq{} command ->

=cut

$my_info = qq{$name lives on "$street"\n};

print $my_info;

my $bunch_on_info = <<"END";
This is a bunch of
information
on multiple lines
END

say $bunch_on_info;

# The largest integer you can hold
my $big_int = 18446744073709551615;

# You can formatted strings by defining the data type after %
# %c : Character
# %s : string
# %d : Decimal
# %u : Unsigned integer
# %f : Floating Point (Decimal Notation)
# %e : Floating Point (Scientific Notation)
printf("%u \n", $big_int + 1);

my $big_float = .1000000000000001;

#setting the precision of the calculation with %.16f; the result is 0.2000000000000002
printf("%.16f \n", $big_float + .1000000000000001);


my $first = 1;
my $second = 2;

#switching the variables' values:
($first, $second) = ($second, $first);

say "$first $second"; # 2 1

# ---------- MATH ----------
say "5 + 4 = ", 5 + 4;
say "5 - 4 = ", 5 - 4;
say "5 * 4 = ", 5 * 4;
say "5 / 4 = ", 5 / 4;
say "5 % 4 = ", 5 % 4;
say "5 ** 4 = ", 5 ** 4;

=start

5 + 4 = 9
5 - 4 = 1
5 * 4 = 20
5 / 4 = 1.25
5 % 4 = 1
5 ** 4 = 625

=cut

say "EXP 1 = ", exp 1; # e to the power of
say "HEX 10 = ", hex 10; # Convert from hexidecimal
say "OCT 10 = ", oct 10; # Convert from Octal
say "INT 6.45 = ", int(6.45); # Truncate You can use parentheses
say "LOG 2 = ", log 2; # Number to the power of e
say "Random between 0 - 10 = ", int(rand 11);
say "SQRT 9 = ", sqrt 9;

=start

EXP 1 = 2.71828182845905
HEX 10 = 16
OCT 10 = 8
INT 6.45 = 6
LOG 2 = 0.693147180559945
Random between 0 - 10 = 2
SQRT 9 = 3

=cut

# precedence:
say "3 + 2 * 5 = ", 3 + 2 * 5;
say "(3 + 2) * 5 = ", (3 + 2) * 5;

=start

3 + 2 * 5 = 13
(3 + 2) * 5 = 25

=cut

my $age = 80;
my $is_not_intoxicated = 1;
my $age_last_exam = 16;

#number conditionals
if ($age < 16) {
    say "You can't drive";
} elsif (!$is_not_intoxicated) {
    say "You can't drive";
} else {
    say "You can drive";
}

if (($age >= 1) && ($age < 16)) {
    say "You can't drive";
} elsif (!$is_not_intoxicated) {
    say "You can't drive"
} elsif(($age >= 80) && (($age > 100) || (($age - $age_last_exam) > 5))){
  say "You can't drive";
} else {
  say "You can drive";
}


#string conditionals
if ('a' eq 'b') {
    say "a equals b";
} else {
    say "a does not equal b";
}

#opposite of if:
unless (!$is_not_intoxicated) {
    say "Get Sober";
}

say (($age > 18) ? "Can Vote" : "Can not vote");

for (my $i = 0; $i < 10 ; $i++) {
    say $i;
}

my $i = 1;

=start
while ($i < 10){
  if($i % 2 == 0){
    $i++;
    # next skips back to the beginning of the loop
    next;
  }
  # Last exits out of the loop
  if($i == 7){ last; }
  say $i;
  $i++;
}
=cut

my $lucky_num = 7;
my $guess;
do {
  say "Guess a Number Between 1 and 10";

  # This is how you get user input
  $guess = <STDIN>;
} while $guess != $lucky_num;

say "You guessed 7";

my $age_old = 18;


#switch

given ($age_old) {
  when($_ > 16) { # $_ is the "this" keyword
    say "Drive";
    continue;
  }
  when($_ > 17) {say "Go Vote";}
  default {say "Nothing Special";}
}


#strings
my $long_string = "Random Long String";

say "Length of String: ", length $long_string;

printf("Long is at %d \n", index $long_string, "Long");

printf("Last g is at %d \n", rindex $long_string, "g");

#concant:

$long_string = $long_string . " isn't that long";

say "Index 7 through 10 " , substr $long_string, 7, 4;

my $animal = "animals";

printf("Last character is %s\n", chop $animal);

my $no_newline = "No Newline \n";
chomp $no_newline;

printf("Uppercase: %s \n", uc $long_string);
printf("Lowercase: %s \n", lc $long_string);
printf("1st Uppercase: %s \n", ucfirst $long_string);

$long_string =~ s/ /, /g;

say $long_string;

my $two_times = "What I said is " x 2;
say $two_times;

my @abcs = ('a' .. 'z'); #a to z

print join(', ', @abcs), "\n";

my $letter = 'c';

say "Next Letter", ++$letter; #c turns to d

#array:

my @primes = (2,3,5,7,11,13);
my @my_info = ("Derek", "123 Main Str.", 40, 6.25);

$my_info[4] = "Banas";

for my $info (@my_info) {
    say $info;
}

foreach my $num (@primes) {
    say $num;
}

#iterating shortcut:
for (@my_info) {
    say $_;
}

my @my_name = @my_info[0,4];

say @my_name;

my $items = scalar @my_info; #length of the array

say $items;

# destructuring:
my ($f_name, $address, $how_old, $height, $l_name) = @my_info;

say "$f_name $l_name";

say "Popped Value", pop @primes;
say "Pushed Value", push @primes, 17;
say "First Time", shift @primes;
say "Unshifted Item", shift @primes, 2;

print join(", ", @primes), "\n";

say "Remove Index 0 - 2 ", splice @primes, 0, 3;

#from array to string:
print join(", ", @primes), "\n";
print join " ", ('list', 'of', "words", "\n");

#from string to array:
my $customers = "Sue Sally Paul";
my @cust_array = split / /, $customers;
print join(", ", @cust_array), "\n";

@cust_array = reverse @cust_array;

@cust_array = reverse sort @cust_array;

my @number_array = (1,2,3,4,5,6,7,8);
my @odds_arrays = grep {$_ % 2} @number_array;

print join(", ", @odds_arrays), "\n";

my @dbl_array = map {$_ * 2} @number_array;

print join(", ", @dbl_array), "\n";

#hashes == maps

my %employees = (
    "Sue"  => 35,
    "Paul" => 43,
    "Sam"  => 39
);

printf("Sue is %d \n", $employees{Sue});

#add key/value to hash
$employees{Frank} = 44;

#iterating hash:

while (my ($k, $v)=each %employees){
    print "$k $v \n";
}

my @ages = @employees{"Sue","Sam"};
say @ages;

my @hash_array = %employees;

delete $employees{'Frank'};

#check if key exists
say ((exists $employees{'Sam'}) ? "Sam is right" : "No Sam");

#check if value exists:
for my $key (keys %employees) {
    if($employees{$key} == 35) {
        say "Hi Sue";
    }
}

#subroutine == functions
sub get_random {
    return int(rand 11);
}

say "Random Number", get_random();

sub get_random_max {
    my ($max_number) = @_; # @_ is the argument given to the function

    $max_number ||= 11; # default value
    return int(rand $max_number);
}

say "Random Number Max is ", get_random_max(100);

sub get_sum {

    my ($num_1, $num_2) = @_; #two arguments

    $num_1 ||=1;
    $num_2 ||=2;

    return $num_1 + $num_2;
}

sub sum_many {
    my $sum = 0;

    foreach my $val (@_) {
        $sum += $val;
    }

    return $sum;
}

say "Sum : ", sum_many(1,2,3,4,5,6);

sub increment {
    state $execute_total = 0; # preserving the value of the variable with state

    $execute_total++;

    say "Executed $execute_total times";

}

increment();
increment();

sub double_array {
    my @num_array = @_;

    $_ *= 2 for @num_array;

    return @num_array;
}

my @rand_array = (1,2,3,4,5);

print join (", ", double_array(@rand_array)), "\n";

# returning several values
sub get_mults {
    my ($rand_num) = @_;

    $rand_num ||= 1;

    return $rand_num * 2, $rand_num * 3;
}

# assigning those values to variables:
my ($dbl_num, $trip_num) = get_mults(3);

say "$dbl_num , $trip_num";

# recursive functions + multiple return with if clause
sub factorial {

    my ($num) = @_;

    return 0 if $num <= 0;
    return 1 if $num == 1;
    return $num * factorial($num - 1);
}

say "Factorial 4 = ", factorial(4);

#reading files:

my $emp_file = 'test.txt';

open my $fh, '<', $emp_file
    or die "Can't open file : $_";

while(my $info = <$fh>) {

    chomp($info); # getting the first newline in the file,
    # a safer version of chop; removes any trailing string that corresponds to the current value of $/ (newline)

    my ($emp_name, $job, $id) = split /:/, $info;

    print "$emp_name is a $job and has the id of $id \n";
}

close $fh or die "Could not close the file: $_";

# append, write to the file data:
open $fh, '>>', $emp_file
     or die "Can't open file : $_";

print $fh "Mark:Salesman:124\n";

close $fh or die "Could not close the file: $_";

# read and write data in the file
open $fh, '+<', $emp_file
     or die "Can't open file : $_";

seek $fh, 0, 0;

print $fh "Phil:Salesman:125\n";

close $fh or die "Could not close the file: $_";

my $whiskers = new Animal::Cat("whiskers", "Derek");

say $whiskers->getName();

$whiskers->setName("Whiskers");

say $whiskers->getName();

say $whiskers->getSound();

use Animal::Lion;

my $king = new Animal::Lion("King Lion", "No Owner");

say $king->getSound();


