<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Reports - Phoenix Proxy</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/challenge/public/css/styles.css">
</head>
<body class="bg-slate-900 text-white font-mono overflow-x-hidden">
    <div id="particles-container" class="fixed inset-0 z-0"></div>
    
    <?php include __DIR__ . '/partials/navbar.php'; ?>
    
    <main class="relative z-10 container mx-auto px-6 py-8">
        <div class="max-w-4xl mx-auto bg-slate-800/50 backdrop-blur-sm p-8 rounded-lg border border-slate-700">
            <h1 class="text-2xl font-bold phoenix-font text-orange-400 mb-6">
                <i data-lucide="file-text" class="w-6 h-6 inline mr-2"></i>
                My Reports
            </h1>
            <a href="/challenge/operator" class="mb-4 inline-block px-4 py-2 bg-slate-600 hover:bg-slate-700 rounded-lg text-white transition-all">Back to Dashboard</a>
            <div class="overflow-x-auto mt-4">
                <table class="min-w-full bg-slate-900 border border-slate-700 rounded-lg">
                    <thead>
                        <tr class="bg-slate-800 text-orange-400">
                            <th class="px-4 py-2">Infrastructure</th>
                            <th class="px-4 py-2">Description</th>
                            <th class="px-4 py-2">Photo</th>
                            <th class="px-4 py-2">Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($reports as $r): ?>
                        <tr class="border-b border-slate-700">
                            <td class="px-4 py-2"><?= htmlspecialchars($r['infra_name']) ?></td>
                            <td class="px-4 py-2"><?= htmlspecialchars($r['description']) ?></td>
                            <td class="px-4 py-2">
                                <?php if ($r['photo_path']): ?>
                                    <a href="/challenge/uploads/<?= htmlspecialchars($r['photo_path']) ?>" target="_blank" class="text-blue-400 underline">View</a>
                                <?php else: ?>
                                    -
                                <?php endif; ?>
                            </td>
                            <td class="px-4 py-2"><?= htmlspecialchars($r['created_at']) ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <script src="/challenge/public/js/particles.js"></script>
</body>
</html> 