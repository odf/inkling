Inkling is a toolset for building Knowledge Management Systems. It can easily be added to a Rails 3 app as an engine. It is currently written to run on ActiveRecord, against Postgres, but an early goal was to abstract all model logic into Active Model.

As a toolset, it leverages Rails conventions (acts_as methods, etc.) to allow developers to assemble their own knowledge management system easily, without introducing further rules to restrict their development elsewhere of typical Rails features. 

An 'inkling' is a piece of information which is meant to be published. 

Current features:

* Inklings - ActiveRecord models can act_as_inkling - giving them friendly URLs. Routes configured are with inkling_match(:foo). Simply write the controller CRUD to define your inkling.
* Themes - themes are collections of layouts, partials and templates which are recorded in the database and written out into file format for use.
* Feeds - feeds can be used to create RSS, Atom, and Email lists. Feeds take strategies and sources, allowing any sort of aggregate information to be assembled.
* Logs - logs are modelled in the database, and categorised. They can be used to notify users of what has happened in the system, or fine grained auditing.
* Simple User integration - Inkling creates a User class, but it is assumed the hosting app. will define its own (thus overriding the model in the Inkling engine.) Just add acts_as_inkling_user to your user class to inherit Inkling behaviours (see lib/inkling/user_methods). You must ensure that your user database migration for the user class precedes the inkling migrations (which the inkling:bootstrap rake task runs), otherwise inkling will create an empty User table in the migration run.

More features are coming. 


Installing
----------
cd into testapp

'rake inkling:bootstrap' - to get started.

'rake inkling:rebuild' - to regenerate everything.

'rails server' - to start the testapp server

Contributors
------------
* Nicholas Faiz
* Clifford Heath

Copyright Notice
----------------
COPYRIGHT (c) 2011 Tree Falling In The Woods Pty Ltd.


Inkling code is copyrighted to Tree Falling In The Woods, Pty Ltd. and available under the MIT License.
It includes software from other projects, other people, listed below, all available through the MIT license.

* Devise
* Ruby on Rails - http://rubyonrails.org - David Heinemeier Hansson, etc..
* Enki - http://www.enkiblog.com/ - Xavier Shay. 

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE

