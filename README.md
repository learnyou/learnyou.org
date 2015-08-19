# website

This is the source for http://www.learnyou.org/ . 

It's written mostly in [Markdown][pdmd], and compiled into a static HTML
site using a Haskell script. The Haskell script uses a Haskell library
called [Hakyll][hak]. If you're familiar with Ruby's Jekyll, or Python's
Hyde, Hakyll is the Haskell analog.

The file hierarchy is explained in `main.hs`.

# Compiling

1. [Install Stack](https://github.com/commercialhaskell/stack/wiki/Downloads)
2. `stack setup && stack build -j 5`

   This will build the Haskell script needed to build the site. It takes
   a *long* time.

3. `stack exec -- website rebuild && stack exec -- website serve`
4. `firefox http://localhost:8000`

# Contact

* IRC: `pharpend` on FreeNode and OFTC
* Email: `peter@harpending.org`

[pdmd]: http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html
[hak]: http://jaspervdj.be/hakyll/
[hask]: https://github.com/bitemyapp/learnhaskell#getting-started
[lysa]: https://gitlab.com/groups/lysa
