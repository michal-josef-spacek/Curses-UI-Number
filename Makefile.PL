# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Create and manipulate number widgets.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Curses-UI-Number';
requires 'Curses' => 0;
requires 'Encode' => 0;
readme_from 'Number.pm';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Curses-UI-Number';
resources 'homepage' => 'https://github.com/tupinek/Curses-UI-Number';
resources 'repository' => 'git://github.com/tupinek/Curses-UI-Number';
test_requires 'English' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
