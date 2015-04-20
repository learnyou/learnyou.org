#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}

-- Copyright (C) 2014-2015, Various Contributors.
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- General Public License for more details.
-- 
-- Note that this particular file is licensed under the GPL, but the
-- input and output of this program is not. The input and output files
-- are licensed under the Creative Commons ShareAlike-4.0 license. If
-- you want to read that license, see the LICENSE file in the project
-- root.

import       Data.ByteString.Lazy (ByteString)
import       Data.ByteString.Lazy.Char8 (unpack)
import       Data.Monoid (mappend)
import       Hakyll
import       System.Posix.Resource
import       Text.Pandoc

sass :: Compiler (Item ByteString)
sass = getResourceLBS
       >>= withItemBody (unixFilterLBS "sass" ["--stdin", "--style", "compressed"]) 

main :: IO ()
main = hakyll $ do
  match "res/**" $ do
    route idRoute
    compile copyFileCompiler

  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "pages/*" $ do
    route $ composeRoutes (gsubRoute "pages/" (const "")) (setExtension "html")
    defaultCompile

  match "stylesheets/*" $ do
    route $ setExtension "css"
    compile sass

  match "templates/*" $
    compile templateCompiler


defaultCompile = do
  let pandocWriterOptions = def -- { writerHTMLMathMethod = MathJax "res/mathjax/MathJax.js" }
  compile $ pandocCompilerWith def pandocWriterOptions
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
