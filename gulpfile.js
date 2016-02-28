'use strict';

var gulp          = require('gulp');
var autoprefixer  = require('gulp-autoprefixer');
var webserver     = require('gulp-webserver');
var watch         = require('gulp-watch');
var sass          = require('gulp-sass');

gulp.task('webserver', function() {
  gulp.src('./')
    .pipe(webserver({
      livereload: true,
      open: true,
      fallback: 'index.html'
    }));
});

gulp.task('sass', function () {
  return gulp.src('./app/assets/stylesheets/**/*.scss')
    // .pipe(watch('./app/assets/stylesheets/**/*.scss'))
    .pipe(sass().on('error', sass.logError))
    .pipe(autoprefixer({
      browsers: ['last 10 versions', 'not ie <= 10'],
      cascade: false
    }))
    .pipe(gulp.dest('./dist/css/'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./app/assets/stylesheets/**/*.scss', ['sass']);
});

gulp.task('javascript', function() {
  return gulp.src('./app/assets/javascripts/**/*.js')
    .pipe(watch('./app/assets/javascripts/**/*.js'))
    .pipe(gulp.dest('./dist/js/'));
});

gulp.task('images', function() {
  return gulp.src('./app/assets/images/**/*')
    .pipe(watch('./app/assets/images/**/*'))
    .pipe(gulp.dest('./dist/images/'))
});

gulp.task('fonts', function() {
  return gulp.src('./node_modules/devicons/fonts/devicons.*')
    .pipe(gulp.dest('./dist/fonts/'))
});

gulp.task('assets', ['sass:watch', 'javascript', 'fonts', 'images'])

gulp.task('default', ['webserver', 'assets'])
