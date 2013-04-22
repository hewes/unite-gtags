# unite-gtags

## Introduction

unite-gtags is a [unite.vim](https://github.com/Shougo/unite.vim)'s source.
Execute 'global' command and display the result in Unite interface.

## Install

Install the distributed files into your Vim script directory which is usually
$HOME/.vim,  or $HOME/vimfiles on Windows.

## Prerequisite

GNU GLOBAL (5.7 or later) must be installed your system and the executable binary *global* on your PATH.

## Usage

The sub commands with which this source provide below:

- Unite gtags/context
- Unite gtags/ref
- Unite gtags/def
- Unite gtags/grep
- Unite gtags/completion

### List context result
Show the references or definitions of a word.
Execute Unite command with "gtags/context" as a source parameter.
It executes 'global --from-here' with expand('\<cword\>')'.

    :Unite gtags/context

If cursor is on a definition, the result may be references of it,
otherwise may be definitions.
Arguments of this command has no work, the command ignores it.

### List references
Show references of a word.

Execute Unite command with "gtags/ref" as a source parameter.
It executes 'global -rs' with a pattern which is spcecified as first argument.

    :Unite gtags/ref:<pattern>

When exeucte Unite with no arguments, expand('\<cword\>') is used as pattern.

    :Unite gtags/ref

### List definitions
Show definitions of a word.

Execute Unite command with "gtags/def" as a source parameter.
It executes 'global -d' with a pattern which is specified as first argument.

    :Unite gtags/def:<pattern>

When exeucte Unite with no arguments, the pattern is expand('\<cword\>'),

    :Unite gtags/def

### List grep result
Show the grep result of a word.

Execute Unite command with "gtags/grep" as a source parameter.
It executes 'global -g' with a pattern which is specified as first argument.

    :Unite gtags/grep:<pattern>

When exeucte Unite with no arguments, input pattern on prompt.

    :Unite gtags/grep

### List all tokens
Show all tokens on GTAGS
Execute Unite command with "gtags/completion" as a source parameter.
It executes 'global -c' and show results.

    :Unite gtags/completion

Default action on the result is 'list_references'.
'list_definitions' is also available.

