package Acme::CPANModules::LoadingModules;

use strict;

use Acme::CPANModulesUtil::Misc;

# AUTHORITY
# DATE
# DIST
# VERSION

my $text = <<'MARKDOWN';

**Basics**

<pm:Module::Load> is basically just a thin wrapper over Perl's builtin
`require()` to translate between module name and path name, since the
traditional behavior of `require()` is to expect module name in bareword form
but path name in string form. This confusion will likely be fixed in future perl
versions. For example, see PPC 0006 [1].

[1] <https://github.com/Perl/PPCs/blob/main/ppcs/ppc0006-load-module.md>


**Installing modules automatically on demand**

Since Perl provides require hooks, one can trap the module loading process and
check for an uninstalled module and attempt to install it automatically on
demand when a code wants to load that module. Probably not suitable for use in
production. See separate list: <pm:Acme::CPANModule::ModuleAutoinstallers>.


**Loading module on demand**

Aside from require hook, Perl also provides the AUTOLOAD mechanism (see
`perlsub` documentation for more details). This lets you catch unknown function
being called and lets you attempt to load a module that might provide that
function. It is not exactly "loading modules on demand" but close enough for a
lot of cases. See separate list: <pm:Acme::CPANModule::ModuleAutoloaders>.


**Loading multiple modules at once**

<pm:all> requires all packages under a namespace. It will search the filesystem
for installed module source files under a specified namespace and load them all.

<pm:lib::require::all> loads all modules in a directory.


**Logging module loading**

<pm:Require::HookChain::log::logger>

<pm:Require::HookChain::log::stderr>


**Preventing loading certain modules**

<pm:lib::filter>, <pm:lib::disallow>


**Require hook frameworks**

These frameworks let you create require hook more easily.

<pm:Require::Hook>

<pm:Require::Hook::More>

<pm:Require::HookChain>


**Specifying relative paths**

<pm:lib::relative>

MARKDOWN

our $LIST = {
    summary => 'List of modules to load other Perl modules',
    description => $text,
    tags => ['task'],
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:

=head1 SEE ALSO

L<Acme::CPANModules::ModuleAutoinstallers>

L<Acme::CPANModules::ModuleAutoloaders>
