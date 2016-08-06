module.exports = function(grunt) {
    'use strict';

    // 加载插件
    grunt.loadNpmTasks('grunt-contrib-copy'); // 复制文件(夹)

    // 项目配置
    grunt.initConfig({
        // 复制文件(夹)
        copy: {
            public: {
                files: [{
                    'Resource/js/jquery.js': 'bower_components/jquery/dist/jquery.min.js',

                    'Resource/js/bootstrap.js': 'bower_components/bootstrap/dist/js/bootstrap.min.js',
                    'Resource/css/bootstrap.css': 'bower_components/bootstrap/dist/css/bootstrap.min.css',
                    'Resource/css/bt-theme.css': 'bower_components/bootstrap/dist/css/bootstrap-theme.min.css',

                    'Resource/js/validate.js': 'bower_components/jquery-validation/dist/jquery.validate.min.js',

                    'Resource/js/datetimepicker.js': 'bower_components/smalot-bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js',
                    'Resource/css/datetimepicker.css': 'bower_components/smalot-bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css',

                    'Resource/js/mustache.js': 'bower_components/mustache.js/mustache.min.js'
                }, {
                	expand: true,
                	cwd: 'bower_components/bootstrap/dist/fonts/',
                	src: ['*'],
                	dest: 'Resource/fonts/'
                }]
            }
        }
    });

    // 默认任务
    grunt.registerTask('default', ['copy']);
};
