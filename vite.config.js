import {defineConfig} from 'vite';
//import { resolve } from 'path';
import react from '@vitejs/plugin-react';
import { NodePolyfills } from 'vite-plugin-node-polyfills'; 

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [
      react(), 
      NodePolyfills(),
    ],
    base: './',
    css: {
      devSourcemap: false
    },
    optimizeDeps: {
    include: ['buffer'],  // Include buffer in optimization
  },
  define: {
    'process.env': {},  // If you're using process.env, make sure it’s defined
    'global': 'window',
  },
  build: {
    rollupOptions: {
      external: ['buffer'],  // Prevent buffer from being bundled into the app
    },
  },
  resolve: {
    alias: {
      //buffer: 'buffer/'  // Use the npm-installed buffer module    
      buffer: require.resolve('buffer/')	    
      //buffer: resolve(__dirname, 'node_modules', 'buffer'),  // Ensure buffer is available in the browser environment
    },
  },
})
