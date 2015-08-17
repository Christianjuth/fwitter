module.exports = (grunt)->

  # Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')
    sass:
      default:
        files: [{
          expand: true,
          cwd: "public/sass",
          src: ["**/*.scss"],
          dest: "public/css",
          ext: ".css"
        }]
  });

  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-sass')

  # Default task(s).
  grunt.registerTask('default', ['sass:default'])