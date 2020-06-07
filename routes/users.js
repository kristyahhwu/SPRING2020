var express = require("express");
var router = express.Router();
const bcrypt =require('bcrypt');
const errorPrint = require('../helpers/debug/debughelpers').errorPrint;
const successPrint = require('../helpers/debug/debughelpers').successPrint;
const UserError = require('../helpers/errors/UserError');
const db = require('../conf/database');

/// GET users listing. 
//localhost:3000/users
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//localhost:3000/users/register
router.post('/register', function(req, res, next) {
  res.send('respond with a resource');
});



router.post('/register', (req, resp, next)=>{
  let username = req.body.username;
  let email = req.body.email;
  let password = req.body.password;

  //validate form data
  //check username, email, password
  //html slides

  db.execute('SELECT * FROM users WHERE username = ?', [username])
  .then(([results,fields])=> {
    if(results && results.length == 0){
      return db.execute('SELECT * FROM users WHERE email = ?', [email]);
    }else{
      errorPrint('user already exists');
      throw new UserError('username already exist', '/register', 200);
    }
  })
  .then(([results, fields])=> {
    if(results && results.length == 0){
      return db.execute('INSERT INTO users (username, email, password, created) VALUES (?, ?, ?, now());', [username,email, password]
      );
    }else{
      errorPrint('email already exists');
      throw new UserError('email already exist', '/register', 200);
    }
  })
  .then(([results,fields])=> {
    if(results && results.affectedRows){
      successPrint('user created');
      res.redirect('login');
    }
  })
.catch((err)=> {
  if(err instanceof UserError){
    errorPrint(err.getMessage());
    resp.status(err.getStatus());
    resp.redirect(err.getRedirectURL());
  }
  next(err);
})
});

router.post('/login', (req,resp, next)=>{
  let username = req.body.username;
  let password = req.body.password;

  db.execute('SELECT * FROM users WHERE username = ? AND password=?',[username,password])
  .then(([results,fields])=> {
    if(results && results.length==1){
    successPrint('successful login');
    res.redirect('/');
  }else{
    throw new UserError('info incorrect','/login',200);
  }
  }) 
});

module.exports = router;
