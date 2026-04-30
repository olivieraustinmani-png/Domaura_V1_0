# DOMAURA - Scope App Web MVP

Ce fichier est la source de verite courte pour livrer l'App Web MVP. Les documents V1/V2 restent des references strategiques, mais l'equipe livre d'abord ce perimetre.

## Objectif

Livrer une demo web fonctionnelle de DOMAURA pour validation marche, incubateur et investisseurs.

Parcours de demo prioritaire:

```text
Visiteur -> Explorer -> Detail annonce -> Creer annonce -> Chat mock -> Checkout escrow mock -> Profil confiance
```

## Perimetre MVP

- Application principale: `04_applications/web_nextjs`
- Prototype visuel de reference: `00_gouvernance_projet/Version_App_Web`
- Backend reel: reporte a V1 complete
- Mobile Flutter: reporte a V1 complete
- IA, VR/3D, microservices, monitoring avance: reportes a V2/premium

## Modules inclus

- Home: vitrine produit et acces rapide aux annonces
- Explore: annonces unifiees immobilier, produits et services
- Listing detail: information, vendeur, score de confiance
- Create: formulaire de publication mock
- Chat: conversation mock acheteur/vendeur
- Checkout: simulation escrow sans paiement reel
- Profile: profil utilisateur avec badges de confiance fictifs

## Modele produit MVP

Un seul modele `Listing` couvre les trois familles:

- `property`: immobilier
- `product`: marketplace
- `service`: prestation

Cette approche garde la vision super-app tout en evitant de construire trois plateformes separees trop tot.

## Hors scope jusqu'a V1 complete

- Authentification reelle
- Base de donnees PostgreSQL
- API NestJS
- Paiement reel Orange Money / MTN / Stripe
- Upload Cloudinary reel
- KYC reel
- Admin complet

## Hors scope jusqu'a V2/premium

- Domaura Pro SaaS
- IA avancee
- Tours 3D / VR
- Microservices complets
- Observabilite Prometheus/Grafana
- Infrastructure Kubernetes

## Definition de "termine" pour le MVP

- `npm run dev` lance l'app web
- Le parcours de demo est navigable sans backend
- Les donnees mockees couvrent Home, Market et Services
- L'UI respecte la direction premium bleu marine / or
- Le README web explique comment lancer et presenter la demo
