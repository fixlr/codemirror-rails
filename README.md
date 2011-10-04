# codemirror-rails

CodeMirror's JavaScript and CSS assets for Rails applications.


## Getting Started

Install the codemirror-rails gem.

```
gem install codemirror-rails
```

Or add it to your Gemfile:

```
gem 'codemirror-rails'
```

And...

## CodeMirror for Rails 3.1

All of the assets from the most latest stable CodeMirror release are vendored
so that you can use them with the asset pipeline.  At a minimum, you will
probably want the following for you application.js:

```javascript
//= require codemirror
```

And for your application.css:

```css
/*
 *= require codemirror
 */
```

### Adding a mode

application.js:

```javascript
//= require codemirror/modes/ruby
```

### Adding a theme

application.css
```css
/*
 *= require codemirror/themes/night
 */
```


## CodeMirror for Rails 3

Generator to install current version of CodeMirror 2 into a
Rails 3 project. 

```
rails generate codemirror:install
```
