class OperatorDashboard {
  constructor() {
    this.infrastructureData = [];
    this.charts = {};
    this.init();
  }

  init() {
    this.loadInfrastructureData();
    this.loadAnalytics();
  }

  async loadInfrastructureData() {
    try {
      const response = await fetch('/challenge/api/infrastructure');
      if (response.status === 401) {
        window.location.href = '/login';
        return;
      }
      if (!response.ok) {
        throw new Error('Failed to load infrastructure data');
      }
      this.infrastructureData = await response.json();
    } catch (error) {
      console.error('Error loading infrastructure data:', error);
    }
  }

  async loadAnalytics() {
    try {
      const response = await fetch('/challenge/api/infrastructure');
      if (response.status === 401) {
        window.location.href = '/login';
        return;
      }
      if (!response.ok) {
        throw new Error('Failed to load analytics data');
      }
      const data = await response.json();
      this.updateAnalyticsSummary(data);
      this.renderAnalyticsCharts(data);
    } catch (error) {
      console.error('Error loading analytics:', error);
      this.renderDummyAnalytics();
    }
  }

  updateAnalyticsSummary(data) {
    const totalSystems = data.length;
    const operationalSystems = data.filter(item => item.status === 'operational').length;
    const averageUptime = totalSystems > 0 ? 
      (data.reduce((sum, item) => sum + item.uptime, 0) / totalSystems) : 0;
    const systemHealth = totalSystems > 0 ? ((operationalSystems / totalSystems) * 100) : 0;

    document.getElementById('operator-system-health').textContent = systemHealth.toFixed(1) + '%';
    document.getElementById('operator-total-systems').textContent = totalSystems;
    document.getElementById('operator-operational-systems').textContent = operationalSystems;
    document.getElementById('operator-avg-uptime').textContent = averageUptime.toFixed(2) + '%';
  }

  renderAnalyticsCharts(data) {
    this.renderOperatorStatusChart(data);
    this.renderOperatorPerformanceChart(data);
    this.renderOperatorTypeChart(data);
  }

  renderDummyAnalytics() {
    document.getElementById('operator-system-health').textContent = '88.9%';
    document.getElementById('operator-total-systems').textContent = '8';
    document.getElementById('operator-operational-systems').textContent = '7';
    document.getElementById('operator-avg-uptime').textContent = '96.2%';
    this.renderDummyCharts();
  }

  renderOperatorStatusChart(data) {
    const ctx = document.getElementById('operatorStatusChart');
    if (!ctx) return;
    if (this.charts.operatorStatus) {
      this.charts.operatorStatus.destroy();
    }
    const statusCounts = {};
    data.forEach(item => {
      statusCounts[item.status] = (statusCounts[item.status] || 0) + 1;
    });
    const labels = Object.keys(statusCounts);
    const values = Object.values(statusCounts);
    const colors = labels.map(status => {
      switch(status) {
        case 'operational': return '#22c55e';
        case 'maintenance': return '#f59e0b';
        case 'error': return '#ef4444';
        default: return '#6b7280';
      }
    });
    this.charts.operatorStatus = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: labels.map(l => l.charAt(0).toUpperCase() + l.slice(1)),
        datasets: [{
          data: values,
          backgroundColor: colors,
          borderColor: colors.map(c => c + '80'),
          borderWidth: 2
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              color: '#e2e8f0',
              font: { size: 12 }
            }
          }
        }
      }
    });
  }

  renderOperatorPerformanceChart(data) {
    const ctx = document.getElementById('operatorPerformanceChart');
    if (!ctx) return;
    if (this.charts.operatorPerformance) {
      this.charts.operatorPerformance.destroy();
    }
    const typeGroups = {};
    data.forEach(item => {
      if (!typeGroups[item.type]) {
        typeGroups[item.type] = { items: [], total: 0 };
      }
      typeGroups[item.type].items.push(item.uptime);
      typeGroups[item.type].total += item.uptime;
    });
    const labels = Object.keys(typeGroups);
    const avgData = Object.values(typeGroups).map(group => 
      (group.total / group.items.length).toFixed(2)
    );
    const minData = Object.values(typeGroups).map(group => 
      Math.min(...group.items).toFixed(2)
    );
    const maxData = Object.values(typeGroups).map(group => 
      Math.max(...group.items).toFixed(2)
    );
    this.charts.operatorPerformance = new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [
          {
            label: 'Avg Uptime',
            data: avgData,
            borderColor: '#6366f1',
            backgroundColor: '#6366f1',
            fill: false,
            tension: 0.4
          },
          {
            label: 'Min Uptime',
            data: minData,
            borderColor: '#f59e0b',
            backgroundColor: '#f59e0b',
            fill: false,
            tension: 0.4
          },
          {
            label: 'Max Uptime',
            data: maxData,
            borderColor: '#22c55e',
            backgroundColor: '#22c55e',
            fill: false,
            tension: 0.4
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              color: '#e2e8f0',
              font: { size: 12 }
            }
          }
        }
      }
    });
  }

  renderOperatorTypeChart(data) {
    const ctx = document.getElementById('operatorTypeChart');
    if (!ctx) return;
    if (this.charts.operatorType) {
      this.charts.operatorType.destroy();
    }
    const typeCounts = {};
    data.forEach(item => {
      typeCounts[item.type] = (typeCounts[item.type] || 0) + 1;
    });
    const labels = Object.keys(typeCounts);
    const values = Object.values(typeCounts);
    const colors = ['#6366f1','#f59e0b','#22c55e','#ef4444','#a21caf','#eab308'];
    this.charts.operatorType = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Count',
          data: values,
          backgroundColor: colors.slice(0, labels.length),
          borderColor: colors.slice(0, labels.length),
          borderWidth: 2
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          }
        }
      }
    });
  }

  renderDummyCharts() {
    this.renderOperatorStatusChart([
      {status:'operational'}, {status:'operational'}, {status:'maintenance'}, {status:'error'}
    ]);
    this.renderOperatorPerformanceChart([
      {type:'power',uptime:98.9}, {type:'water',uptime:94.9}, {type:'network',uptime:98.4}
    ]);
    this.renderOperatorTypeChart([
      {type:'power'},{type:'water'},{type:'network'}
    ]);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  new OperatorDashboard();
}); 