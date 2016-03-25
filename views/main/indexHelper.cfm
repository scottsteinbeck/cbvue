<script>
$( document ).ready(function() {
  new Vue({
    // Where the app will be instantiated on the page
    el: '#app',

    // Variables that you want it to have access to or start out with
    data: {
      contactItem: {
      	id:0,
      	firstName:'',
      	lastName:'',
      	phone:'',
      	email:''
      },
      contacts: []
    },
    
    // When this module is ready run this
    ready: function() {
      this.loadContacts();
    },

    // All the methods you want the view to have access to, basically an object of functions
    methods: {

        loadContacts: function() {
          var _this = this;
          // Get the list of contacts
          this.$http.get('/Contacts', function(result) {
            // Update the list with the new data
            _this.$set('contacts', result.data);
          });
        },

        loadContact: function(contact) {
          // Set the form with the contact row information
            this.contactItem = Vue.util.extend({}, contact);;
        },

        saveContact: function() {
          var _this = this;
          // Save the new contact information
          this.$http.post('Contacts',_this.contactItem, function(result) {
            // Reset the form to detault
            _this.contactItem = {id:0,  firstName:'', lastName:'',  phone:'', email:''};
            // Update the list with the new data
            return _this.$set('contacts', result.data);
          });
        },

        cancelSave: function(){
        // Reset the form to detault
          return this.contactItem = {id:0,  firstName:'', lastName:'',  phone:'', email:''};
        },
     
        deleteContact: function(contact) {
          var _this = this;
          //Delete the contact
          this.$http.delete('/Contacts/' + contact.id, function(result) {
            // Update the list with the new data
            _this.$set('contacts', result.data);
          });
        }
      }
  });
} );
</script>