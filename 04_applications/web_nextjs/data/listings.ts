export type ListingCategory = "property" | "product" | "service";

export type Listing = {
  id: string;
  category: ListingCategory;
  title: string;
  location: string;
  price: string;
  trustScore: number;
  seller: string;
  summary: string;
  tags: string[];
  verified: boolean;
};

export const listings: Listing[] = [
  {
    id: "villa-bastos",
    category: "property",
    title: "Villa moderne 4 chambres",
    location: "Yaounde, Bastos",
    price: "350 000 USD",
    trustScore: 92,
    seller: "Agence Kmer Habitat",
    summary:
      "Villa securisee avec parking, jardin, finitions modernes et quartier premium.",
    tags: ["Immobilier", "Achat", "Verifie"],
    verified: true
  },
  {
    id: "appartement-bonapriso",
    category: "property",
    title: "Appartement premium meuble",
    location: "Douala, Bonapriso",
    price: "1 200 000 FCFA / mois",
    trustScore: 86,
    seller: "Ama Properties",
    summary:
      "Appartement meuble proche des services essentiels, ideal cadre ou expatriation.",
    tags: ["Location", "Meuble", "Premium"],
    verified: true
  },
  {
    id: "salon-complet",
    category: "product",
    title: "Salon complet en bois massif",
    location: "Douala, Akwa",
    price: "650 000 FCFA",
    trustScore: 78,
    seller: "Maison Deco CM",
    summary:
      "Mobilier de salon en bon etat, livraison protegee disponible dans Douala.",
    tags: ["Market", "Maison", "Livraison"],
    verified: false
  },
  {
    id: "electricien-certifie",
    category: "service",
    title: "Electricien certifie disponible",
    location: "Yaounde, Mvan",
    price: "15 000 FCFA / intervention",
    trustScore: 88,
    seller: "Eric Services",
    summary:
      "Installation, diagnostic et depannage electrique avec avis clients verifies.",
    tags: ["Services", "Certifie", "Rapide"],
    verified: true
  }
];

export function getListingById(id: string) {
  return listings.find((listing) => listing.id === id);
}

export function categoryLabel(category: ListingCategory) {
  const labels: Record<ListingCategory, string> = {
    property: "Home",
    product: "Market",
    service: "Services"
  };

  return labels[category];
}
