import { AppShell } from "../../components/AppShell";

export default function CreatePage() {
  return (
    <AppShell>
      <main className="page form-page">
        <section className="page-head">
          <p className="eyebrow">Publication MVP</p>
          <h1>Creer une annonce</h1>
          <p>
            Formulaire mock pour valider le parcours vendeur avant le backend V1.
          </p>
        </section>

        <form className="form-card">
          <label>
            Type
            <select defaultValue="property">
              <option value="property">Immobilier</option>
              <option value="product">Produit</option>
              <option value="service">Service</option>
            </select>
          </label>
          <label>
            Titre
            <input placeholder="Villa moderne, salon complet, electricien..." />
          </label>
          <label>
            Localisation
            <input placeholder="Douala, Bonapriso" />
          </label>
          <label>
            Prix
            <input placeholder="350 000 FCFA" />
          </label>
          <label>
            Description
            <textarea placeholder="Decris l'offre et les garanties disponibles." />
          </label>
          <button type="button" className="button primary">
            Enregistrer le brouillon mock
          </button>
        </form>
      </main>
    </AppShell>
  );
}
