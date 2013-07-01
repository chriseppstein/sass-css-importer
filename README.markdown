# Sass CSS Importer Plugin

The Sass CSS Importer allows you to import a CSS file into Sass.

## Stylesheet Syntax

The `.css` extension triggers special behavior in Sass so you cannot
import a file with a CSS extension. To work around this, you must use a
special prefix on the import string and omit the extension.

    @import "CSS:library/some_css_file"

## Installation

    $ gem install sass-css-importer

## Use with the Sass command line

    $ sass -r sass-css-importer --watch sass_dir:css_dir

Note: several -r options can be given to the sass command line if you
need to require several libraries.

## Use with compass

Add the following to your compass configuration:

    require 'sass-css-importer'

## More complex scenarios

This plugin assumes you want to import CSS files relative to a sass
file. More complex scenarios are acheivable by adding a CSS Importer to
the Sass load path option explicitly.

For example, in compass you can do the following in your `config.rb`
file:

```ruby
require 'sass-css-importer'
add_import_path Sass::CssImporter::Importer.new("/path/to/the/css/files")
```



