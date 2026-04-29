# 🏛️ Gouvernance & Décisions — DOMAURA

Dossier de gestion des décisions architecturales, roadmap, backlog et registre des risques.

## 📁 Structure

```
00_gouvernance_projet/
├── vision_startup.md          # Vision long-terme et stratégie
├── roadmap_produit.md         # Roadmap détaillée (phases MVP → Platform)
├── backlog_mvp.md             # Backlog MVP avec user stories priorisées
├── risques_registre.md        # Registre des risques et mitigation
└── decisions_architecture_ADR/
    ├── ADR_001_monorepo.md
    ├── ADR_002_microservices_strategy.md
    └── ADR_003_authentication.md
```

## 📝 Fichiers

### `vision_startup.md`
Vision, mission, et stratégie long-terme de DOMAURA.
- Vision africaine
- Positionnement marché
- Objectifs financiers
- Valeurs d'équipe

### `roadmap_produit.md`
Roadmap complète avec phases, livrables, et KPIs.
- Phase 1: MVP (Q1-Q2 2026)
- Phase 2: Expansion (Q3-Q4 2026)
- Phase 3: Fintech (2027)
- Phase 4: Continental (2027-2028)

### `backlog_mvp.md`
Backlog détaillé avec user stories, estimations, et priorités.
- MUST HAVE features
- SHOULD HAVE features
- NICE TO HAVE features
- Story points

### `risques_registre.md`
Registre des risques, impact, probabilité, et plans de mitigation.
- Risques techniques
- Risques commerciaux
- Risques réglementaires
- Risques opérationnels

### `decisions_architecture_ADR/`
Architecture Decision Records (ADRs) - decisiones clés documentées.

**Format ADR:**
```markdown
# ADR-001: Decision Title

## Status
Accepted/Rejected/Pending

## Context
Why this decision?

## Decision
What we decided

## Consequences
Positive/Negative impacts

## Alternatives Considered
Other options we evaluated
```

## 🔄 Workflow

1. **Product Planning** → `roadmap_produit.md` + `backlog_mvp.md`
2. **Architecture Decisions** → New ADR in `decisions_architecture_ADR/`
3. **Risk Management** → Update `risques_registre.md`
4. **Team Alignment** → Discuss in Weekly Architecture Review

## 👥 Responsables

- **Product Manager**: Maintains roadmap, backlog
- **Tech Lead**: Documents architecture decisions (ADRs)
- **Team Lead**: Maintains risk register

---

*See ROADMAP.md for detailed product roadmap*
