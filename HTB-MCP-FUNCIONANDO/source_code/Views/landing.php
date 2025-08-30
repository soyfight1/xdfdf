<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phoenix Pipeline - Global Infrastructure Status</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/challenge/public/css/styles.css">
</head>
<body class="bg-slate-900 text-white font-mono overflow-x-hidden">
    <!-- Particle Background -->
    <div id="particles-container" class="fixed inset-0 z-0"></div>
    
    <?php include __DIR__ . '/partials/navbar.php'; ?>

    <!-- Main Content -->
    <main class="relative z-10 container mx-auto px-6 py-8 mt-20">
        <!-- Hero Section -->
        <section class="text-center mb-12">
            <div class="max-w-4xl mx-auto">
                <div class="bg-red-500/10 border border-red-500/30 rounded-lg p-6 mb-6">
                    <div class="flex items-center justify-center mb-3">
                        <i data-lucide="alert-triangle" class="w-8 h-8 text-red-400 mr-3 animate-pulse"></i>
                        <h3 class="text-xl font-bold text-red-400 phoenix-font">SYSTEM ALERT</h3>
                    </div>
                    <p class="text-lg text-red-300 mb-4">
                        <strong>WIDESPREAD INFRASTRUCTURE FAILURE DETECTED</strong>
                    </p>
                    <p class="text-slate-300">
                        Multiple critical systems experiencing severe disruptions. Emergency protocols activated. 
                        Hostile entity infiltration confirmed across power grids, communication networks, and transportation hubs. 
                        Containment operations in progress. Only secured military installations remain fully operational.
                    </p>
                    <p class="text-slate-300 mt-4">
                        Operators required to report to the Phoenix Pipeline Command Center immediately.
                    </p>
                    <p class="text-slate-300 mt-5">
                        Regards, admin
                    </p>
                </div>
            </div>
        </section>
    </main>

    <script src="/challenge/public/js/particles.js"></script>
    <script src="/challenge/public/js/public.js"></script>
</body>
</html> 