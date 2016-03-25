/**
* I manage contacts
*/
component accessors="true" singleton{
	
	/**
	* Contacts DB
	*/
    property name="contacts";
    /**
    * The last ID tracker
    */
    property name="lastID";
   
    /**
     * Constructor
     */
	ContactService function init(){

		variables.contacts = {
			"1" : {"id": 1, "firstName": "Scott", 	"lastName": "Steinbeck", 	"phone": "661-555-5555",	"email": "scottsteinbeck@email.com"},
			"2" : {"id": 2, "firstName": "Scott", 	"lastName": "Coldwell", 	"phone": "661-555-5555",	"email": "scottcoldwell@email.com"},
			"3" : {"id": 3, "firstName": "Jon", 	"lastName": "Clausen", 		"phone": "661-555-5555",	"email": "johnclausen@email.com"},
			"4" : {"id": 4, "firstName": "Eric", 	"lastName": "Peterson", 	"phone": "661-555-5555",	"email": "ericpeterson@email.com"},
			"5" : {"id": 5, "firstName": "Andrew", 	"lastName": "Dixon", 		"phone": "661-555-5555",	"email": "andrewdixon@email.com"},
			"6" : {"id": 6, "firstName": "Gavin", 	"lastName": "Pickin", 		"phone": "661-555-5555",	"email": "gavinpickin@email.com"},
			"7" : {"id": 7, "firstName": "Brad", 	"lastName": "Wood", 		"phone": "661-555-5555",	"email": "bradwood@email.com"},
			"8" : {"id": 8, "firstName": "Luis", 	"lastName": "Majano", 		"phone": "661-555-5555",	"email": "luismajano@email.com"},
			"9" : {"id": 9, "firstName": "Jorge", 	"lastName": "Reyes", 		"phone": "661-555-5555",	"email": "jorgereyes@email.com"}
		};

		variables.lastID = 10;
		
		return this;
	}
	
	/**
	* Get all contacts
	*/
	struct function getAll(){
		return variables.contacts;
	}

	/**
	* save and return all contacts
	* @contactID The id to save/update
	* @data The data record
	*/
	struct function save( required contactID, required data ){
		// insert, move lastID
		if( arguments.contactID == 0 ){
			arguments.contactID = variables.lastID;
			arguments.data.id 	= variables.lastID;
			variables.lastID++;
		} 

		// Store data
		variables.contacts[ arguments.contactID ] = arguments.data;
		
		return variables.contacts;
	}

	/**
	* Remove a contact
	* @contactID The incoming ID
	*/
	struct function remove( required contactID ){
		structDelete( variables.contacts, arguments.contactID );
		return variables.contacts;
	}

}