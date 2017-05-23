http = require('http');
fs = require('fs');
path = require('path');
server = http.createServer( function(req, res) {

    if(req.url === "/" || req.url === "/compiled.js" || req.url === "/css.css"){
      let filePath = '.' + req.url;
      if (filePath == './')
          filePath = './index.html';

      let extname = path.extname(filePath);
      let contentType = 'text/html';
      switch (extname) {
          case '.js':
              contentType = 'text/javascript';
              break;
          case '.css':
              contentType = 'text/css';
              break;
          case '.json':
              contentType = 'application/json';
              break;
          case '.png':
              contentType = 'image/png';
              break;
          case '.jpg':
              contentType = 'image/jpg';
              break;
          case '.wav':
              contentType = 'audio/wav';
              break;
      }

      fs.readFile(filePath, function(error, content) {
          if (error) {
              if(error.code == 'ENOENT'){
                  fs.readFile('./404.html', function(error, content) {
                      res.writeHead(200, { 'Content-Type': contentType });
                      res.end(content, 'utf-8');
                  });
              }
              else {
                  res.writeHead(500);
                  res.end('Sorry, check with the site admin for error: '+error.code+' ..\n');
                  res.end();
              }
          }
          else {
              res.writeHead(200, { 'Content-Type': contentType });
              res.end(content, 'utf-8');
          }
      });
      return;
    }
    if (req.method == 'POST') {
        console.log("POST");
        var body = '';
        req.on('data', function (data) {
            body += data;
        });
        req.on('end', function () {
            console.log(req.url + " " + body);
            if(req.url === "/characters"){
              players.push(JSON.parse(body));
              res.end(JSON.stringify(players));
            } else if( req.url.indexOf("/characters") !== -1){
              let id = req.url.substring("/characters/".length);
              players[id] = JSON.parse(body);
              res.end("Updated");
            } else {
              res.end(JSON.stringify(players));
            }

        });
        var headers = {};
        headers["Access-Control-Allow-Origin"] = "*";
        headers["Access-Control-Allow-Methods"] = "POST, GET, PUT, DELETE, OPTIONS";
        headers["Access-Control-Allow-Credentials"] = false;
        headers["Access-Control-Max-Age"] = '86400'; // 24 hours
        headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept";
        headers["Content-Type"] = "text/text"
        res.writeHead(200, headers);
    } else if (req.method === 'OPTIONS') {
      var headers = {};
      // IE8 does not allow domains to be specified, just the *
      // headers["Access-Control-Allow-Origin"] = req.headers.origin;
      headers["Access-Control-Allow-Origin"] = "*";
      headers["Access-Control-Allow-Methods"] = "POST, GET, PUT, DELETE, OPTIONS";
      headers["Access-Control-Allow-Credentials"] = false;
      headers["Access-Control-Max-Age"] = '86400'; // 24 hours
      headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept";
      res.writeHead(200, headers);
      res.end();
    } else if( req.method === "GET"){
      var headers = {};
      headers["Access-Control-Allow-Origin"] = "*";
      headers["Access-Control-Allow-Methods"] = "POST, GET, PUT, DELETE, OPTIONS";
      headers["Access-Control-Allow-Credentials"] = false;
      headers["Access-Control-Max-Age"] = '86400'; // 24 hours
      headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept";
      headers["Content-Type"] = "text/plain"
      res.writeHead(200, headers);
      res.end(JSON.stringify(players))
    } else
    {
        res.writeHead(404, {'Content-Type': 'text/html'});
        res.end("<HTML></HTML>");
    }

});

let players = [
  {
    "id":0,
    "name":"Sindri",
    "xp":9001,
    "class":"Paladin",
    "alignment":"Neutral Good",
    "maxHP":72,
    "currentHP":70,
    "ac":18,
    "movement":25,
    "str":17,
    "dex":13,
    "con":13,
    "int":13,
    "wis":12,
    "cha":17
  },
  {
    "id":1,
    "name":"Andar",
    "xp":34236,
    "class":"",
    "alignment":"",
    "maxHP":0,
    "currentHP":0,
    "ac":0,
    "movement":0,
    "str":0,
    "dex":0,
    "con":0,
    "int":0,
    "wis":0,
    "cha":0
  }
];

port = 5000;
host = '127.0.0.1';
server.listen(port, host);
console.log('Listening at http://' + host + ':' + port);
