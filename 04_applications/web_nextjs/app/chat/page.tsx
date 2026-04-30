import Link from "next/link";
import { AppShell } from "../../components/AppShell";

const messages = [
  {
    author: "Acheteur",
    text: "Bonjour, le bien est-il toujours disponible pour une visite ?"
  },
  {
    author: "Vendeur verifie",
    text: "Oui. DOMAURA peut bloquer la reservation en escrow mock apres confirmation."
  },
  {
    author: "Acheteur",
    text: "Parfait, je souhaite simuler la reservation."
  }
];

export default function ChatPage() {
  return (
    <AppShell>
      <main className="page narrow-page">
        <section className="page-head">
          <p className="eyebrow">Chat mock</p>
          <h1>Conversation acheteur / vendeur</h1>
          <p>Interaction simple pour demontrer la negociation avant transaction.</p>
        </section>

        <section className="chat-card">
          {messages.map((message) => (
            <div key={message.text} className="message">
              <span>{message.author}</span>
              <p>{message.text}</p>
            </div>
          ))}
          <div className="chat-input">
            <input placeholder="Ecrire un message..." />
            <Link href="/checkout" className="button primary">
              Continuer
            </Link>
          </div>
        </section>
      </main>
    </AppShell>
  );
}
