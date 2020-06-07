validateUser = (string) => {
if(string.length < 2){
        window.alert("username needs at least 2 characters");
        string.focus();
        return false;
        }
    };
    
validateInput = (string, obj) => {
if(string === ''){
        window.alert("cannot leave as blank" + obj);
        string.focus();
        return false;
        }
    };

validateLogin = () => {
        var input = document.forms["login"]["username"].value;
        var password = document.forms["login"]["password"].value;
    
        validateUser(input);
    
        if(password.length < 8) {
            window.alert("password needs at least 8 characters");
            password.focus();
            return false;
        }
};