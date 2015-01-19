var gulp        = require('gulp'),
    fileinclude = require('gulp-file-include'),
    deploy      = require('gulp-gh-pages'),
    browserSync = require('browser-sync'),
    reload      = browserSync.reload,
    markdown    = require('markdown'),
    del         = require('del');

gulp.task('templating', function() {
  gulp.src(['./src/templates/index.html'])
  .pipe(fileinclude({
    prefix: '@@',
    basepath: './src',
    filters: {
      markdown: markdown.parse
    }
  }))
  .pipe(gulp.dest('./dist/'));
});

gulp.task('assets', function() {
  gulp.src('src/assets/**').pipe(gulp.dest('dist/assets'));
});

gulp.task('scripts', function() {
  gulp.src('scripts/**').pipe(gulp.dest('dist/scripts'));
});

gulp.task('watch', function() {
  // Watch template files
  gulp.watch('src/templates/**/*', ['templating', reload]);
  // Watch style files
  gulp.watch('src/styles/**/*.less', ['styles', reload]);
});

gulp.task('serve', ['default', 'watch'], function() {
  browserSync({
    server: {
      baseDir: "./dist"
    }
  });
});


gulp.task('site', function () {
  return gulp.src('./dist/**/*').pipe(deploy());
});

gulp.task('clean', function(cb) {
  del(['dist'], cb)
});

gulp.task('default', ['clean'], function() {
  gulp.start('assets');
  gulp.start('scripts');
  gulp.start('templating');
});
