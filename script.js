const wheel = document.getElementById("wheel");
const spinBtn = document.getElementById("spin-btn");
const finalValue = document.getElementById("final-value");

const rotationValues = [
  { minDegree: 0, maxDegree: 30, value: 50000 },
  { minDegree: 31, maxDegree: 90, value: 40000 },
  { minDegree: 91, maxDegree: 150, value: 100000 },
  { minDegree: 151, maxDegree: 210, value: 80000 },
  { minDegree: 211, maxDegree: 270, value: 70000 },
  { minDegree: 271, maxDegree: 330, value: 60000 },
  { minDegree: 331, maxDegree: 360, value: 50000 },
];

const data = [16, 16, 16, 16, 16, 16];
var pieColors = [
  "#3399FF",
  "#66B2FF",
  "#3399FF",
  "#66B2FF",
  "#3399FF",
  "#66B2FF",
];

let isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
let myChart = new Chart(wheel, {
  plugins: [ChartDataLabels],
  type: "pie",
  data: {
    labels: [40000, 50000, 60000, 70000, 80000, 100000],
    datasets: [
      {
        backgroundColor: pieColors,
        data: data,
      },
    ],
  },
  options: {
    responsive: true,
    animation: { duration: 0 },
    plugins: {
      tooltip: false,
      legend: {
        display: false,
      },
      datalabels: {
        color: "#ffffff",
        formatter: (_, context) => context.chart.data.labels[context.dataIndex],
        font: { size: isMobile ? 18 : 24 },
      },
    },
  },
});

const valueGenerator = (angleValue) => {
  for (let i of rotationValues) {
    let isMobile = window.innerWidth <= 768;

    if (angleValue >= i.minDegree && angleValue <= i.maxDegree) {
      let message = isMobile ? 
        `Selamat kamu mendapatkan uang<br>Rp ${i.value},-` : 
        `Selamat kamu mendapatkan uang Rp ${i.value},-`;
      finalValue.innerHTML = `<p>${message}</p>`;
      spinBtn.disabled = false;
      break;
    }
  }
};

let count = 0;
let resultValue = 101;
spinBtn.addEventListener("click", () => {
  spinBtn.disabled = true;
  finalValue.innerHTML = `<p>Good Luck!</p>`;
  let randomDegree = Math.floor(Math.random() * (355 - 0 + 1) + 0);
  let rotationInterval = window.setInterval(() => {
    myChart.options.rotation = myChart.options.rotation + resultValue;
    myChart.update();
    if (myChart.options.rotation >= 360) {
      count += 1;
      resultValue -= 5;
      myChart.options.rotation = 0;
    } else if (count > 15 && myChart.options.rotation == randomDegree) {
      valueGenerator(randomDegree);
      clearInterval(rotationInterval);
      count = 0;
      resultValue = 101;
    }
  }, 10);
});
