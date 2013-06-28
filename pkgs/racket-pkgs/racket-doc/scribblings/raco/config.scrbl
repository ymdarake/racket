#lang scribble/doc
@(require scribble/manual
          "common.rkt"
          (for-label racket/base
                     racket/contract
                     setup/dirs))

@title[#:tag "config-file"]{Installation Configuration and Search Paths}

A configuration-directory path is built into the Racket executable as
selected at install time, or its location can be changed via the
@envvar{PLTCONFIGDIR} directory or @DFlag{config}/@Flag{G}
command-line flag. Use @racket[find-config-dir] to locate the
configuration directory.

Modify the @filepath{config.rktd} file as described below to configure
other directories, but use the @racketmodname[setup/dirs] library (which
combines information from the configuration files and other sources)
to locate configured directories.

A @filepath{config.rktd} file in the configuration directory should
contain a @racket[read]able hash table with any of the following
symbolic keys, where an relative path is relative to the main collection
directory:

@itemlist[

 @item{@racket['doc-dir] --- a path, string, or byte string for the
       main documentation directory. The value defaults to a
       @filepath{doc} sibling directory of the parent of the 
       main collection directory.}

 @item{@racket['lib-dir] --- a path, string, or byte string for the
       main library directory; it defaults to the parent
       directory of the main collection directory.}

 @item{@racket['lib-search-dirs] --- a list of paths, strings, byte
       strings, or @racket[#f] representing the search path for
       directories containing foreign libraries; each @racket[#f] in
       the list, if any, is replaced with the default search path,
       which is the user- and version-specific @filepath{lib}
       directory followed by the main library directory.}

 @item{@racket['dll-dir] --- a path, string, or byte string for a
       directory containing Unix shared libraries for the main
       executable; it defaults to the main library directory.}

 @item{@racket['links-file] --- a path, string, or byte string for the
       @tech[#:doc reference-doc]{collection links file}; it defaults
       to a @filepath{links.rktd} file in the parent of the main
       collection directory.}

 @item{@racket['links-search-files] --- like @racket['lib-search-dirs],
       but for @tech[#:doc reference-doc]{collection links file}.}

 @item{@racket['pkgs-dir] --- a path, string, or byte string for
       packages that have installation scope; it defaults to
       @filepath{pkgs} in the main library directory.}

 @item{@racket['pkgs-search-dirs] --- like @racket['lib-search-dirs],
       but for packages in installation scope.}

 @item{@racket['bin-dir] --- a path, string, or byte string for the
       main directory containing executables; it defaults to a
       @filepath{bin} sibling directory of the parent of the main collection
       directory.}

 @item{@racket['doc-search-dirs] --- like @racket['lib-search-dirs],
       but for directories containing documentation.}

 @item{@racket['include-dir] --- a path, string, or byte string for
       the main directory containing C header files; it defaults to an
       @filepath{include} sibling directory of the main library
       directory.}

 @item{@racket['include-search-dirs] --- like
       @racket[doc-search-dirs], but for directories containing C
       header files}

 @item{@racket['absolute-installation?] --- a boolean that is
       @racket[#t] if the installation uses absolute path names,
       @racket[#f] otherwise.}

 @item{@racket['cgc-suffix] --- a string used as the suffix (before
       the actual suffix, such as @filepath{.exe}) for a
       @filepath{CGC} executable. Use Windows-style casing, and the
       string will be downcased as appropriate (e.g., for a Unix
       binary name). A @racket[#f] value means that if the
       @exec{racket} binary identifies itself as CGC, then the suffix
       is @racket[""], otherwise it is @racket["CGC"].}

 @item{@racket['3m-suffix] --- analogous to @racket['cgc-suffix], but
       for 3m. A @racket[#f] value means that if the @filepath{racket}
       binary identifies itself as CGC, then the suffix is
       @racket["3m"], otherwise it is @racket[""].}

]
