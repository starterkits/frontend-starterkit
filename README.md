Frontend StarterKit is a barebones framework with [gulp](http://gulpjs.com/) configured for rapid development.

CoffeeScript, SCSS, Zurb Foundation, and Bower are installed and configured.

By default, CSS files are included by requiring them in JavaScript files via webpack magic. This reduces network latency and allows webpack to intelligently manage which files are actually required. See [src/js/head.coffee](https://github.com/starterkits/frontend-starterkit-minimal/blob/master/src/js/head.coffee).


# Install

```bash
git clone https://github.com/starterkits/frontend-starterkit.git
cd frontend-starterkit
npm install
```

# Development

```bash
# Run webpack-dev-server
gulp

# Or manually run webpack if needed
webpack -d --colors
```

# Production

```bash
# Compile assets for production
gulp build
```
