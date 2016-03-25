/**
* My RESTFul Event Handler
*/
component extends="BaseHandler"{
	
	// DI
	property name="contactService" inject="ContactService";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}

	/**
	* List All Content
	*/
	any function view( event, rc, prc ){
		prc.response.setData( contactService.getAll() );
	}
	
	/**
	* Save A Contact
	*/
	any function save( event, rc, prc ){
		var requestBody = event.getHTTPContent( json=true );
		var sContacts = contactService.save( requestBody.id, requestBody );
		prc.response.setData( sContacts );
	}

	/**
	* Delete An Existing Contact
	*/
	any function remove( event, rc, prc ){
		var sContacts = contactService.remove( rc.contactID );
		prc.response.setData( sContacts );
	}
	
}