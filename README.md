# codemirror-rails

Wire up the [CodeMirror](http://codemirror.net/) assets for your Rails 
applications.

## Getting Started

If you're using Bundler, you can add codemirror-rails to your Gemfile:

```ruby
gem 'codemirror-rails'
```

Or manually install the codemirror-rails gem:

```shell
gem install codemirror-rails
```

## CodeMirror for Rails 3.1

All of the assets from the most latest stable CodeMirror release are vendored
so that you can use them with the asset pipeline.  At a minimum, you will
probably want the following in your application.js and application.css:

```js
//= require codemirror
```

### Adding a mode

Additional syntax modes can be added to your application.js:

```js
//= require codemirror/modes/ruby
```

### Adding a util

Additional reusable util components can be added in your application.js:

```js
//= require codemirror/utils/dialog
```

### Adding a keymap

Additional keymap bindings can be added to your application.js:

```js
//= require codemirror/keymaps/vim
```

### Adding a theme

Additional CSS themes can be added to your application.css

```js
//= require codemirror/themes/night
```

## CodeMirror for Rails 3

You can use the generator included with this gem to copy the CodeMirror 2
assets into your Rails 3 public directory.

```shell
rails generate codemirror:install
```
