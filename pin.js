async function generatePinOnLoad() {
  try {
      const response = await fetch('/challenge/graphql', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
          },
          body: JSON.stringify({
              query: `
                query {
                  generatePin { success message }
                }
              `
          })
      });
      const result = await response.json();
      const genResult = result.data.generatePin;
      if (genResult && genResult.success) {
      } else {
      }
  } catch (error) {
  }
}

// async function loadDebugInfo() {
//   try {
//       const response = await fetch('/challenge/graphql', {
//           method: 'POST',
//           headers: {
//               'Content-Type': 'application/json',
//           },
//           body: JSON.stringify({
//               query: `
//                 query {
//                   getControlRoomPin
//                 }
//               `
//           })
//       });
//       const result = await response.json();
//       const pin = result.data.getControlRoomPin;
//       if (pin) {
//           document.getElementById('debugPin').textContent = pin;
//       } else {
//           document.getElementById('debugPin').textContent = 'ERROR';
//       }
//   } catch (error) {
//       document.getElementById('debugPin').textContent = 'UNAVAILABLE';
//   }
// }

// On page load, generate PIN then fetch and display it
(async () => {
  await generatePinOnLoad();
  // await loadDebugInfo();
})();

// PIN form submission
document.getElementById('pinForm').addEventListener('submit', async (e) => {
  e.preventDefault();
  
  const pin = document.getElementById('securityPin').value;
  
  if (pin.length !== 4) {
      showError('PIN must be exactly 4 digits');
      return;
  }
  
  try {
      const response = await fetch('/challenge/graphql', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
          },
          body: JSON.stringify({
              query: `
                mutation {
                  verifyAccessPin(pin: "${pin}") {
                    success
                    message
                    authorized
                  }
                }
              `
          })
      });
      
      const result = await response.json();
      
      if (result.data.verifyAccessPin.authorized) {
          // Redirect to control room
          window.location.href = '/challenge/control-room';
      } else {
          showError(result.data.verifyAccessPin.message);
      }
  } catch (error) {
      showError('System error. Please try again.');
  }
});

function showError(message) {
  const errorDiv = document.getElementById('errorMessage');
  errorDiv.querySelector('.text-red-400').textContent = `❌ ${message}`;
  errorDiv.classList.remove('hidden');
  
  setTimeout(() => {
      errorDiv.classList.add('hidden');
  }, 3000);
}

function goBack() {
  window.location.href = '/challenge/';
}