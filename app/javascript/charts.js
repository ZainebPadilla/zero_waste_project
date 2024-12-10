import Chart from 'chart.js/auto';
document.addEventListener('DOMContentLoaded', () => {
    const wasteChartData = JSON.parse(document.getElementById('wasteChart').dataset.waste);
    new Chart(document.getElementById('wasteChart'), {
      type: 'pie',
      data: {
        labels: wasteChartData.labels,
        datasets: [{
          label: 'Quantité Gaspillée (kg)',
          data: wasteChartData.values,
          backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'],
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'bottom',
          }
        }
      }
    });
  });