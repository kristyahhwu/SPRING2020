var express = require('express');
var router = express.Router();

/* GET home page. */
//localhost:3000
router.get('/', function(req, res, next) {
  res.sendFile('index.html',{root:'public/html'});
});

/*GET login page
dont use absolute path which is right click copy path*/
router.get('/login',function(req, res, next){
  res.sendFile('login.html',{root:'public/html'})
});


router.get('/registration',function(req, res, next){
  res.send('register.html',{root:'public/html'})
});


router.get('/postimage',function(req, res, next){
  res.send('postimage.html',{root:'public/html'})
});

module.exports = router;
