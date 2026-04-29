import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Domaura Web",
  description: "Domaura web style reference",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}

