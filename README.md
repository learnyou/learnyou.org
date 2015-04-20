# website

This is the source for http://learnyou.org/ . 

It's written mostly in [Markdown][pdmd], and compiled into a static HTML
site using a Haskell script. The Haskell script uses a Haskell library
called [Hakyll][hak]. If you're familiar with Ruby's Jekyll, or Python's
Hyde, Hakyll is the Haskell analog.

The file hierarchy is explained in `main.hs`.

# Compiling

**tl;dr**

1. [Install Haskell](https://github.com/bitemyapp/learnhaskell#getting-set-up)
2. `cabal install hakyll pandoc`
3. `./main.hs rebuild && ./main.hs serve`

   This step takes a crazy amount of time. This is mostly because I
   included all of MathJax in the website. (This is so the site works in
   browsers with XSS protection).

4. `firefox http://localhost:8000`

# Contact

* IRC: `pharpend` on FreeNode and OFTC
* Email: `peter@harpending.org`

[pdmd]: http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html
[hak]: http://jaspervdj.be/hakyll/
[hask]: https://github.com/bitemyapp/learnhaskell#getting-started
[lysa]: https://gitlab.com/groups/lysa
