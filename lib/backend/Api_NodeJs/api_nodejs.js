const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Route inscription
app.post('/register', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: 'Champs manquants' });
  }

  // 👉 Ici normalement tu stockes dans une vraie DB
  // Pour le test on renvoie succès directement
  res.status(200).json({ message: 'Inscription réussie', email });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🚀 Serveur API lancé sur http://localhost:${PORT}`);
});
