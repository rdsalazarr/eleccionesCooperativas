import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import react from '@vitejs/plugin-react';

export default defineConfig({
    build: {
        chunkSizeWarningLimit: 100000000,
    },
    plugins: [
        laravel({
            input: ['resources/css/app.css', 
                    //'resources/js/components/page/app.jsx',
                    'resources/js/components/page/admin.jsx',
                    //'resources/js/components/page/reset.jsx',
                    'resources/js/components/admin/dashboard.jsx',
                    'resources/js/components/page/errors/E401.jsx',
                    'resources/js/components/page/errors/E403.jsx',
                    'resources/js/components/page/errors/E404.jsx',
                    'resources/js/components/page/errors/E405.jsx',
                    'resources/js/components/page/errors/E419.jsx',
                    'resources/js/components/page/errors/E429.jsx',
                    'resources/js/components/page/errors/E500.jsx',
                    'resources/js/components/page/errors/E503.jsx',
                    'resources/js/components/page/errors/upMantenimiento.jsx',
                ],
            refresh: true,
        }),
        react(),
    ],
    optimizeDeps: {
        include: ['dayjs/locale/es'],
    },
    server: {
        watch: {
            ignored: ['**/storage/framework/views/**'],
        },
    },
});