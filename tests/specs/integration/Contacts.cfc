/**
* My BDD Test
*/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/root"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		super.beforeAll();
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		super.afterAll();
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		// all your suites go here.
		describe( "Contact Manager", function(){

			it( "can return all contacts", function(){
				var e = execute( event="contacts.view", renderResults = true );
				expect( e.getRenderedContent() ).toBeJSON();
			});

			it( "can save a new contact", function(){
				var body = serializeJSON( {
					id = 12,
					firstName = "integration",
					lastName = "test",
					phone = "",
					email = ""
				} );
				prepareMock( getRequestContext() ).$( "getHTTPContent", body );

				var e = execute( event="contacts.save", renderResults = true );
				expect( e.getRenderedContent() ).toBeJSON()
					.toInclude( "integration" );
			});

			it( "can remove a contact", function(){
				getRequestContext().setValue( "contactID", 1 );
				var e = execute( event="contacts.remove", renderResults = true );
				var contacts = e.getPrivateValue( "response" ).getData();
				expect(	contacts ).notToHaveKey( "1" );
			});
			
		});
	}
	
}