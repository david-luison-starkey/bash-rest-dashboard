// Function to fetch and display JSON data
const fetchData = async () => {
  const dataContainer = document.getElementById('data-container');
  try {
    const response = await fetch('/api/v1/data');
    const data = await response.json();
    console.log(data.humidity);

    dataContainer.innerHTML = `${data.humidity}`;
  } catch (error) {
    console.error('Error fetching data:', error);
  }
};

