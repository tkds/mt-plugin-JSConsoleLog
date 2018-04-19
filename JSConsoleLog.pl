package MT::Plugin::JSConsoleLog;

use strict;
use base qw( MT::Plugin );
my $plugin = MT::Plugin::JSConsoleLog->new({
	id				=> 'jsconsolelog',
	key				=> __PACKAGE__,
	name			=> 'JSConsoleLog',
	description		=> 'This shows log on browser console tab.',
	registry		=> {
		tags  =>  {
			function  =>  {
					'JSConsoleLog'  =>  \&hdlr_js_console_log,
			},
		},
	}
});

MT->add_plugin ($plugin);

sub hdlr_js_console_log {
	my ( $ctx, $args ) = @_;
	my $value = $args->{ value };
	my $alert = $args->{ alert };
	return "<script>console.log(\"" . $value . "\");</script>" if $value;
	return "<script>console.log( alert(\"" . $alert . "\"));</script>" if $alert;
}

1;