package Curses::UI::Number;

# Pragmas.
use base qw(Curses::UI::Label);
use strict;
use warnings;

# Modules.
use Curses::UI::Common qw(keys_to_lowercase);
use Curses::UI::Label;
use Encode qw(decode_utf8);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, %userargs) = @_;
	keys_to_lowercase(\%userargs);
	my %args = (
		'-num' => undef,
		'-char' => decode_utf8('█'),
		%userargs,
	);

	# Text.
	$args{'-text'} = _text($args{'-char'}, $args{'-num'});

	# Create the widget.
	my $self = $class->SUPER::new(%args);

	# Layout.
	$self->layout;

	# Return object.
	return $self;
}

# Get or set number.
sub num {
	my ($self, $number) = @_;
	if (defined $number) {
		$self->{'-num'} = $number;
		$self->{'-text'} = _text($self->{'-char'}, $number);
	}
	return $self->{'-num'};
}

# Return structure of pixels.
sub _num {
	my $number = shift;
	return [
		[1,1,1,1,0,1,1,0,1,1,0,1,1,1,1], # 0
		[0,0,1,0,0,1,0,0,1,0,0,1,0,0,1], # 1
		[1,1,1,0,0,1,1,1,1,1,0,0,1,1,1], # 2
		[1,1,1,0,0,1,1,1,1,0,0,1,1,1,1], # 3
		[1,0,1,1,0,1,1,1,1,0,0,1,0,0,1], # 4
		[1,1,1,1,0,0,1,1,1,0,0,1,1,1,1], # 5
		[1,1,1,1,0,0,1,1,1,1,0,1,1,1,1], # 6
		[1,1,1,0,0,1,0,0,1,0,0,1,0,0,1], # 7
		[1,1,1,1,0,1,1,1,1,1,0,1,1,1,1], # 8
		[1,1,1,1,0,1,1,1,1,0,0,1,1,1,1], # 9
	]->[$number];
}

# Convert number to text.
sub _text {
	my ($char, $number) = @_;
	my $text = '';
	my $num_ar = _num($number);
	foreach my $i (0 .. 14) {
		if ($num_ar->[$i]) {
			$text .= $char x 2;
		} else {
			$text .= '  ';
		}
		if ($i != 14 && ($i + 1) % 3 == 0) {
			$text .= "\n";
		}
	}
	return $text;
}

1;
