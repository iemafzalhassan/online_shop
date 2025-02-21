import { Container, Row, Col, Button } from "react-bootstrap";
import { useState } from "react";
import { useShoppingItems } from "../context/ShoppingItemsContext";
import { formatCurrency } from "../utilities/formatCurrency";
import { toast } from "react-toastify";

export default function Admin() {
    const { products, addProduct, updateProduct, deleteProduct } = useShoppingItems();
    const [newProduct, setNewProduct] = useState({
        name: "",
        price: "",
        imgUrl: ""
    });

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await addProduct({
                ...newProduct,
                price: parseFloat(newProduct.price)
            });
            setNewProduct({ name: "", price: "", imgUrl: "" });
            toast.success("Product added successfully!", {
                position: "top-right",
                theme: "dark"
            });
        } catch (error) {
            toast.error("Failed to add product. Please try again.", {
                position: "top-right",
                theme: "dark"
            });
        }
    };

    return (
        <Container>
            <h1 className="text-primary my-4">Admin Dashboard</h1>

            <div className="admin-form-container p-4 mb-5">
                <h2 className="mb-4">Add New Product</h2>
                <form onSubmit={handleSubmit}>
                    <div className="mb-3">
                        <label className="form-label">Product Name</label>
                        <input
                            type="text"
                            className="form-control"
                            value={newProduct.name}
                            onChange={(e) => setNewProduct({ ...newProduct, name: e.target.value })}
                            required
                        />
                    </div>
                    <div className="mb-3">
                        <label className="form-label">Price</label>
                        <input
                            type="number"
                            step="0.01"
                            className="form-control"
                            value={newProduct.price}
                            onChange={(e) => setNewProduct({ ...newProduct, price: e.target.value })}
                            required
                        />
                    </div>
                    <div className="mb-3">
                        <label className="form-label">Image URL</label>
                        <input
                            type="url"
                            className="form-control"
                            value={newProduct.imgUrl}
                            onChange={(e) => setNewProduct({ ...newProduct, imgUrl: e.target.value })}
                            required
                        />
                    </div>
                    <Button type="submit" className="btn-primary">Add Product</Button>
                </form>
            </div>

            <h2 className="mb-4">Product List</h2>
            <Row xs={1} md={2} lg={3} className="g-4">
                {products.map(product => (
                    <Col key={product.id}>
                        <div className="product-card h-100">
                            <div className="product-image-container" style={{ height: '200px', overflow: 'hidden' }}>
                                <img
                                    src={product.imgUrl}
                                    className="product-image"
                                    alt={product.name}
                                    onError={(e) => {
                                        e.target.parentElement.innerHTML = `
                                            <div class="product-image-unavailable">
                                                Image Unavailable
                                            </div>
                                        `;
                                    }}
                                />
                            </div>
                            <div className="product-details">
                                <div className="product-info">
                                    <h3 className="product-name">{product.name}</h3>
                                    <p className="product-price">{formatCurrency(product.price)}</p>
                                </div>
                                <div className="d-flex gap-4">
                                    <Button
                                        className="btn-outline-primary w-50"
                                        onClick={() => updateProduct(product.id)}
                                    >
                                        Update
                                    </Button>
                                    <Button
                                        className="btn-outline-danger w-50"
                                        onClick={() => deleteProduct(product.id)}
                                    >
                                        Delete
                                    </Button>
                                </div>
                            </div>
                        </div>
                    </Col>
                ))}
            </Row>
        </Container>
    );
}
