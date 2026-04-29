type PropertyCardProps = {
  title: string;
  location: string;
  price: string;
};

export function PropertyCard({ title, location, price }: PropertyCardProps) {
  return (
    <article className="property-card">
      <div className="thumb" />
      <div>
        <h3>{title}</h3>
        <p className="muted">{location}</p>
        <p className="price">{price}</p>
      </div>
    </article>
  );
}

