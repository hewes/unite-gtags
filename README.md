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

Default action on the result is 'list\_references'.
'list\_definitions' is also available.

## Configuration

### Project Configuration

Set project specific configuration. Project is specified with $GTAGSROOT if configured,
otherwise with result of fnamemodify('.', ':p'), usually current dir described as absolute path '/' added.

Following items are configured for each project:

- treelize (0 or 1): treelize result format or not
- absolute_path (0 or 1): add 'a' option to global command or not
- gtags_libpath (list of string): join with ':' and use it as GTAGSLIBPATH

Configuration Example:

    g:unite_source_gtags_project_config = {
      \ '/home/foo/project1/': { 'treelize': 0 },
      \ '_':                   { 'treelize': 1 }
      \ }
    " specify your project path as key.
    " '_' in key means default configuration.

#### treelize

When treelize = 1, unite result is grouped by filepath and enable you to select a candidate with tree like interface.
This format is effective when filepath is too long string.

Default format:

    sample1/foo.rb  |2|  def hoge
    sample1/foo.rb  |6|    hoge
    sample2/bar.rb  |4|    hoge

Tree format:

    [path] sample1/foo.rb
    |2|  def hoge
    |6|    hoge
    [path] sample2/bar.rb
    |4|    hoge

#### absolute\_path

When absolute\_path = 1, add 'a' option to global command.
Path in unite result changes to absolute\_path format.

Relative path (default):

    sample1/foo.rb |2|   def hoge
    sample1/foo.rb |6|     hoge
    sample2/bar.rb |4|     hoge

Absolute path:

    /home/foo/sample1/foo.rb |2|   def hoge
    /home/foo/sample1/foo.rb |6|     hoge
    /home/foo/sample2/bar.rb |4|     hoge

#### gtags\_libpath

When gtags\_libpath is specified with list of string,
unite-gtags joins them with ':' and use the joined string as GTAGSLIBPATH.
(*caution* joinining multiple pathes is available in only \*nix system.)

Example:

When configure gtags\_libpath with following

    let g:unite_source_gtags_project_config[<cur_dir>] = {
    \ 'gtags_libpath': ['/usr/include/', '/home/foo/include/']
    \ }

unite-gtags executes global with temporary environment variable GTAGSLIBPATH:

    GTAGSLIBPATH=$GTAGSLIBPATH:/usr/include/:/home/foo/include/ global ...

### Syntax Highlight

* uniteSource\_\_Gtags\_LineNr

    Highlight for Line number (default linked to LineNr).

* uniteSource\_\_Gtags\_Path

    Highlight for filepath (default linked to File).


