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
      deleteContact: function(contact) {
        var _this = this;
        this.$http.delete('/Contacts/' + contact.id, function(result) {
          _this.$set('contacts', result.data);
        });
      },

      loadContacts: function() {
        var _this = this;
        this.$http.get('/Contacts', function(result) {
          _this.$set('contacts', result.data);
        });
      },

      saveContact: function() {
        var _this = this;
        this.$http.post('Contacts',_this.contactItem, function(result) {
        	_this.contactItem = {id:0,	firstName:'',	lastName:'',	phone:'',	email:''};
          return _this.$set('contacts', result.data);
        });
      },

      loadContact: function(contact) {
        var _this = this;
        this.contactItem = contact;
      }
    }
  });
} );
</script>