import Link from "next/link";
import { categoryLabel, type Listing } from "../data/listings";

export function ListingCard({ listing }: { listing: Listing }) {
  return (
    <article className="listing-card">
      <div className={`listing-media ${listing.category}`} aria-hidden="true" />
      <div className="listing-body">
        <div className="card-meta">
          <span>{categoryLabel(listing.category)}</span>
          {listing.verified ? <span>Verified</span> : <span>Pending trust</span>}
        </div>
        <h3>{listing.title}</h3>
        <p className="muted">{listing.location}</p>
        <p>{listing.summary}</p>
        <div className="card-footer">
          <strong>{listing.price}</strong>
          <Link href={`/listing/${listing.id}`} className="text-link">
            Voir detail
          </Link>
        </div>
      </div>
    </article>
  );
}
