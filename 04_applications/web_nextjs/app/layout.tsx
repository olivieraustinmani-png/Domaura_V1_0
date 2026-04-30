import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Domaura App Web MVP",
  description: "Demo MVP de la super-app africaine de confiance Domaura",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr">
      <body>{children}</body>
    </html>
  );
}
