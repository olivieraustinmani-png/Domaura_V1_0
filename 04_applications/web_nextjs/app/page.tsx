import Link from "next/link";
import { AppShell } from "../components/AppShell";
import { ListingCard } from "../components/ListingCard";
import { listings } from "../data/listings";

export default function HomePage() {
  const featuredListings = listings.slice(0, 3);

  return (
    <AppShell>
      <main className="page">
        <section className="hero">
          <div>
            <p className="eyebrow">App Web MVP</p>
            <h1>La plateforme de confiance pour vivre, acheter et vendre mieux.</h1>
            <p>
              DOMAURA unifie immobilier, marketplace et services avec une couche
              de confiance adaptee au marche africain.
            </p>
            <div className="hero-actions">
              <Link href="/explore" className="button primary">
                Explorer
              </Link>
              <Link href="/create" className="button secondary">
                Publier une annonce
              </Link>
            </div>
          </div>
          <div className="hero-panel">
            <span>Demo end-to-end</span>
            <strong>Browse - Chat - Escrow mock</strong>
            <p>Sans backend reel pour aller vite, mais avec le parcours produit complet.</p>
          </div>
        </section>

        <section className="stats-grid" aria-label="Priorites MVP">
          <div>
            <strong>3</strong>
            <span>modules fusionnes</span>
          </div>
          <div>
            <strong>1</strong>
            <span>modele Listing</span>
          </div>
          <div>
            <strong>Mock</strong>
            <span>escrow & trust</span>
          </div>
        </section>

        <section className="section-heading">
          <div>
            <p className="eyebrow">Apercu</p>
            <h2>Annonces prioritaires</h2>
          </div>
          <Link href="/explore" className="text-link">
            Tout voir
          </Link>
        </section>

        <section className="listing-grid">
          {featuredListings.map((listing) => (
            <ListingCard key={listing.id} listing={listing} />
          ))}
        </section>
      </main>
    </AppShell>
  );
}
