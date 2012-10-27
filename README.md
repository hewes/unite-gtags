# unite-gtags

## Introduction

unite-gtags is a [unite.vim](https://github.com/Shougo/unite.vim)'s source.
Execute 'global' command and display the result in Unite interface.

## Install

Install the distributed files into your Vim script directory which is usually
$HOME/.vim,  or $HOME/vimfiles on Windows.

## Prerequisite

GNU GLOBAL (5.7 or later) must be installed your system and the executable binary on your PATH.

## Usage

### List context result
Show the references or definitions of a word.
execute Unite command with "gtags/context" as a source parameter.

  :Unite gtags/context

it executes 'global --from-here' with <cword>.
when a cursor is on a definition, list references.
otherwise list definitions.

### List references
Show the references of a word.
execute Unite command with "gtags/ref" as a source parameter.

  :Unite gtags/ref

it executes 'global -rs' with a pattern.
when exeucte Unite with no arguments, the pattern is <cword>,
otherwise the pattern is the first argument.

### List definitions
Show the definitions of a word.
execute Unite command with "gtags/def" as a source parameter.

  :Unite gtags/def

it executes 'global -d' with a pattern.
when exeucte Unite with no arguments, the pattern is <cword>,
otherwise the pattern is the first argument.

### List grep result
Show the grep result of a word.
execute Unite command with "gtags/gtags" as a source parameter.

  :Unite gtags/gtags

it executes 'global -g' with a pattern.
when exeucte Unite with no arguments, input pattern after execute command,
otherwise the pattern is the first argument.

### List all tokens
Show all tokens on GTAGS
execute Unite command with "gtags/completion" as a source parameter.

  :Unite gtags/completion

it executes 'global -c' and show results.

default action on the result is 'list_definitions'.
'list_references' is also available.

