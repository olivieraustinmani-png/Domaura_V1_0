import { AppShell } from "../../components/AppShell";
import { ListingCard } from "../../components/ListingCard";
import { listings } from "../../data/listings";

const filters = ["Tous", "Home", "Market", "Services", "Verified"];

export default function ExplorePage() {
  return (
    <AppShell>
      <main className="page">
        <section className="page-head">
          <p className="eyebrow">Explore</p>
          <h1>Toutes les opportunites DOMAURA</h1>
          <p>
            Immobilier, produits maison et prestataires dans un feed unique pour
            garder le MVP simple et demonstrable.
          </p>
        </section>

        <div className="filter-row">
          {filters.map((filter, index) => (
            <button key={filter} className={index === 0 ? "chip active" : "chip"}>
              {filter}
            </button>
          ))}
        </div>

        <section className="listing-grid">
          {listings.map((listing) => (
            <ListingCard key={listing.id} listing={listing} />
          ))}
        </section>
      </main>
    </AppShell>
  );
}
