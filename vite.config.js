import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [react()],
    base: './',
    css: {
      devSourcemap: false
    }
server: {
    host: '0.0.0.0', // Allows access from any IP
    port: 5173,
    strictPort: true,
    allowedHosts: ['twshackathon.blogcompany.in'], // Add your domain here
  }
})
