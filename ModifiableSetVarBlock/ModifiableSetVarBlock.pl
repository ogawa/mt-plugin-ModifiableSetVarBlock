# SetVarChunk
#
# $Id$
#
# This software is provided as-is. You may use it for commercial or 
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2007 Hirotaka Ogawa

package MT::Plugin::ModifiableSetVarBlock;
use strict;
use base qw(MT::Plugin);

use MT;
use MT::Template::Context;

our $VERSION = '0.01';

my $plugin = __PACKAGE__->new({
    id          => 'modifiable_set_var_block',
    name        => 'ModifiableSetVarBlock',
    description => q(<MT_TRANS phrase="ModifiableSetVarBlock overrides MTSetVarBlock with an alternative version, which can be used with 'modifiers'.">),
    doc_link => 'http://code.as-is.net/wiki/ModifiableSetVarBlock',
    author_name => 'Hirotaka Ogawa',
    author_link => 'http://profile.typekey.com/ogawa/',
    version     => $VERSION,
    l10n_class  => 'ModifiableSetVarBlock::L10N',
});
MT->add_plugin($plugin);

sub init {
    my $plugin = shift;
    $plugin->SUPER::init(@_);
    my $registry = MT->component('core')->registry('tags', 'block');
    $registry->{SetVarBlock} = \&_hdlr_set_var_block;
}

sub _hdlr_set_var_block {
    my($ctx, $args) = @_;
    my $tag = lc $ctx->stash('tag');
    my $name = $args->{name} || $args->{var};
    return $ctx->error(MT->translate(
        "You used a [_1] tag without any arguments.", "<MT$tag>" ))
        unless defined $name;

    my $val = MT::Template::Context::_hdlr_pass_tokens(@_);
    return unless defined($val);
    if (my $ph = $ctx->post_process_handler) {
        $val = $ph->($ctx, $args, $val);
    }

    if ($args->{prepend}) {
        my $existing = $ctx->var($name);
        $existing = '' unless defined $existing;
        $val = $val . $existing;
    } elsif ($args->{append}) {
        my $existing = $ctx->var($name);
        $existing = '' unless defined $existing;
        $val = $existing . $val;
    }
    $ctx->var($name, $val);
    return '';
}

1;
