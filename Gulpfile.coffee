gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
concat     = require 'gulp-concat'
connect    = require 'gulp-connect'
less       = require 'gulp-less'
sass       = require 'gulp-sass'
minifyCSS  = require 'gulp-clean-css'
minifyHTML = require 'gulp-htmlmin'
minIMG     = require 'gulp-imagemin'
uglify     = require 'gulp-uglify'
watch      = require 'gulp-watch'
bowerMain  = require 'main-bower-files'
gulpFilter = require 'gulp-filter'
rename     = require 'gulp-rename'
flatten    = require 'gulp-flatten'
inject     = require 'gulp-inject'
jade       = require 'gulp-jade'

config     = require './_conf/gulp.json'
server     = require './_conf/server.json'

gulp.task 'libraries', ->

  jsFilter    = gulpFilter [ '*.js', '**/*.js' ], { restore : true }
  cssFilter   = gulpFilter [ '*.css', '**/*.css' ], { restore : true }
  lessFilter  = gulpFilter [ '*.less', '**/*.less' ], { restore : true }
  fontFilter  = gulpFilter ['*.eot', '*.woff', '*.woff2', '*.svg', '*.ttf'], { restore : true }
  imageFilter = gulpFilter ['*.gif', '*.png', '*.svg', '*.jpg', '*.jpeg'], { restore : true }

  return gulp
    .src bowerMain()
    # JS
    .pipe jsFilter
    .pipe uglify()
    .pipe rename( { suffix: ".min" } )
    .pipe gulp.dest('bundle/lib/js')
    .pipe jsFilter.restore
    # CSS
    .pipe cssFilter
    .pipe minifyCSS( { compatibility: 'ie8' } )
    .pipe rename( { suffix: ".min" } )
    .pipe gulp.dest('bundle/lib/css')
    .pipe cssFilter.restore
    # LESS
    .pipe lessFilter
    .pipe less().on('error', (err) ->
      console.log err.message
      @emit 'end'
    )
    .pipe minifyCSS( { compatibility: 'ie8' } )
    .pipe rename( { suffix: ".min" } )
    .pipe gulp.dest('bundle/lib/css')
    .pipe lessFilter.restore
    # Fonts
    .pipe fontFilter
    .pipe flatten()
    .pipe gulp.dest('bundle/lib/fonts')
    .pipe fontFilter.restore
    # Images
    .pipe imageFilter
    .pipe flatten()
    .pipe gulp.dest('bundle/lib/images')
    .pipe imageFilter.restore

# Inject
gulp.task 'inject', [ 'libraries' ], ->

  conf = config.index

  target = gulp.src conf.source
  sources = gulp.src [
    'bundle/lib/js/jquery.min.js'
    'bundle/lib/js/angular.min.js'
    'bundle/lib/js/angular-ui-router.min.js'
    'bundle/lib/js/*.js'
    'bundle/lib/css/*.css'
  ], { read: false }

  target
    .pipe inject( sources, { ignorePath: 'bundle', addRootSlash: false } )
    # .pipe minifyHTML( { collapseWhitespace: true } )
    .pipe gulp.dest( conf.dest )

# Compile CoffeeScript
gulp.task 'coffee-script', ->
  conf = config.coffee
  gulp
    .src conf.source
    .pipe coffee().on( 'error', ( err ) ->
      console.log err.message
      @emit 'end'
    )
    .pipe uglify()
    .pipe concat( conf.file )
    .pipe gulp.dest( conf.dest )
  return

# Compile Styles
gulp.task 'styles', ->
  conf = config.styles
  gulp
    .src conf.source
    .pipe sass().on( 'error', sass.logError )
    .pipe minifyCSS( { compatibility: 'ie8' } )
    .pipe concat( conf.file )
    .pipe gulp.dest( conf.dest )
  return

# Minify templates
gulp.task 'templates', ->
  conf = config.templates
  gulp
    .src conf.source
    .pipe jade().on 'error', (err) ->
      console.log err
    # .pipe minifyHTML( { collapseWhitespace : true } )
    .pipe gulp.dest( conf.dest )
  return

# Minify images
gulp.task 'images', ->
  conf = config.images
  gulp
    .src conf.source
    .pipe minIMG()
    .pipe gulp.dest( conf.dest )
  return

gulp.task 'compile', [
  'inject'
  'coffee-script'
  'styles'
  'templates'
  'images'
]

# Server
gulp.task 'serve', ->
  connect.server
    root       : server.root
    port       : server.port
    livereload : true
  return

# Reload
gulp.task 'reload', ->
  gulp
    .src config.dist
    .pipe connect.reload()
  return

gulp.task 'watch', ->
  gulp.watch [ config.coffee.source ], [ 'coffee-script' ]
  gulp.watch [ config.styles.source ], [ 'styles' ]
  gulp.watch [ config.templates.source ], [ 'templates' ]
  gulp.watch [ config.index.source ], [ 'inject' ]
  gulp.watch [ config.images.source ], [ 'images' ]
  gulp.watch [ config.dist ], [ 'reload' ] # livereload

gulp.task 'default', [
  'compile'
  'serve'
  'watch'
]
