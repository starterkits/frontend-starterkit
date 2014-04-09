# Reference:
# https://gist.github.com/chriskjaer/8634047


gulp = require 'gulp'
gutil  = require 'gulp-util'
jshint = require 'gulp-jshint'
coffee = require 'gulp-coffee'
sass   = require 'gulp-sass'
jade   = require 'gulp-jade'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
clean  = require 'gulp-clean'


# Script src in index.html
bundle = 'bundle.js'

# Source dir
src = 'src/'

# Distribution dir
dist = 'dist/'

# Vendor scripts
vendor = [
  'bower_components/jquery/dist/jquery.min.*'
  'bower_components/foundation/js/foundation.min.*'
  'bower_components/modernizr/modernizr.js'
]


# Default Task
gulp.task 'default', ['build', 'watch']

gulp.task 'build', [
  #'lint'
  'css'
  'vendor'
  'scripts'
  'html'
]


# Clean distribution dir
gulp.task 'clean', ->
  gulp.src dist, read: false
  .pipe clean()


# Lint Task
gulp.task 'lint', ->
  gulp.src "#{src}/js/*.js"
  .pipe jshint()
  .pipe jshint.reporter 'default'


# Compile Sass
gulp.task 'css', ->
  gulp.src "#{src}styles/*.scss"
  .pipe sass
    includePaths: ['styles', 'bower_components/foundation/scss', 'bower_components']
    errLogToConsole: true
  .pipe gulp.dest "#{dist}css"


# Copy vendor scripts
gulp.task 'vendor', ->
  gulp.src vendor, read: false
  .pipe gulp.dest "#{dist}js/vendor/"


# Compile CoffeeScript
gulp.task 'scripts', ->
  gulp.src "#{src}js/*.coffee"
  .pipe (coffee
    bare: true
  ).on 'error', gutil.log
  .pipe concat bundle
  .pipe gulp.dest "#{dist}js"


# Compile Jade
gulp.task 'html', ->
  gulp.src "#{src}*.jade"
  .pipe jade
    pretty: true
  .pipe gulp.dest dist
#  .pipe livereload server


# gulp.task 'minify', ->
#   .pipe rename 'all.min.js'
#   .pipe uglify()
#   .pipe gulp.dest 'dist'


# Watch files for changes
gulp.task 'watch', ->
  gulp.watch "#{src}js/*.coffee", [
    #'lint'
    'scripts'
  ]
  gulp.watch "#{src}styles/*.scss", ['css']
  gulp.watch "#{src}/*.jade", ['html']
  return
