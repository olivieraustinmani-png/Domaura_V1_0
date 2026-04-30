# Deploiement Vercel - App Web MVP

Le projet Next.js n'est pas a la racine du repo. Il est dans:

```text
04_applications/web_nextjs
```

Si Vercel deploye la racine `Domaura_V1_0`, le site peut afficher une erreur 404 car il ne trouve pas l'application Next.js au bon endroit.

## Configuration Vercel recommandee

Dans Vercel:

1. Ouvrir le projet
2. Aller dans `Settings`
3. Aller dans `General`
4. Trouver `Root Directory`
5. Mettre:

```text
04_applications/web_nextjs
```

6. Framework Preset:

```text
Next.js
```

7. Build Command:

```text
npm run build
```

8. Install Command:

```text
npm install
```

9. Output Directory:

```text
laisser vide
```

10. Redeployer avec `Redeploy` puis `Use existing Build Cache` desactive si le probleme persiste.

## Verification locale

Depuis le dossier web:

```bash
cd 04_applications/web_nextjs
npm install
npm run build
npm run dev
```

La page d'accueil doit repondre sur:

```text
http://localhost:3000
```

## Cause la plus probable du 404

Le repo est un monorepo. Vercel doit deployer uniquement le sous-projet Next.js, pas la racine qui contient surtout documentation, architecture et dossiers futurs.
