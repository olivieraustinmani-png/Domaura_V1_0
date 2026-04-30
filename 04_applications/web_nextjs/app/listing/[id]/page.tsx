import Link from "next/link";
import { notFound } from "next/navigation";
import { AppShell } from "../../../components/AppShell";
import { TrustBadge } from "../../../components/TrustBadge";
import { categoryLabel, getListingById, listings } from "../../../data/listings";

export function generateStaticParams() {
  return listings.map((listing) => ({ id: listing.id }));
}

export default function ListingDetailPage({
  params
}: {
  params: { id: string };
}) {
  const listing = getListingById(params.id);

  if (!listing) {
    notFound();
  }

  return (
    <AppShell>
      <main className="page detail-layout">
        <section className="detail-main">
          <div className={`detail-media ${listing.category}`} aria-hidden="true" />
          <p className="eyebrow">{categoryLabel(listing.category)}</p>
          <h1>{listing.title}</h1>
          <p className="muted">{listing.location}</p>
          <p>{listing.summary}</p>
          <div className="tag-row">
            {listing.tags.map((tag) => (
              <span key={tag}>{tag}</span>
            ))}
          </div>
        </section>

        <aside className="side-panel">
          <p className="price-large">{listing.price}</p>
          <TrustBadge score={listing.trustScore} verified={listing.verified} />
          <div className="seller-box">
            <span>Vendeur</span>
            <strong>{listing.seller}</strong>
          </div>
          <Link href="/chat" className="button primary full">
            Contacter
          </Link>
          <Link href="/checkout" className="button secondary full">
            Simuler escrow
          </Link>
        </aside>
      </main>
    </AppShell>
  );
}
