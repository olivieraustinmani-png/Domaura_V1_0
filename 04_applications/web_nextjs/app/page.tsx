import { PropertyCard } from "../components/PropertyCard";

const properties = [
  {
    title: "Villa moderne 4 chambres",
    location: "Yaounde, Bastos",
    price: "$350,000",
  },
  {
    title: "Appartement premium",
    location: "Douala, Bonapriso",
    price: "$210,000",
  },
  {
    title: "Maison familiale",
    location: "Kribi, Ocean",
    price: "$175,000",
  },
];

export default function HomePage() {
  return (
    <main className="container">
      <header className="hero">
        <div className="brand">
          <div className="brand-mark">D</div>
          <div>
            <h1 className="brand-title">DOMAURA</h1>
            <p className="muted">Trusted smart living ecosystem</p>
          </div>
        </div>
        <div className="palette" aria-label="Domaura palette">
          <div style={{ background: "#0F172A" }} />
          <div style={{ background: "#D4AF37" }} />
          <div style={{ background: "#F8FAFC" }} />
        </div>
      </header>

      <section className="main-grid">
        <div className="card section">
          <h2>Listings</h2>
          <div className="filters">
            <button className="chip active">All</button>
            <button className="chip">House</button>
            <button className="chip">Apartment</button>
            <button className="chip">For sale</button>
            <button className="chip">For rent</button>
          </div>
          <div className="property-list">
            {properties.map((property) => (
              <PropertyCard key={property.title} {...property} />
            ))}
          </div>
        </div>

        <div className="stack">
          <section className="card section">
            <h2>Property details</h2>
            <div className="thumb" style={{ minHeight: 180 }} />
            <p className="price">$350,000</p>
            <p className="muted">
              Corner villa with secure parking, modern finishes, and premium
              neighborhood services.
            </p>
            <button className="action">Contact / Book</button>
          </section>

          <section className="card section">
            <h2>Profile</h2>
            <div className="profile">
              <div className="avatar">AM</div>
              <div>
                <strong>Ama</strong>
                <p className="muted">Premium profile</p>
              </div>
            </div>
          </section>

          <section className="card section">
            <h2>Add property</h2>
            <div className="field">
              <label htmlFor="title">Property title</label>
              <input id="title" placeholder="Modern villa" />
            </div>
            <div className="field">
              <label htmlFor="type">Type</label>
              <select id="type" defaultValue="house">
                <option value="house">House</option>
                <option value="apartment">Apartment</option>
              </select>
            </div>
            <div className="field">
              <label htmlFor="price">Price</label>
              <input id="price" placeholder="$120,000" />
            </div>
            <button className="action secondary">Submit</button>
          </section>
        </div>
      </section>
    </main>
  );
}

