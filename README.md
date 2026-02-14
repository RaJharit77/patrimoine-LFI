# Lancement de Patrimoine

## Méthode 1 — Exécution directe

### Étape 1 : Réinitialiser le dossier local (première utilisation)
À utiliser lors du premier lancement pour configurer ton environnement.
Si ton fichier `.jar` fonctionne déjà correctement, tu n’as **pas besoin de le supprimer**.  
Le script te demandera lors de l’exécution si tu veux le remplacer (o/N).

```bash
bash <(curl -s https://raw.githubusercontent.com/Sheddy00/patrimoine-LFI/main/init.sh) UserName M
```

- `UserName` : ton nom 
- `M / F` : ton sexe

---

### Étape 2 : Lancer Patrimoine
À utiliser après l'initialisation et pour tous les prochains démarrages.
Le fichier .jar sera téléchargé automatiquement s'il n'existe pas, sinon on lance Patrimoine directement.

```bash
bash <(curl -s https://raw.githubusercontent.com/Sheddy00/patrimoine-LFI/main/main.sh)
```

---

## Méthode 2 — Exécution locale

### Étape 1 : Cloner le dépôt

```bash
git clone https://github.com/Sheddy00/patrimoine-LFI.git
cd patrimoine-LFI
```

---

### Étape 2 : Réinitialiser l’environnement (première utilisation)

```bash
bash init.sh UserName M
```

- `UserName` : ton nom 
- `M / F` : ton sexe

---

### Étape 3 : Lancer Patrimoine

```bash
bash main.sh
```

---

## Informations importantes

- Premier lancement : exécute init.sh avec tes informations (nom et sexe) puis exécute main.sh
- Lancements suivants : exécute uniquement main.sh

## Pour réinitialiser ou changer les informations utilisateur 
  1. Relance init.sh UserName M avec tes nouvelles informations
  2. Le script te demandera si tu veux supprimer le .jar (choisis Non si fonctionnel)
  3. Relance ensuite main.sh normalement
