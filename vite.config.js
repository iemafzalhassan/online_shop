import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  base: './',
  css: {
    devSourcemap: false
  },
  server: {
    host: '0.0.0.0',  // Allow access from outside the container
    port: 3000        // Set port to 3000
  }
});

