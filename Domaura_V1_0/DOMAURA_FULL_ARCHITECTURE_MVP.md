# DOMAURA — Full Architecture MVP (Database + Backend + Investor Dossier)

---

# A. DATABASE (POSTGRESQL MVP)

## Core Tables

- users
- properties
- products
- services
- orders
- bookings
- payments
- wallets
- transactions
- conversations
- messages
- reviews
- kyc_verifications
- trust_scores
- offers
- media
- locations

---

## USERS

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  name VARCHAR(120),
  email VARCHAR(150) UNIQUE,
  phone VARCHAR(30) UNIQUE,
  password_hash TEXT,
  role VARCHAR(50),
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT now()
);
```

---

## PROPERTIES

```sql
CREATE TABLE properties (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  title VARCHAR(255),
  description TEXT,
  price NUMERIC,
  type VARCHAR(50),
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT now()
);
```

---

## PRODUCTS

```sql
CREATE TABLE products (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  name VARCHAR(255),
  price NUMERIC,
  stock INT,
  created_at TIMESTAMP DEFAULT now()
);
```

---

## ORDERS

```sql
CREATE TABLE orders (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  total_amount NUMERIC,
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT now()
);
```

---

## PAYMENTS (ESCROW)

```sql
CREATE TABLE payments (
  id UUID PRIMARY KEY,
  order_id UUID,
  amount NUMERIC,
  method VARCHAR(50),
  status VARCHAR(50),
  escrow BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT now()
);
```

---

## MESSAGING

```sql
CREATE TABLE conversations (
  id UUID PRIMARY KEY,
  user1_id UUID,
  user2_id UUID,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE messages (
  id UUID PRIMARY KEY,
  conversation_id UUID REFERENCES conversations(id),
  sender_id UUID,
  content TEXT,
  created_at TIMESTAMP DEFAULT now()
);
```

---

## TRUST SYSTEM

```sql
CREATE TABLE trust_scores (
  user_id UUID PRIMARY KEY,
  score INT DEFAULT 0,
  level VARCHAR(50)
);

CREATE TABLE kyc_verifications (
  id UUID PRIMARY KEY,
  user_id UUID,
  status VARCHAR(50),
  document_url TEXT,
  verified_at TIMESTAMP
);
```

---

# B. BACKEND ARCHITECTURE (NESTJS DDD)

## Structure

src/
- modules/
  - auth/
  - users/
  - properties/
  - marketplace/
  - services/
  - payments/
  - messaging/
  - trust/
  - ai/

- common/
- infrastructure/
- config/

---

## Payments Module Example

- PaymentController
- PaymentService
- EscrowService
- TransactionRepository

---

## Event System

- user.created
- order.created
- payment.initiated
- payment.escrow.hold
- payment.released
- kyc.approved
- message.sent

---

## Stack

- NestJS
- PostgreSQL
- Redis
- WebSockets
- JWT Auth

---

# C. INVESTOR / INCUBATOR DOSSIER

## Problem

- lack of trust in transactions
- fragmented payments
- no unified digital marketplace
- weak service digitization in Africa

---

## Solution

DOMAURA SUPER APP:

- PropTech (real estate)
- Marketplace
- Services on demand
- AI assistant
- Escrow payments
- Trust system (KYC + score)

---

## Architecture

- Flutter (mobile)
- Next.js (web)
- NestJS (backend)
- PostgreSQL
- Redis
- Mobile Money APIs (MTN / Orange)

---

## Business Model

- transaction commission (5–15%)
- premium listings
- service fees
- API partnerships

---

## Competitive Advantage

- trust-first platform
- escrow by default
- AI integrated
- multi-sector super app

---

## Scaling Strategy

Phase 1: Cameroon MVP  
Phase 2: Central Africa  
Phase 3: West Africa  
Phase 4: Pan-African expansion  

---

## Vision

Become the **digital trust infrastructure for African transactions**

---

# END OF DOCUMENT
