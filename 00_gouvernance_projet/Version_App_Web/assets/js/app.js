const properties = [
  {
    id: "p1",
    title: "Villa moderne 4 chambres",
    location: "Yaounde, Bastos",
    price: "$350,000",
    type: "house",
    desc: "Corner villa with premium finishing and secured neighborhood.",
  },
  {
    id: "p2",
    title: "Appartement premium",
    location: "Douala, Bonapriso",
    price: "$210,000",
    type: "apartment",
    desc: "Modern apartment with parking, city view and smart access.",
  },
  {
    id: "p3",
    title: "Maison familiale",
    location: "Kribi, Ocean",
    price: "$175,000",
    type: "house",
    desc: "Spacious family property near schools and health facilities.",
  },
];

const homeCards = document.getElementById("home-cards");
const listingCards = document.getElementById("listing-cards");
const filterButtons = document.querySelectorAll(".f-btn");
const detailPrice = document.getElementById("detail-price");
const detailText = document.getElementById("detail-text");

let currentFilter = "all";
let selectedId = properties[0].id;

function filteredProperties() {
  if (currentFilter === "all") return properties;
  return properties.filter((item) => item.type === currentFilter);
}

function cardTemplate(item, selected) {
  return `
    <article class="listing-card ${selected ? "is-selected" : ""}" data-id="${item.id}">
      <div class="listing-thumb"></div>
      <div>
        <p class="listing-title">${item.title}</p>
        <p class="listing-meta">${item.location}</p>
        <p class="listing-price">${item.price}</p>
      </div>
    </article>
  `;
}

function renderCards() {
  const list = filteredProperties();

  if (!list.find((item) => item.id === selectedId)) {
    selectedId = list[0]?.id || "";
  }

  homeCards.innerHTML = list
    .slice(0, 2)
    .map((item) => cardTemplate(item, item.id === selectedId))
    .join("");

  listingCards.innerHTML = list
    .map((item) => cardTemplate(item, item.id === selectedId))
    .join("");

  wireCardSelection();
  updateDetail();
}

function wireCardSelection() {
  const cards = document.querySelectorAll(".listing-card");
  cards.forEach((card) => {
    card.addEventListener("click", () => {
      selectedId = card.dataset.id || selectedId;
      renderCards();
    });
  });
}

function updateDetail() {
  const selected = properties.find((item) => item.id === selectedId);
  if (!selected) return;
  detailPrice.textContent = selected.price;
  detailText.textContent = selected.desc;
}

filterButtons.forEach((button) => {
  button.addEventListener("click", () => {
    filterButtons.forEach((b) => b.classList.remove("is-active"));
    button.classList.add("is-active");
    currentFilter = button.dataset.filter || "all";
    renderCards();
  });
});

renderCards();
