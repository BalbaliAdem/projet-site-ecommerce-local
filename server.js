const express = require("express");//perme de cree un serveur web
const cors = require('cors');//autorise la communicarion entre le site et le serveur 
const path = require("path");//aide a construire les chemins des fichiers

const db = require("./db"); //chrge le fichier db.js
const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));

app.get("/",(req,res)=> {
    res.sendFile(path.join(__dirname, "public","index.html"));
});