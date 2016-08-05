package Github::Wheel;

use Mojo::Base 'Mojolicious';
use DBI;

use constant TRUE => 1;

# This method will run once at server start
sub startup {
    my $self = shift;

    my $dbh = DBI->connect(
        "dbi:SQLite:develop.db",
        "", "",
        {   RaiseError                       => TRUE,
            AutoCommit                       => TRUE,
            sqlite_use_immediate_transaction => TRUE,
            sqlite_unicode                   => TRUE
        }
    ) or die 'Unable to connect to database', $DBI::errstr;

    # dbh is a helper
    $self->helper( dbh => sub { return $dbh; } );

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('Spinner#initiate');
    $r->get('/spin')->to('Spinner#spin');
}

1;
