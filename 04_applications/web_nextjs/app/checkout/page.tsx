import Link from "next/link";
import { AppShell } from "../../components/AppShell";

export default function CheckoutPage() {
  return (
    <AppShell>
      <main className="page narrow-page">
        <section className="page-head">
          <p className="eyebrow">Escrow mock</p>
          <h1>Simulation de transaction securisee</h1>
          <p>
            Le paiement reel arrive en V1. Le MVP montre le principe: fonds
            bloques, confirmation acheteur, liberation vendeur.
          </p>
        </section>

        <section className="timeline-card">
          <div className="timeline-step done">
            <strong>1. Accord</strong>
            <span>Acheteur et vendeur valident les conditions.</span>
          </div>
          <div className="timeline-step active">
            <strong>2. Escrow DOMAURA</strong>
            <span>Montant simule bloque en attente de confirmation.</span>
          </div>
          <div className="timeline-step">
            <strong>3. Livraison / visite</strong>
            <span>L&apos;acheteur confirme la reception ou la visite.</span>
          </div>
          <div className="timeline-step">
            <strong>4. Liberation</strong>
            <span>DOMAURA libere le paiement vendeur.</span>
          </div>
          <Link href="/profile" className="button primary full">
            Finaliser la demo
          </Link>
        </section>
      </main>
    </AppShell>
  );
}
