-- Création des tables
CREATE TABLE departements (
    departement_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    localisation VARCHAR(255)
);

CREATE TABLE employes (
    employe_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_embauche DATE NOT NULL,
    departement_id INTEGER,
    FOREIGN KEY (departement_id) REFERENCES departements(departement_id)
);

CREATE TABLE projets (
    projet_id SERIAL PRIMARY KEY,
    nom_projet VARCHAR(255) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE
);

CREATE TABLE affectations (
    employe_id INTEGER NOT NULL,
    projet_id INTEGER NOT NULL,
    heures_assignees INTEGER DEFAULT 0,
    PRIMARY KEY (employe_id, projet_id),
    FOREIGN KEY (employe_id) REFERENCES employes(employe_id),
    FOREIGN KEY (projet_id) REFERENCES projets(projet_id)
);

-- Insertion des données
INSERT INTO departements (nom, localisation) VALUES
('Informatique', 'Bâtiment A'),
('Ressources Humaines', 'Bâtiment B');

INSERT INTO employes (nom, prenom, email, date_embauche, departement_id) VALUES
('Dupont', 'Alice', 'alice.dupont@exemple.com', '2020-03-15', 1),
('Martin', 'Bob', 'bob.martin@exemple.com', '2021-06-01', 1);

INSERT INTO projets (nom_projet, date_debut, date_fin) VALUES
('Projet Alpha', '2022-01-01', '2022-12-31'),
('Projet Beta', '2022-03-01', NULL);

INSERT INTO affectations (employe_id, projet_id, heures_assignees) VALUES
(1, 1, 20),
(1, 2, 10),
(2, 1, 15);
