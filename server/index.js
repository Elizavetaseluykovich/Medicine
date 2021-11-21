const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const mysql = require('mysql');

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'mysql',
    database: 'polyclinicsDB',
});

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get('/api/get', (req, res) => {
    const sqlSelect = 'select * from specialty';
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
})

app.post('/api/insert', (req, res) => {
    const specialty = req.body.specialty;
    const sqlInsert = 'INSERT INTO specialty (specialty) VALUES (?)'
    db.query(sqlInsert, [specialty], (err, result) => {
        console.log(result);
    });
})

app.listen(3001, () => {
    console.log('running on port 3001');
});