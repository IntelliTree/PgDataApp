use strict;
use warnings;

use PgDataApp;

my $app = PgDataApp->apply_default_middlewares(PgDataApp->psgi_app);
$app;

