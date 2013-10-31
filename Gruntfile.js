module.exports = function(grunt) {

grunt.initConfig({
  less: {
    production: {
      options: {
        paths: ["bower_components/bootstrap/less"],
        yuicompress: true
      },
      files: {
        "assets/css/application.min.css": "assets/_less/application.less"
      }
    }
  },
  uglify: {
    jquery: {
      files: {
        'assets/js/jquery.min.js': 'bower_components/jquery/jquery.js'
      }
    },
    bootstrap: {
      files: {
        'assets/js/bootstrap.min.js': ['bower_components/bootstrap/js/bootstrap-collapse.js',
                                       'bower_components/bootstrap/js/bootstrap-scrollspy.js',
                                       'bower_components/bootstrap/js/bootstrap-button.js',
                                       'bower_components/bootstrap/js/bootstrap-affix.js']
      }
    }
  },
  copy: {
    bootstrap: {
      files: [
        {expand: true, cwd: 'bower_components/bootstrap/img/', src: ['**'], dest: 'assets/img/'}
      ]
    }
  },
  exec: {
    build: {
      cmd: 'jekyll build'
    },
    serve: {
      cmd: 'jekyll serve --watch'
    },
    deploy: {
        cmd: 'echo "not implemented yet"'
      // cmd: 'rsync --progress -a --delete -e "ssh -q" _site/ myuser@host:mydir/'
    }
  }
});

grunt.loadNpmTasks('grunt-contrib-uglify');
grunt.loadNpmTasks('grunt-contrib-less');
grunt.loadNpmTasks('grunt-contrib-copy');
grunt.loadNpmTasks('grunt-exec');

grunt.registerTask('default', [ 'less', 'uglify', 'copy', 'exec:build' ]);
grunt.registerTask('deploy', [ 'default', 'exec:deploy' ]);

};