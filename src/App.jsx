/*adding this comment as part of Hackathon Phase 1*/

import { Routes, Route } from "react-router-dom";
import { Container } from "react-bootstrap";
import { Navbar } from "./components/Navbar";
import Store from "./pages/Store";
import { ShoppingCartProvider } from "./context/ShoppingCartContext";
import { ShoppingItemsProvider } from "./context/ShoppingItemsContext";
import { ThemeProvider } from "./context/ThemeContext";
import { Footer } from "./components/Footer";
import Admin from "./pages/Admin";
import Checkout from "./pages/Checkout";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

import React from 'react';
import { Buffer } from 'buffer/';
import { process } from "process";

import { express } from "express";
//const express = require('express');
//const app = express();
// App.jsx

import React from 'react';
import { Buffer } from 'buffer';  // Import the Buffer class from the 'buffer' module

const App = () => {
  let bufferString = '';

  try {
    // Example usage of Buffer
    const buffer = Buffer.from('Hello, world!', 'utf8');  // Create a Buffer from a string
    bufferString = buffer.toString();  // Convert the Buffer back to a string
    console.log(bufferString);  // Log the buffer string to the console
  } catch (error) {
    console.error('Error handling buffer:', error);
  }

  return (
    <div>
      <h1>Buffer Example in React</h1>
      <p>{bufferString}</p>  {/* Display the buffer as a string in the component */}
    </div>
  );
};

export default App;


// Now you can safely use process in the browser
console.log(process.env.NODE_ENV);

// Define your routes and middleware here
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Start the server and listen on port 3000
app.listen(3000, () => {
  console.log('Server running on port 3000');
});

export default function App() {
    return (
        <ThemeProvider>
            <ShoppingItemsProvider>
                <ShoppingCartProvider>
                    <div className="d-flex flex-column min-vh-100">
                        <Navbar />
                        <Container className="mb-4 flex-grow-1">
                            <Routes>
                                <Route path="/" element={<Store />} />
                                <Route path="/admin" element={<Admin />} />
                                <Route path="/checkout" element={<Checkout />} />
                            </Routes>
                        </Container>
                        <Footer />
                        <ToastContainer 
                            position="top-right"
                            autoClose={3000}
                            hideProgressBar={false}
                            newestOnTop
                            closeOnClick
                            rtl={false}
                            pauseOnFocusLoss
                            draggable
                            pauseOnHover
                            theme="dark"
                        />
                    </div>
                </ShoppingCartProvider>
            </ShoppingItemsProvider>
        </ThemeProvider>
    );
}
