This is the source for http://learnyou.org/ . It's written mostly in
[Markdown][pdmd], and compiled into a static HTML site using the `site/main.hs`
file. `site/main.hs` uses a Haskell library called [Hakyll][hak]. If you're
familiar with Ruby's Jekyll, or Python's Hyde, Hakyll is the Haskell analog.

The current maintainer is me, Peter Harpending. I'm looking for a new
maintainer, hopefully one who can make the site into an actual website with a
blog and stuff. Currently it's entirely static. I'm not willing to make a whole
website. I'm instead focusing my efforts on [LYSA][lysa], the subject of the
website.

# Compiling

You'll need to [install Haskell][hask]. From there you can run `cabal install
hakyll` to install Hakyll. `cd` into the `site/` directory, and run `./main.hs
help` to see all of the options.

# LYSA

The subject of this site is
[Learn You Some Algebras for Glorious Good!](https://gitlab.com/groups/lysa), a
math textbook I'm writing with a number of other people.

# Contact

The best way to contact me is through the
[`#lysa` IRC channel on FreeNode](https://webchat.freenode.net/?channels=%23lysa). You
can also email me at `peter@harpending.org`. We also have
[a Reddit community](https://lysa.reddit.com/) if you want a forum-type
experience.

[pdmd]: http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html
[hak]: http://jaspervdj.be/hakyll/
[hask]: https://github.com/bitemyapp/learnhaskell#getting-started
