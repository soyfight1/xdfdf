// Initialize Lucide icons
lucide.createIcons();

// Create water-themed animated background
function createWaterParticles() {
    const particlesContainer = document.getElementById('waterParticles');
    for (let i = 0; i < 20; i++) {
        const particle = document.createElement('div');
        particle.className = 'water-drop';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.animationDuration = (6 + Math.random() * 4) + 's';
        particlesContainer.appendChild(particle);
    }
}

// Initialize water particles
createWaterParticles();