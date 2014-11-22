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

## CodeMirror for Rails >= 3.1

All of the assets from the most latest stable CodeMirror release are vendored
so that you can use them with the asset pipeline.  At a minimum, you will
probably want the following in your application.js:

```js
//= require codemirror
```

And in your application.css:

```css
/*
*= require codemirror
*/
```

### Adding a mode

Additional syntax modes can be added to your application.js:

```js
//= require codemirror/modes/ruby
```

### Adding an addon

Additional addons can be added in your application.js:

```js
//= require_tree codemirror/addons/dialog
```

And your application.css:

```css
/*
*= require_tree codemirror/addons/dialog
*/
```

### Adding a keymap

Additional keymap bindings can be added to your application.js:

```js
//= require codemirror/keymaps/vim
```

### Adding a theme

Additional CSS themes can be added to your application.css

```css
/*
*= require codemirror/themes/night
*/
```

### Precompiling Codemirror

If your project is using precompiling, depending on your method of grabbing files to precompile, you might need to add the below line to your ```` application.rb```, to get rails to precompile all js, css files used by codemirror. You can also manually whitelist only the files that you use.

```rb
config.assets.precompile += ["codemirror*", "codemirror/**/*"]
```


## CodeMirror for Rails 3

You can use the generator included with this gem to copy the CodeMirror 2
assets into your Rails 3 public directory.

```shell
rails generate codemirror:install
```
### Contributing

Find a mistake? New version of CodeMirror? Submit a pull request!
