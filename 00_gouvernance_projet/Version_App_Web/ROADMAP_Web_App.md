🚀 DOMAURA — ROADMAP APP WEB (Next.js ONLY)
🎯 OBJECTIF GLOBAL WEB

Créer une version web fonctionnelle de DOMAURA permettant :

inscription / connexion utilisateurs
publication de biens / produits / services
consultation et recherche
interaction (chat simple)
simulation de transaction sécurisée (MVP escrow mock)
base pour démonstration incubateur

👉 Le web = produit principal MVP

🧭 PHASE 0 — SETUP (JOUR 1–2)
⚙️ Objectif : projet propre et scalable
Initialiser Next.js (App Router)
Setup TailwindCSS
Structure monorepo frontend propre
Connexion API backend (placeholder si besoin)
Livrables :
architecture Next.js clean
layout global DOMAURA
design system minimal
🧱 PHASE 1 — AUTH & FOUNDATION (Semaine 1)
🔐 Objectif : base utilisateur fonctionnelle
Features :
inscription utilisateur
connexion / logout
gestion session (JWT / Firebase ou API NestJS)
profil utilisateur basique
Pages :
/login
/register
/profile
🏠 PHASE 2 — HOME & LISTINGS (Semaine 2)
🏡 Objectif : cœur du produit visible
Features :
page Home DOMAURA
affichage listings (biens / produits / services)
filtres basiques
recherche simple
Modules :
Domaura Home
Domaura Market
Domaura Services (version fusionnée MVP)
Pages :
/
/explore
/listing/[id]
📦 PHASE 3 — CREATION & PUBLICATION (Semaine 3)
➕ Objectif : utilisateur actif
Features :
créer une annonce (bien / produit / service)
upload images
formulaire structuré
géolocalisation simple (optionnel MVP)
Pages :
/create
/create/listing
💬 PHASE 4 — INTERACTION (Semaine 4)
💬 Objectif : engagement utilisateur
Features :
chat simple entre utilisateurs
négociation prix (texte)
notifications basiques
Pages :
/chat
/conversation/[id]
💰 PHASE 5 — TRANSACTIONS SIMPLIFIÉES (Semaine 5)
💳 Objectif : démonstration business model
Features :
simulation paiement
escrow MOCK (pas réel encore)
confirmation transaction
historique
Pages :
/checkout
/transactions
🧠 PHASE 6 — TRUST LAYER LIGHT (Semaine 6)
🔐 Objectif : différenciation DOMAURA
Features :
profil utilisateur avec score simple
badge “verified” simulé
système de review basique
📊 PHASE 7 — DASHBOARD & ADMIN (Semaine 7)
📈 Objectif : contrôle plateforme
Features :
dashboard utilisateur
gestion annonces
stats simples
modération basique (admin)
🚀 PHASE 8 — MVP FINAL & DEMO (Semaine 8)
🎯 Objectif : incubateur / investisseur
Features :
polish UI minimal
correction bugs
optimisation UX
flow complet testable
Résultat :

👉 DEMO END-TO-END :

User → signup → create listing → browse → chat → simulate purchase
🧭 ARCHITECTURE WEB DOMAURA
Next.js App
│
├── app/
│   ├── auth/
│   ├── home/
│   ├── listings/
│   ├── create/
│   ├── chat/
│   ├── profile/
│   ├── checkout/
│   └── admin/
│
├── components/
├── services/
├── hooks/
├── lib/
└── styles/
🎯 STRATÉGIE PRODUIT (IMPORTANT)
❌ NE PAS FAIRE :
microservices web
IA
VR
escrow réel complexe
sur-design UI
✅ FAIRE :
flux simple
produit utilisable
demo investisseur
validation marché
🧠 OBJECTIF FINAL WEB MVP

👉 “Airbnb + Jumia + Services basique fonctionnel”

mais :

simple
rapide
démontrable
🧭 PRIORITÉ ABSOLUE
Auth
Listings
Interaction
Transaction mock
Demo
