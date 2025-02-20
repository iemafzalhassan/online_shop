import { useState } from "react";
import { useNavigate } from "react-router-dom";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();
    // Simple authentication check (Replace with real API)
    if (email === "user@example.com" && password === "password123") {
      alert("Login Successful!");
      navigate("/dashboard");
    } else {
      alert("Invalid credentials. Try again.");
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <h2 className="text-2xl font-bold mb-4">Login</h2>
      <form onSubmit={handleLogin} className="bg-white p-6 shadow-md rounded">
        <input 
          type="email" 
          placeholder="Email" 
          className="block mb-2 p-2 border rounded w-full"
          value={email} 
          onChange={(e) => setEmail(e.target.value)} 
          required
        />
        <input 
          type="password" 
          placeholder="Password" 
          className="block mb-2 p-2 border rounded w-full"
          value={password} 
          onChange={(e) => setPassword(e.target.value)} 
          required
        />
        <button 
          type="submit" 
          className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700"
        >
          Login
        </button>
      </form>
    </div>
  );
};

export default Login;

