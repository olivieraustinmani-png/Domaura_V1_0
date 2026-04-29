# DOMAURA — UML & Architecture (Phases 1 to 5)

## 1. DOMAIN MODEL (DDD)

### Bounded Contexts
- Identity & Access
- Property (PropTech)
- Marketplace
- Services
- Payments & Escrow
- Trust & Safety
- Communication
- AI Context

### Diagram (PlantUML)
```plantuml
@startuml
package "Identity" {
  class User
  class Profile
  class TrustScore
}

package "Property" {
  class Property
  class Location
  class Media
}

User --> Property : owns
Property --> Location
Property --> Media
User --> TrustScore
@enduml
```

---

## 2. USE CASE DIAGRAM

```plantuml
@startuml
actor Client
actor Seller
actor Provider
actor Admin
actor PaymentSystem

Client --> (Search)
Client --> (Buy / Book)
Client --> (Chat / Negotiate)

Seller --> (Publish Listing)
Provider --> (Offer Service)

Admin --> (Moderate)
PaymentSystem --> (Process Payment)
@enduml
```

---

## 3. CLASS DIAGRAM

```plantuml
@startuml
class User {
  +id: UUID
  +name: String
  +email: String
}

class Property {
  +id: UUID
  +title: String
  +price: Decimal
}

class Order {
  +id: UUID
  +status: String
}

class Payment {
  +id: UUID
  +amount: Decimal
  +status: String
}

User --> Property
User --> Order
Order --> Payment
@enduml
```

---

## 4. SEQUENCE DIAGRAM (Escrow Payment)

```plantuml
@startuml
actor User
participant Frontend
participant API
participant PaymentService
participant Escrow

User -> Frontend : Pay
Frontend -> API : create payment
API -> PaymentService : process
PaymentService -> Escrow : hold funds
Escrow -> PaymentService : confirm
PaymentService -> API : success
API -> Frontend : response
@enduml
```

---

## 5. ACTIVITY DIAGRAM (Transaction Flow)

```plantuml
@startuml
start
:Select item;
:Create order;
:Initiate payment;
if (Payment success?) then (yes)
  :Hold escrow;
  :Deliver service/product;
  if (Confirmed?) then (yes)
    :Release payment;
  else (no)
    :Open dispute;
  endif
else (no)
  :Cancel order;
endif
stop
@enduml
```

---

# END OF DOCUMENT
