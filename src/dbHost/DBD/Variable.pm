package DBD::Variable;
use DBD::Base;
@ISA = qw(DBD::Base);

my %var_types = ("int" => 1, "double" => 1);

sub init {
    my ($this, $name, $type) = @_;
    if (defined $type) {
    	unquote $type;
    } else {
	$type = "int";
    }
    exists $var_types{$type} or
	dieContext("Unknown variable type '$type', valid types are:",
	    sort keys %var_types);
    $this->SUPER::init($name, "variable name");
    $this->{VAR_TYPE} = $type;
    return $this;
}

sub var_type {
	my $this = shift;
	return $this->{VAR_TYPE};
}

1;
