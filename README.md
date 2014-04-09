Frontend StarterKit is a barebones framework with [gulp](http://gulpjs.com/) configured for rapid development.

CoffeeScript, SCSS, Zurb Foundation, and Bower are installed and configured.



# Install

```bash
git clone https://github.com/starterkits/frontend-starterkit.git
cd frontend-starterkit
npm install -g bower
npm install
```

# Development

```bash
# Build and watch assets
gulp

# Open index page in browser
open dist/index.html
```

# Production

```bash
# Compile assets for production
gulp clean
gulp build
```


# Resources

* [HTML2Jade](http://html2jade.org/) – copy and paste html to conver to jade
* [Modern SASS Workflow](http://bensmithett.com/goodbye-compass/) – blog post


# Additional Packages

These are useful utils that are not currently included in the starterkit.

* [gulp-spritesmith](https://github.com/twolfson/gulp.spritesmith)
* [autoprefixer](https://github.com/ai/autoprefixer)

