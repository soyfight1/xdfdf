let waterSystems = [];

// GraphQL query helper
async function graphqlQuery(query, variables = {}) {
    try {
        const response = await fetch('/challenge/graphql', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                query: query,
                variables: variables
            })
        });
        
        const result = await response.json();
        if (result.errors) {
            throw new Error(result.errors[0].message);
        }
        return result.data;
    } catch (error) {
        logActivity(`[ERROR] Query failed: ${error.message}`, 'error');
        throw error;
    }
}

// Load water systems on page load
async function loadWaterSystems() {
    try {
        const data = await graphqlQuery(`
            query {
                waterSystems {
                    id
                    name
                    type
                    status
                    capacity
                    currentLevel
                    location
                }
                systemStatus {
                    totalSystems
                    onlineSystems
                    criticalSystems
                    totalCapacity
                    currentWaterLevel
                    emergencyStatus
                }
            }
        `);

        waterSystems = data.waterSystems;
        displayWaterSystems(data.waterSystems);
        updateSystemMetrics(data.systemStatus);
        
        logActivity(`[DATA] Loaded ${data.waterSystems.length} water systems`, 'info');
    } catch (error) {
        logActivity(`[ERROR] Failed to load water systems: ${error.message}`, 'error');
    }
}

// Display water systems with improved layout
function displayWaterSystems(systems) {
    const grid = document.getElementById('waterSystemsGrid');
    grid.innerHTML = '';

    systems.forEach(system => {
        const systemCard = document.createElement('div');
        systemCard.className = 'hydro-card system-card p-4 rounded-lg';
        
        const statusClass = getStatusClass(system.status);
        const levelPercentage = Math.round((system.currentLevel / system.capacity) * 100);
        const levelClass = getLevelClass(levelPercentage);
        
        // Format status text for better display
        const statusText = system.status.replace(/_/g, ' ').toUpperCase();
        
        // Truncate location if too long
        const locationDisplay = system.location.length > 20 
            ? system.location.substring(0, 17) + '...' 
            : system.location;
        
        systemCard.innerHTML = `
            <div class="system-card-header">
                <div class="flex items-start">
                    <i data-lucide="${getSystemIcon(system.type)}" class="w-4 h-4 mr-2 text-blue-400 flex-shrink-0 mt-1"></i>
                    <span class="system-name text-xs font-bold">${system.name}</span>
                </div>
                <span class="system-status ${statusClass}">${statusText}</span>
            </div>
            
            <div class="system-details">
                <div class="detail-row text-xs">
                    <span class="detail-label">Type:</span>
                    <span class="detail-value">${system.type}</span>
                </div>
                <div class="detail-row text-xs">
                    <span class="detail-label">Location:</span>
                    <span class="detail-value location-text" title="${system.location}">${locationDisplay}</span>
                </div>
                <div class="detail-row text-xs">
                    <span class="detail-label">Water Level:</span>
                    <span class="detail-value">${levelPercentage}%</span>
                </div>
                <div class="water-level-bar mt-2">
                    <div class="water-level-fill ${levelClass}" style="width: ${levelPercentage}%"></div>
                </div>
                <div class="text-xs text-slate-400 mt-2 text-center">
                    ${formatNumber(system.currentLevel)}L / ${formatNumber(system.capacity)}L
                </div>
            </div>
        `;
        
        grid.appendChild(systemCard);
    });
    
    // Re-initialize Lucide icons
    lucide.createIcons();
}

// Format numbers for better readability
function formatNumber(num) {
    if (num >= 1000) {
        return (num / 1000).toFixed(0) + 'k';
    }
    return num.toLocaleString();
}

// Update system metrics
function updateSystemMetrics(status) {
    document.getElementById('totalCapacity').textContent = `${(status.totalCapacity / 1000).toFixed(0)}kL`;
    document.getElementById('availableWater').textContent = `${(status.currentWaterLevel / 1000).toFixed(0)}kL`;
    document.getElementById('systemsOnline').textContent = `${status.onlineSystems}/${status.totalSystems}`;
    document.getElementById('emergencyStatus').textContent = status.emergencyStatus;
    
}

// Helper functions
function getStatusClass(status) {
    if (status.includes('critical') || status.includes('failure')) return 'status-critical';
    if (status.includes('emergency')) return 'status-emergency';
    if (status.includes('offline') || status.includes('sealed')) return 'status-offline';
    if (status === 'online') return 'status-online';
    return 'status-warning';
}

function getLevelClass(percentage) {
    if (percentage <= 10) return 'level-critical';
    if (percentage <= 30) return 'level-low';
    if (percentage <= 60) return 'level-medium';
    if (percentage <= 90) return 'level-good';
    return 'level-full';
}

function getSystemIcon(type) {
    const icons = {
        'reservoir': 'database',
        'treatment': 'filter',
        'distribution': 'share-2',
        'pumping': 'zap',
        'reserve': 'shield',
        'pipeline': 'git-branch'
    };
    return icons[type] || 'droplets';
}

// Show control room
function showControlRoom() {
    logActivity('[SYSTEM] Redirecting to control room...', 'info');
    window.location.href = '/challenge/control-room';
}

// Run system diagnostics
async function runSystemDiagnostics() {
    logActivity('[DIAGNOSTICS] Initiating comprehensive water system analysis...', 'info');
    logActivity('[DIAGNOSTICS] Scanning reservoir security locks...', 'info');
    logActivity('[DIAGNOSTICS] Checking treatment plant status...', 'info');
    logActivity('[DIAGNOSTICS] Analyzing distribution network...', 'info');
    
    try {
        const data = await graphqlQuery(`
            query {
                systemHealth
                systemStatus {
                    emergencyStatus
                    criticalSystems
                    totalSystems
                }
            }
        `);
        
        setTimeout(() => {
            logActivity(`[DIAGNOSTICS] System health: ${data.systemHealth}`, 'warning');
            logActivity(`[DIAGNOSTICS] Critical systems: ${data.systemStatus.criticalSystems}/${data.systemStatus.totalSystems}`, 'error');
            logActivity('[DIAGNOSTICS] All systems require authorized access', 'warning');
            logActivity('[RECOMMENDATION] Access control room for system management', 'info');
        }, 2000);
        
    } catch (error) {
        logActivity(`[ERROR] Diagnostics failed: ${error.message}`, 'error');
    }
}

// Clear activity log
function clearLog() {
    const log = document.getElementById('activityLog');
    log.innerHTML = '<div class="text-slate-500">$ Terminal cleared - Ready for new commands...</div>';
}

// Log activity function
function logActivity(message, type = 'info') {
    const log = document.getElementById('activityLog');
    const timestamp = new Date().toLocaleTimeString('en-US', { hour12: false });
    
    let className = 'text-slate-300';
    switch(type) {
        case 'success':
            className = 'text-green-400';
            break;
        case 'error':
            className = 'text-red-400';
            break;
        case 'warning':
            className = 'text-yellow-400';
            break;
        case 'info':
            className = 'text-blue-400';
            break;
    }
    
    const logEntry = document.createElement('div');
    logEntry.className = `${className} mb-1`;
    logEntry.innerHTML = `[${timestamp}] ${message}`;
    
    // Remove cursor if it exists
    const cursor = log.querySelector('.text-slate-500:last-child');
    if (cursor && cursor.textContent.includes('$')) {
        cursor.remove();
    }
    
    log.appendChild(logEntry);
    
    // Add new cursor
    const newCursor = document.createElement('div');
    newCursor.className = 'text-slate-500';
    newCursor.innerHTML = '$ _';
    log.appendChild(newCursor);
    
    log.scrollTop = log.scrollHeight;
}

// Load water systems when page loads
loadWaterSystems();