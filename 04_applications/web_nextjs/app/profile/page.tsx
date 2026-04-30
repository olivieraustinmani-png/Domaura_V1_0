import { AppShell } from "../../components/AppShell";
import { TrustBadge } from "../../components/TrustBadge";

const badges = ["Email verifie", "Telephone verifie", "Vendeur actif", "Escrow eligible"];

export default function ProfilePage() {
  return (
    <AppShell>
      <main className="page profile-layout">
        <section className="profile-card">
          <div className="avatar">AM</div>
          <div>
            <p className="eyebrow">Profil MVP</p>
            <h1>Ama M.</h1>
            <p>Utilisatrice premium fictive pour la demo App Web.</p>
          </div>
        </section>

        <section className="side-panel">
          <TrustBadge score={89} verified />
          <div className="tag-row">
            {badges.map((badge) => (
              <span key={badge}>{badge}</span>
            ))}
          </div>
        </section>
      </main>
    </AppShell>
  );
}
