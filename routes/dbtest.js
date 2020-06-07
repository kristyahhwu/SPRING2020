const express = require('express');
const router  = express.Router();
const db      = require('../conf/database');

//mport {Router} from express;


//display on frontend
//use cmd
//curl -X GET localhost:3000/dbtest/getAllUsers
router.get('/getAllUsers', (req, res, next) => {
        db.query('SELECT * from users;', (err, results, fields) => 
        {
                if(err){
                      next(err);  
                }
                console.log(results);
                res.send(results);
        })
});

router.get('/getAllPosts', (req, res, next) => {
        db.query('SELECT * from posts;')
        .then( ([results, fields]) => 
        {
                console.log(results);
                res.send(results);
        })
        .catch((err)=> {
                next(err);
        })
});




/* <form action = "dbtest/createUser" method = "POST" enctype = "x-www-form-urlencoded">
        <input id = "password" name ="password" />
        <input id = "username" name ="username" />
        <input id = "email" name ="email" />
        <input id = "button" type ="submit" />
</form> */

router.post('/createUser', (req, res, next) => {
        console.log(req.body);
        let username = req.body.username;
        let email = req.body.email;
        let password = req.body.password;
        //also need to validate data, if bad send back response
        //res.redirect('/registration');

        let baseSQL = 'INSERT INTO users(username, email, password, created) VALUES(?, ?, ?, now())';
        db.query(baseSQL, [username, email, password]).then(([results, fields]) => {
                if(results && results.affectedRows){
                        res.send('user was made');
                }else{
                        res.send('user failed to make');
                }

        });
});

module.exports = router;
