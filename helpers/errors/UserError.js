class UserError extends Error{
        constructor(message, redirectURL, status){
                super(message);
                this.redirectURL = redirectURL;
                this.stautus = status;
        }

        getMessage(){
                return this.message;
        }

        getRedirectURL(){
                return this.directURL;
        }

        getStatus(){
                return this.status;
        }
}

module.exports = UserError;