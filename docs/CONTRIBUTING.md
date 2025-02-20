# Contributing to Online Shop 🤝

First off, thank you for considering contributing to Online Shop! It's people like you that make Online Shop such a great tool.

## Code of Conduct 📜

By participating in this project, you are expected to uphold our Code of Conduct. Please report unacceptable behavior to [maintainer's email].

## Getting Started 🚀

1. Fork the repository
2. Clone your fork
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Push to your fork
6. Submit a Pull Request

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- Git

### Setting Up Development Environment
```bash
Port: 3000
```


1. Install dependencies:
```bash
npm install
# or
yarn install
```

2. Start development server:
```bash
npm run dev
# or
yarn dev
```

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

Example:
```bash
git commit -m "feat: add user authentication system"
```

### Pull Request Process 🔄

1. Update the README.md with details of changes if needed
2. Update the CHANGELOG.md following the existing format
3. The PR will be merged once you have the sign-off of at least one maintainer

## Project Structure 📁

```
.
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── ROADMAP.md
├── eslint.config.js
├── index.css
├── index.html
├── package-lock.json
├── package.json
├── public
│   ├── OS.svg
│   └── imgs
│       ├── logo.png
│       ├── logo.svg
│       └── placeholder-image.png
├── src
│   ├── App.jsx
│   ├── bootstrap-overrides.scss
│   ├── components
│   │   ├── CartItem.jsx
│   │   ├── DeleteProductModal.jsx
│   │   ├── Footer.jsx
│   │   ├── InProgressToastContent.jsx
│   │   ├── LoadingSpinner.jsx
│   │   ├── Modals
│   │   │   ├── CheckoutModal.jsx
│   │   │   ├── DeleteProductModal.jsx
│   │   │   ├── NewProductModal.jsx
│   │   │   └── UpdateProductModal.jsx
│   │   ├── Navbar.jsx
│   │   ├── ProductItem.jsx
│   │   ├── SearchBar.jsx
│   │   ├── ShoppingCart.jsx
│   │   ├── Store.jsx
│   │   ├── StoreItem.jsx
│   │   ├── ThemeToggle.jsx
│   │   └── UpdateProductModal.jsx
│   ├── context
│   │   ├── NavBarContext.jsx
│   │   ├── ShoppingCartContext.jsx
│   │   ├── ShoppingItemsContext.jsx
│   │   └── ThemeContext.jsx
│   ├── data
│   │   ├── demoProducts.js
│   │   └── productData.js
│   ├── hooks
│   │   └── useLocalStorage.js
│   ├── index.css
│   ├── main.jsx
│   ├── pages
│   │   ├── Admin.jsx
│   │   ├── Checkout.jsx
│   │   ├── Home.jsx
│   │   └── Store.jsx
│   ├── services
│   │   └── db.js
│   └── utilities
│       └── formatCurrency.js
└── vite.config.js
```

## Community 👥
- Join our [Discord server](https://discord.gg/aVMWfSKA)


## License 📄

By contributing, you agree that your contributions will be licensed under the same MIT License that covers the project. 
