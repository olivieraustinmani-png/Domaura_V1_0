# 📚 Documentation — DOMAURA

Toute la documentation produit, spécifications, et user stories centralisée.

## 📁 Structure

```
01_documentation/
├── cahier_des_charges/
│   ├── domaura_cahier_des_charges.md
│   └── specifications_techniques.md
├── prd_specifications_produit/
│   ├── PRD_domaura_home.md
│   ├── PRD_domaura_market.md
│   └── PRD_domaura_services.md
├── user_stories/
│   ├── user_stories_home.md
│   ├── user_stories_market.md
│   └── user_stories_services.md
├── parcours_utilisateurs_user_flows/
│   ├── user_flows_auth.md
│   ├── user_flows_home.md
│   └── user_flows_marketplace.md
└── wiki_interne/
    ├── faq_dev.md
    ├── glossaire.md
    └── conventions_nommage.md
```

## 📝 Contenu

### `cahier_des_charges/`
- **domaura_cahier_des_charges.md** — Cahier des charges complet du projet
- **specifications_techniques.md** — Specs techniques détaillées (stack, architecture)

### `prd_specifications_produit/`
Product Requirements Documents (PRDs) pour chaque module:
- DOMAURA Home (immobilier)
- DOMAURA Market (marketplace)
- DOMAURA Services (services)

**Contenu PRD:**
- Overview
- User personas
- Key features
- Success metrics
- Dependencies
- Timeline

### `user_stories/`
User stories détaillées avec acceptance criteria:
- User Stories Home (listings, favoris, reservations)
- User Stories Market (products, checkout, payments)
- User Stories Services (prestataires, bookings)

**Format User Story:**
```markdown
### Story: [ID] - Title

As a [user type]
I want to [action]
So that [benefit]

#### Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

#### Estimate
Story Points: 5
Priority: HIGH
```

### `parcours_utilisateurs_user_flows/`
User journey diagrams et flows:
- Authentication flow
- Property listing flow
- Marketplace checkout flow
- Service booking flow

### `wiki_interne/`
- **faq_dev.md** — FAQ pour développeurs
- **glossaire.md** — Glossaire DOMAURA (termes métier)
- **conventions_nommage.md** — Conventions nommage (properties, products, etc.)

## 🔄 Workflow

1. **Product Vision** → Cahier des charges
2. **Module Planning** → PRD par module
3. **Implementation** → User stories
4. **Design** → User flows
5. **Reference** → Wiki interne

## 👥 Responsables

- **Product Manager**: POwns PRDs, User Stories
- **UX Designer**: Creates user flows, designs
- **Tech Lead**: Reviews technical specs
- **Dev Team**: References documentation

---

*All documentation is version-controlled and reviewed before commits*
