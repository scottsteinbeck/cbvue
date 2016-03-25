/**
* My RESTFul Event Handler
*/
component extends="BaseHandler"{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}

	this.contacts = {
		"1" : {"id":1, "firstName": "Scott", "lastName": "Steinbeck", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"2" : {"id":2, "firstName": "Scott", "lastName": "Coldwell", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"3" : {"id":3, "firstName": "Jon", "lastName": "Clausen", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"4" : {"id":4, "firstName": "Eric", "lastName": "Peterson", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"5" : {"id":5, "firstName": "Andrew", "lastName": "Dixon", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"6" : {"id":6, "firstName": "Gavin", "lastName": "Pickin", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"7" : {"id":7, "firstName": "Brad", "lastName": "Wood", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"8" : {"id":8, "firstName": "Luis", "lastName": "Majano", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"},
		"9" : {"id":9, "firstName": "Jorge", "lastName": "Reyes", "phone":"661-555-5555","email":"scottsteinbeck@gmail.com"}
	};

	if(!structKeyExists(session,"contacts")){
		session.lastID  = 10;
		session.contacts  = this.contacts;

	} 
	
	/**
	* List All Content
	*/
	any function view( event, rc, prc ){
		prc.response.setData(session.contacts);
	}
	
	/**
	* Save A Contact
	*/
	any function save( event, rc, prc ){
		requestBody = deserializeJSON(toString( getHttpRequestData().content ));
		if(requestBody.id == 0){
			requestBody.id = session.lastID;
			structInsert(session.contacts,session.lastID,requestBody);
			session.lastID++;
		} else {
			session.contacts[requestBody.id] = requestBody;
		}
		prc.response.setData(session.contacts);
	}

	/**
	* Delete An Existing Contact
	*/
	any function remove( event, rc, prc ){
		structDelete(session.contacts,rc.contactID);
		prc.response.setData(session.contacts);
	}
	
}