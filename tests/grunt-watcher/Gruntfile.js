module.exports = function( grunt ){

	// Default
	grunt.registerTask( "default", [ "watch" ] );

	// Config
	grunt.initConfig( {
		// read configs
		pkg : grunt.file.readJSON( "package.json" ),

		// Watch
		watch : {
			tests : {
				files : [ 
					'../tests/specs/**/*.cfc', 
					'../../models/**/*.cfc',
					'../../handlers/**/*.cfc' 
				],
				options : {
					livereload : true
				}
			}
		}

	} );

	// Load Tasks
	require( 'matchdep' )
		.filterDev( 'grunt-*' )
		.forEach( grunt.loadNpmTasks );
};