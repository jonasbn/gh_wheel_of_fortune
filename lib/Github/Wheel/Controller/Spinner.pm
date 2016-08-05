package Github::Wheel::Controller::Spinner;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::Cache;

# This action will render a template
sub initiate {
    my $self = shift;

    my $last_db_update
        = $self->dbh->selectall_arrayref('SELECT last_db_update FROM app')
        ->[0]->[0];

    my $number_of_projects
        = $self->dbh->selectall_arrayref('SELECT count(*) FROM available_projects_v1')
        ->[0]->[0];

    $self->render(
        number_of_projects => $number_of_projects,
        last_db_update     => $last_db_update,
    );
}

sub spin {
    my $self = shift;
    my $number_of_projects = $self->param('number_of_projects');

    my $projects = $self->dbh->selectall_arrayref('SELECT id FROM available_projects_v1');

    my $picked_project = int( rand($number_of_projects) );

    my $project
        = $self->dbh->selectrow_hashref(
        'SELECT name, id, url FROM projects WHERE id = ?',
        {}, $projects->[$picked_project]->[0] );

    return $self->render( json => { data => $project } );
}

1;
