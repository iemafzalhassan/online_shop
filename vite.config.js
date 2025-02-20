import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [react()],
    base: './',
    server: {
    host: '0.0.0.0', // Make Vite accessible in Docker
    port: 5173, // Default Vite port
  },
  build: {
    outDir: 'dist', // Ensure build files go into dist
  },
    css: {
      devSourcemap: false
    }
})
