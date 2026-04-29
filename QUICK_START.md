# ⚡ COMMANDES DE DÉMARRAGE RAPIDE

Copiez-collez ces commandes directement dans votre terminal.

---

## 🔧 VÉRIFIER QUE LA STRUCTURE EST COMPLÈTE

```powershell
cd c:\Users\Austin\Desktop\Domaura_V1_0
Get-ChildItem -Directory | Where-Object {$_.Name -match "^[0-9]{2}_"} | ForEach-Object {$_.Name}
```

Devrait afficher 16 répertoires: `00_gouvernance_projet` jusqu'à `15_recherche_rnd`

---

## 📱 ÉTAPE 1 : SETUP FLUTTER (À exécuter une fois)

```bash
cd c:\Users\Austin\Desktop\Domaura_V1_0\04_applications
flutter create mobile_flutter --project-name domaura --org com.domaura
cd mobile_flutter
flutter pub get
flutter doctor
# Vérifier que tous les éléments sont ✓ verts
```

---

## 🌐 ÉTAPE 2 : SETUP NEXTJS (À exécuter une fois)

```bash
cd c:\Users\Austin\Desktop\Domaura_V1_0\04_applications
npx create-next-app@latest web_nextjs \
  --typescript \
  --tailwind \
  --app \
  --eslint \
  --git false
cd web_nextjs
npm install
```

---

## 🔌 ÉTAPE 3 : SETUP NESTJS (À exécuter une fois)

```bash
cd c:\Users\Austin\Desktop\Domaura_V1_0\05_microservices_backend\api_gateway
npx @nestjs/cli@latest new . --skip-git --package-manager npm
npm install
```

---

## 🗄️ ÉTAPE 4 : DOCKER + BASE DE DONNÉES (À exécuter une fois)

```bash
# Depuis la racine du projet
cd c:\Users\Austin\Desktop\Domaura_V1_0

# Copier le fichier d'environnement
cp .env.example .env

# Démarrer Docker
docker-compose up -d

# Attendre que PostgreSQL soit sain (10 secondes)
# Puis exécuter les migrations
cd 05_microservices_backend\api_gateway
npm run typeorm migration:run
```

---

## 🚀 ÉTAPE 5 : INITIALISATION GIT (À exécuter une fois)

```bash
# Depuis la racine du projet
cd c:\Users\Austin\Desktop\Domaura_V1_0

# Initialiser Git
git init

# Créer le commit initial
git add .
git commit -m "feat: initial domaura v2 monorepo architecture"

# Créer branche develop
git branch develop
git checkout develop

# Ajouter la remote (remplacer YOUR_ORG)
git remote add origin https://github.com/YOUR_ORG/domaura.git

# Pousser toutes les branches
git push -u origin main develop
```

---

## 🎯 COMMANDES DÉVELOPPEMENT QUOTIDIEN

### Démarrer tout
```bash
make dev:all
# ou manuellement:
cd 04_applications/mobile_flutter && flutter run &
cd ../web_nextjs && npm run dev &
cd ../../05_microservices_backend/api_gateway && npm run start:dev
```

### Créer une nouvelle fonctionnalité
```bash
git checkout develop
git pull origin develop
git checkout -b feature/my-feature-name
# ... faire les changements ...
git add .
git commit -m "feat(scope): description"
git push origin feature/my-feature-name
# Puis créer PR sur GitHub
```

### Lancer les tests
```bash
make test:all
```

### Formater le code
```bash
make lint:fix
```

### Arrêter tout
```bash
docker-compose down
# Arrêter tout processus en cours avec Ctrl+C
```

---

## ✅ CHECKLIST DE VÉRIFICATION

Après chaque étape, vérifiez:

```bash
# Après Étape 1: Flutter
flutter doctor

# Après Étape 2: Next.js
npm run build

# Après Étape 3: NestJS
npm run build

# Après Étape 4: Docker
docker ps
# Devrait afficher 8 services en cours d'exécution

# Après Étape 5: Git
git log --oneline
git branch -a
```

---

## 🚨 DÉPANNAGE

### Flutter ne se lance pas
```bash
flutter clean
flutter pub get
flutter run
```

### Problème dépendances Node
```bash
rm -rf node_modules package-lock.json
npm install
```

### Docker ne démarre pas
```bash
docker --version  # Besoin de 20+
docker-compose --version
docker-compose up -d
```

### Erreur connexion PostgreSQL
```bash
# Vérifier que le mot de passe dans .env correspond à docker-compose.yml
docker logs domaura_postgres
```

---

*Guide de démarrage rapide pour DOMAURA v2*
