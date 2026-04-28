# 🤝 CONTRIBUTING — Guide de Contribution DOMAURA

Bienvenue ! Heureux de vous avoir comme contributeur. Ce guide explique comment contribuer à DOMAURA de façon efficace et professionnelle.

---

## 📋 Table des matières

1. [Code of Conduct](#code-of-conduct)
2. [Avant de Commencer](#avant-de-commencer)
3. [Workflow Git](#workflow-git)
4. [Conventions de Code](#conventions-de-code)
5. [Commits & Messages](#commits--messages)
6. [Pull Requests](#pull-requests)
7. [Code Review](#code-review)
8. [Tests](#tests)
9. [Documentation](#documentation)
10. [Déboguer & Reporter Issues](#déboguer--reporter-issues)

---

## 🤖 Code of Conduct

- **Respect** — Traiter tous les collaborateurs avec respect
- **Inclusivité** — Accueillir des idées diverses
- **Transparence** — Communiquer ouvertement
- **Excellence** — Viser la qualité maximale

Violations → Contact: hello@domaura.com

---

## 🚀 Avant de Commencer

### 1. Setup Local

```bash
# Clone
git clone https://github.com/domaura/domaura.git
cd DOMAURA

# Install dependencies
make install

# Setup environment
cp .env.example .env

# Launch development stack
docker-compose up -d
make db:setup
```

### 2. Branches Principales

- **`main`** — Production-ready code uniquement
- **`develop`** — Integration branch (staging)
- **`feature/*`** — New features
- **`bugfix/*`** — Bug fixes
- **`hotfix/*`** — Urgent production fixes
- **`docs/*`** — Documentation updates

### 3. Créer une Branche

```bash
# Create feature branch
git checkout -b feature/ma-super-feature

# Create bugfix branch
git checkout -b bugfix/correction-bug

# Hotfix (from main)
git checkout main
git pull origin main
git checkout -b hotfix/urgent-fix
```

---

## 🔀 Workflow Git

### Feature Branch Workflow

```
develop
  ↓
feature/nom-feature (créée depuis develop)
  ├─ commit 1
  ├─ commit 2
  ├─ commit 3
  ↓
Pull Request → Code Review → Merge to develop
  ↓
develop (updated)
  ↓
Release → main
```

### Bon Processus

1. **Créer branche** depuis `develop`
2. **Commit régulièrement** (messages clairs)
3. **Push** vers votre fork ou remote
4. **Ouvrir PR** vers `develop`
5. **Code review** (1-2 reviewers)
6. **Merge** après approbation

### Commands Utiles

```bash
# Sync with develop
git fetch origin
git rebase origin/develop

# Update local main
git checkout main
git pull origin main

# Clean merged branches
git branch -d nom-branche

# Force push après rebase (careful!)
git push origin feature/ma-feature --force-with-lease
```

---

## 💻 Conventions de Code

### TypeScript/JavaScript

```typescript
// ✅ GOOD
const calculateUserScore = (user: User): number => {
  const baseScore = user.transactions.length * 10;
  return baseScore + user.trustBonus;
};

// ❌ BAD
const calc = (u: any) => u.trans.length * 10 + u.bonus;
```

**Règles:**
- `camelCase` pour variables/functions
- `PascalCase` pour classes/interfaces/types
- `UPPER_SNAKE_CASE` pour constants
- Exports explicites
- Types toujours
- Docstrings pour fonctions complexes

### Dart/Flutter

```dart
// ✅ GOOD
class UserProfileCard extends StatelessWidget {
  final User user;
  
  const UserProfileCard({required this.user});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}

// ❌ BAD
class userCard extends Widget {
  var u;
  build() { ... }
}
```

**Règles:**
- `PascalCase` pour classes/widgets
- `camelCase` pour variables
- Const constructors
- Null safety
- Documentation comments (`///`)

### SQL

```sql
-- ✅ GOOD
SELECT 
  u.id,
  u.email,
  COUNT(t.id) as transaction_count
FROM users u
LEFT JOIN transactions t ON u.id = t.user_id
WHERE u.created_at > NOW() - INTERVAL '30 days'
GROUP BY u.id, u.email;

-- ❌ BAD
select u.id, count(*) from users u, transactions t 
where u.id = t.user_id;
```

**Règles:**
- Keywords en UPPERCASE
- Indentation cohérente
- Noms tables singular
- Foreign keys: `{table}_id`
- Migrations versionnées

### Fichiers & Dossiers

```
src/
├── modules/
│   ├── auth/
│   │   ├── auth.service.ts
│   │   ├── auth.controller.ts
│   │   ├── auth.module.ts
│   │   ├── dto/
│   │   │   ├── login.dto.ts
│   │   │   └── register.dto.ts
│   │   ├── guards/
│   │   ├── strategies/
│   │   └── tests/
│   └── users/
├── common/
│   ├── decorators/
│   ├── filters/
│   ├── guards/
│   ├── interceptors/
│   ├── middleware/
│   ├── pipes/
│   └── utils/
└── config/
```

---

## 💬 Commits & Messages

### Format Conventional Commits

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat` — Nouvelle fonctionnalité
- `fix` — Correction de bug
- `docs` — Documentation uniquement
- `style` — Formatage, semicolons, etc. (pas de code change)
- `refactor` — Refactorisation sans behavior change
- `perf` — Performance improvement
- `test` — Tests
- `chore` — Build tools, dependencies, etc.
- `ci` — CI/CD configuration

### Exemples

```bash
# ✅ GOOD
git commit -m "feat(auth): add two-factor authentication via SMS"
git commit -m "fix(payments): resolve escrow release timeout issue"
git commit -m "docs(readme): update installation instructions"
git commit -m "refactor(listings): simplify property filter logic"

# ❌ BAD
git commit -m "fixed stuff"
git commit -m "WIP: working on auth"
git commit -m "asdf"
```

### Commit Body

```
fix(payments): resolve duplicate transaction creation

Previously, concurrent requests to the payment endpoint
could create duplicate escrow transactions. 

This fix adds a database-level unique constraint on
transaction hash and implements idempotency keys.

Fixes: #1234
Related: #1235, #1236
```

---

## 📤 Pull Requests

### Avant d'Ouvrir une PR

- ✅ Tests passent (`make test`)
- ✅ Code formaté (`make lint:fix`)
- ✅ Commits sont clairs et minimalistes
- ✅ Branch à jour avec `develop` (`git rebase origin/develop`)
- ✅ Documentation mise à jour

### Template PR

```markdown
## 📝 Description

Courte description de ce qu'on fait.

## 🎯 Objectif

Pourquoi ce changement? Quel problème résout-on?

## 🔄 Type de Changement

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation

## ✅ Checklist

- [ ] Tests ajoutés/mis à jour
- [ ] Documentation mise à jour
- [ ] Pas de breaking changes (ou documented)
- [ ] Code formaté
- [ ] Commits are squashed if needed

## 🧪 Testing

Comment tester cette PR?

```bash
# Steps to verify
docker-compose up -d
make db:seed
npm run dev
# Go to http://localhost:3000 and test XYZ
```

## 📸 Screenshots (if UI)

Attach screenshots if changes affect UI.

## 🔗 Related Issues

Fixes #1234
Related: #1235
```

---

## 👀 Code Review

### Pour les Reviewers

- ✅ Comprendre intent du PR
- ✅ Vérifier logique et architecture
- ✅ Tester localement
- ✅ Check: tests, docs, edge cases
- ✅ Être constructif et bienveillant

### Pour les Auteurs

- ✅ Répondre aux commentaires
- ✅ Expliquer si c'est pas clair
- ✅ Faire les changements demandés
- ✅ Push updates et mark as resolved
- ✅ Re-request review après updates

### Approval Requirements

- Minimum 1 reviewer (2 for critical paths)
- CI/CD pipelines green
- No conflicts with develop

---

## 🧪 Tests

### Coverage Minimale

- **Backend**: 70% minimum
- **Frontend**: 50% minimum
- **Critical paths**: 90%+

### Commands

```bash
# Run all tests
make test:all

# Run specific suite
make test:api
make test:web
make test:flutter

# With coverage
make test:coverage

# Watch mode
make test:watch
```

### Exemple Test

```typescript
// ✅ GOOD
describe('UserService', () => {
  let service: UserService;
  let usersRepository: Repository<User>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UserService, /* mocks */],
    }).compile();

    service = module.get<UserService>(UserService);
    usersRepository = module.get('UsersRepository');
  });

  describe('createUser', () => {
    it('should create a new user with valid data', async () => {
      const createUserDto = {
        email: 'test@example.com',
        name: 'Test User',
      };

      jest
        .spyOn(usersRepository, 'save')
        .mockResolvedValue({ id: '123', ...createUserDto });

      const result = await service.createUser(createUserDto);

      expect(result).toEqual({ id: '123', ...createUserDto });
      expect(usersRepository.save).toHaveBeenCalledWith(createUserDto);
    });

    it('should throw error for invalid email', async () => {
      const invalidDto = { email: 'not-an-email', name: 'Test' };

      await expect(service.createUser(invalidDto))
        .rejects.toThrow(BadRequestException);
    });
  });
});
```

---

## 📚 Documentation

### Code Comments

```typescript
/**
 * Calculates trust score for a user based on their transaction history.
 * 
 * @param userId - The ID of the user
 * @param includeRefunded - Whether to include refunded transactions
 * @returns The calculated trust score (0-100)
 * 
 * @example
 * const score = await calculateTrustScore('user-123', true);
 * // returns 75
 */
async calculateTrustScore(
  userId: string,
  includeRefunded: boolean = false
): Promise<number> {
  // Implementation...
}
```

### README Modules

Chaque module doit avoir son README:

```markdown
# Module Name

Brief description.

## Features

- Feature 1
- Feature 2

## Usage

```typescript
import { ModuleService } from './module.service';
```

## API

### `method()`

Description...
```

### API Documentation

Utilisez Swagger/OpenAPI:

```typescript
@Controller('users')
@ApiTags('Users')
export class UsersController {
  @Get(':id')
  @ApiOperation({ summary: 'Get user by ID' })
  @ApiParam({ name: 'id', description: 'User ID' })
  @ApiOkResponse({ type: UserDto })
  getUser(@Param('id') id: string) {
    return this.usersService.findOne(id);
  }
}
```

---

## 🐛 Déboguer & Reporter Issues

### Reporter un Bug

```markdown
## Description

Brève description du bug.

## Steps to Reproduce

1. Go to ...
2. Click ...
3. See error

## Expected Behavior

Ce qui devrait se passer.

## Actual Behavior

Ce qui se passe réellement.

## Environment

- OS: macOS 13.x
- Node: v18.x
- Flutter: 3.x
- Browser: Chrome 120

## Logs / Error

Paste logs or error messages.

## Attachments

Screenshot or video demonstrating issue.
```

### Debug Locally

```bash
# Enable debug logs
DEBUG=domaura:* npm run dev

# Debug backend
# In VS Code: F5 to start debugger
# Breakpoints, step through

# Debug Flutter
flutter run -v

# Chrome DevTools
# Flutter Web: Cmd+Shift+I
```

---

## 🎯 Checklist Finale

Before committing:

- [ ] Code follows conventions
- [ ] Tests pass
- [ ] No console errors/warnings
- [ ] Documentation updated
- [ ] Commit message is clear
- [ ] No sensitive data committed

---

## 📞 Questions?

- **Slack/Discord**: #dev channel
- **GitHub Issues**: Use labels
- **Email**: dev@domaura.com

---

## 🙏 Merci!

Votre contribution rend DOMAURA meilleur. Together, we build Africa's trusted ecosystem!

---

*Last updated: April 2026*
