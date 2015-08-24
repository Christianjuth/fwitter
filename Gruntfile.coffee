module.exports = (grunt)->
  # Time Grunt tasks
  require('time-grunt')(grunt);

  # Load all Grunt tasks
  require('load-grunt-tasks')(grunt);

  # Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')
    sass:
      default:
        files:
          "public/css/style.css": "public/sass/style.scss"
    coffee:
      default:
        files: [{
          expand: true,
          cwd: "public/coffee",
          src: ["**/*.coffee"],
          dest: "public/js",
          ext: ".js"
        }]
  });

  # Default task(s).
  grunt.registerTask('default', ['sass', 'coffee'])