export function TrustBadge({
  score,
  verified
}: {
  score: number;
  verified: boolean;
}) {
  return (
    <div className="trust-badge">
      <span>Trust score</span>
      <strong>{score}/100</strong>
      <small>{verified ? "Profil verifie MVP" : "Verification en attente"}</small>
    </div>
  );
}
