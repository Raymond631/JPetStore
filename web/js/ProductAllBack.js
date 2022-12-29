let ctx1 = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx1, {
    type: 'line',
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        datasets: [{
            label: 'profit',
            data: [8000, 10000, 7000, 4000, 9000, 7000, 4000, 8000, 11000, 7000, 9000, 5000],
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

let ctx2 = document.getElementById("myDoughnutChart").getContext('2d');
var myDoughnutChart = new Chart(ctx2, {
    type: "doughnut",
    data: {
        datasets: [
            {

                data: [500, 430, 320, 190, 110],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)'
                ],
            }
        ],

        // These labels appear in the legend and in the tooltips when hovering different arcs
        labels: ["Cats", "Dogs", "Fish", "Birds", "Reptiles"]
    },

});
