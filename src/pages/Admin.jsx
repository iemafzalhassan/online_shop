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
        <Container className="py-4">
            <h1 className="text-primary mb-4">Admin Dashboard</h1>
            
            {/* Add Product Form */}
            <div className="bg-elevated rounded-3 p-4 mb-5 shadow-sm">
                <h2 className="mb-4">Add New Product</h2>
                <form onSubmit={handleSubmit}>
                    <Row className="g-3">
                        <Col md={6}>
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
                        </Col>
                        <Col md={6}>
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
                        </Col>
                        <Col xs={12}>
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
                        </Col>
                        <Col xs={12}>
                            <Button type="submit" className="w-100 w-md-auto">
                                Add Product
                            </Button>
                        </Col>
                    </Row>
                </form>
            </div>

            {/* Product List */}
            <h2 className="mb-4">Manage Products</h2>
            <Row xs={1} md={2} lg={3} className="g-4">
                {products.map(product => (
                    <Col key={product.id}>
                        <div className="h-100 d-flex flex-column bg-elevated rounded-3 shadow-sm p-3">
                            <div className="ratio ratio-1x1 mb-3">
                                <img
                                    src={product.imgUrl}
                                    className="object-fit-cover rounded-2"
                                    alt={product.name}
                                />
                            </div>
                            <div className="d-flex justify-content-between align-items-start mb-2">
                                <h3 className="h5 mb-0">{product.name}</h3>
                                <div className="text-primary fw-bold">
                                    {formatCurrency(product.price)}
                                </div>
                            </div>
                            <div className="mt-auto d-grid gap-2">
                                <Button 
                                    variant="outline-primary" 
                                    onClick={() => updateProduct(product.id)}
                                >
                                    Update
                                </Button>
                                <Button 
                                    variant="outline-danger"
                                    onClick={() => deleteProduct(product.id)}
                                >
                                    Delete
                                </Button>
                            </div>
                        </div>
                    </Col>
                ))}
            </Row>
        </Container>
    );
}