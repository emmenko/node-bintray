module.exports = (grunt) ->

   grunt.loadNpmTasks 'grunt-contrib-coffee'
   grunt.loadNpmTasks 'grunt-contrib-watch'
   grunt.loadNpmTasks 'grunt-mocha-cli'

   grunt.initConfig
      pkg: grunt.file.readJSON 'package.json'

      mochacli:
        options:
          timeout: 50000
          compilers: ['coffee:coffee-script']
        all: 'test/**/*.coffee'

      coffee:
        src:
          expand: true
          cwd: 'src'
          src: ['**/*.coffee']
          dest: 'lib'
          ext: '.js'

      watch:
        src:
          files: 'src/**/*.coffee'
          tasks: [ 'coffee:src', 'mochacli' ]

   grunt.registerTask 'default', ['coffee', 'mochacli']
   grunt.registerTask 'test', ['mochacli']
   grunt.registerTask 'compile', ['coffee']