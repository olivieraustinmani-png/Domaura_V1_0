import Link from "next/link";
import type { ReactNode } from "react";

const navItems = [
  { href: "/", label: "Home" },
  { href: "/explore", label: "Explore" },
  { href: "/create", label: "Create" },
  { href: "/chat", label: "Chat" },
  { href: "/profile", label: "Profile" }
];

export function AppShell({ children }: { children: ReactNode }) {
  return (
    <>
      <header className="topbar">
        <Link href="/" className="brand-link" aria-label="Domaura home">
          <span className="brand-mark">D</span>
          <span>
            <strong>DOMAURA</strong>
            <small>Smart Living Begins Here</small>
          </span>
        </Link>
        <nav className="nav-links" aria-label="Main navigation">
          {navItems.map((item) => (
            <Link key={item.href} href={item.href}>
              {item.label}
            </Link>
          ))}
        </nav>
      </header>
      {children}
    </>
  );
}
