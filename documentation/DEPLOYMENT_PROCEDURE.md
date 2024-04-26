# Procédure de déploiement

## Prérequis
- Accès au dépôt de code source de l'application.
- Autorisations pour créer des pull requests.
- Familiarité avec les commits conventionnels Git.
- Compréhension de la Numérotation Sémantique.

## Procédure

Jetez un œil au format de commit conventionnel [ici](https://www.conventionalcommits.org/en/v1.0.0/).

### 1. Créer une nouvelle branche
Créez une nouvelle branche à partir de la branche principale `main` en suivant la structure de branche spécifiée pour traiter les modifications de documentation.

```bash
git checkout -b <feat|docs|fix>/<label>
```

### 2. Effectuer des modifications
Implémentez les modifications nécessaires à la documentation en anglais. Assurez-vous de respecter les commits conventionnels Git pour des messages de commit clairs et structurés.

### 3. Mettre en scène les modifications
Mettez en scène vos modifications, en suivant le format de commit conventionnel.

```bash
git add .
```

### 4. Committer les modifications
Commitez vos modifications en utilisant des messages de commit conventionnels.

```bash
git commit -m "fix(docs): mettre à jour la documentation avec la configuration traefik"
```

### 5. Pousser la branche
Poussez la branche contenant les modifications vers le dépôt distant.

```bash
git push origin <feat|docs|fix>/<label>
```

### 6. Créer une pull request
Créez une pull request pour fusionner vos modifications dans la branche principale. Fournissez une description concise des mises à jour de la documentation et référencez les problèmes ou les pull requests connexes.

### 7. Examiner la pull request
Les examinateurs pairs examinent la pull request, en s'assurant de respecter les commits conventionnels Git et en vérifiant que les modifications sont conformes aux normes du projet.

### 8. Fusionner la pull request
Une fois approuvée, fusionnez la pull request dans la branche principale, en conservant la structure du message de commit.

### 9. Déterminer l'incrément de version
Suivant la Numérotation Sémantique et la nature des modifications, déterminez l'incrément de version approprié (majeur, mineur ou de correctif).

### 10. Mettre à jour le numéro de version
Mettez à jour le numéro de version de l'application conformément à l'incrément déterminé, en respectant la Numérotation Sémantique.