<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather Info</title>
     <link rel="stylesheet" href="style.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<style>
 * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Ubuntu", sans-serif;
    }

    body {
        display: flex;
        height: 100vh;
        align-items: center;
        justify-content: center;
        background: linear-gradient(to right, #952bff, #07121a);
        animation: gradientAnimation 5s infinite alternate;
    }

    @keyframes gradientAnimation {
        0% {
            background-position: 0% 50%;
        }
        100% {
            background-position: 100% 50%;
        }
    }

    .mainContainer {
        width: 25rem;
        height: auto;
        border-radius: 1rem;
        background: #fff;
        box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
        animation: fadeInAnimation 1s ease-in;
    }

    @keyframes fadeInAnimation {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .searchInput {
        width: 100%;
        display: flex;
        padding: 1rem 1rem;
        justify-content: center;
    }

    .searchInput input {
        width: 80%;
        height: 2.5rem;
        outline: none;
        font-size: 1rem;
        color: #525050;
        padding: 0.5rem 1rem;
        border-radius: 1.5rem;
        border: 2px solid #b3b3b3;
        transition: border-color 0.3s ease;
    }

    .searchInput input:focus {
        border-color: #3498db;
    }

    .searchInput button {
        width: 15%;
        height: 2.5rem;
        cursor: pointer;
        color: #fff;
        border-radius: 1.5rem;
        margin-left: 1rem;
        transition: background-color 0.3s ease;
        background-color: #3498db;
        border: none;
    }

    .searchInput button:hover {
        background-color: #2980b9;
    }

    .weatherIcon {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 1rem;
        animation: fadeInAnimation 1s ease-in;
    }

    .weatherIcon img {
        max-width: 100%;
        width: 8rem;
    }

    .weatherDetails .temp {
        font-size: 3rem;
        font-weight: bold;
        color: #2c3e50;
    }

    .cityDetails {
        color: #34495e;
        font-size: 2.5rem;
        text-align: center;
        margin-bottom: 0.5rem;
    }

    .cityDetails .desc {
        font-size: 1.5rem;
        font-weight: bold;
    }

    .cityDetails .date {
        font-size: 1.5rem;
        text-align: center;
        margin-bottom: 0.5rem;
    }

    .windDetails {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 1rem;
        margin-bottom: 1.5rem;
    }

    .windDetails .humidityBox {
        display: flex;
        font-size: 1rem;
        color: #34495e;
        align-items: center;
    }

    .windDetails .humidityBox img {
        max-height: 2rem;
        margin-right: 0.5rem;
    }

    .windDetails .humidity .humidityValue {
        text-align: center;
        font-size: 2rem;
        color: #34495e;
    }

    .windDetails .windSpeed {
        display: flex;
        font-size: 1rem;
        color: #34495e;
        align-items: center;
        margin-top: 0.5rem;
    }

    .windDetails .windSpeed img {
        max-height: 2rem;
        margin-right: 0.5rem;
    }

    .image-logo {
        height: auto;
        width: auto;
        filter: drop-shadow(20px 10px 10px black);
    }
</style>

<body>

    <div class="mainContainer">
    
     <form action="MyServlet" method="post" class="searchInput">
            <input type="text" placeholder="Enter City Name" id="searchInput"  name="city"/>
            <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
        <div class="weatherDetails">
            <div class="weatherIcon">
                <img src="" alt="Clouds" id="weather-icon">
                <h2>${temperature} °C</h2>
                 <input type="hidden" id="wc" value="${weatherCondition}"> </input>
            </div>
            
            <div class="cityDetails">        
                <div class="desc"><strong>${city}</strong></div>
                <div class="date" >${date}</div>
            </div>
            <div class="windDetails">
            	<div class="humidityBox">
            	<img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png" alt="Humidity">
                <div class="humidity">
                   <span>Humidity </span>
                   <h2>${humidity}% </h2>
                </div>
               </div> 
               
                <div class="windSpeed">
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png">
                    <div class="wind">
                    <span>Wind Speed</span>
                    <h2> ${windSpeed} km/h</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
	var weatherIcon = document.getElementById("weather-icon");
	
	
	var val = document.getElementById("wc").value;
	  switch (val) {
      case 'Clouds':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwFTkt5z_dxU6w1UnS1PxiZV3HDiPGsAW5Lrsp09MnlCmkQre9GzO8MnGytaaY1eZoqBN6SMJ4U578_uDtiuXswovr1T3o-Kt5KK0mlN_zC0RDodJFaKHQ3Uk-HIZ3vuMvAKNJi8DDFwWA7F6BOxz78Oh-UePwJTuc3PG0ZIZypPE1xlMPl5z46joaEw/s320/Clouds.png";
          break;
      case 'Clear':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7pmzNCftryAfpa1YBSzVeYtjgxDQnw09Ug0HVV47J8GEtHPYTH9hJgZ2M1k0YgE0pcZ1qekr4C14zyPCiVuQAfXLClK8Ww3hYB6v77yElP7Lo5BnUKo4n-w6yB17FAbw51WST6YKS0GMwyA4fYNxOZxEyNL6HhUfFRgVhOW0GyRdBRriMHFQ-qfh4cA/s320/sun.png";
          break;
      case 'Rain':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgDW_NdwvxV796rkFf43qmUDiTQePn5dg7PDfn1SijfpjtB0AWJMBcifU6LWyW7iOtjZhfqIJnKEGQ1PwbbXS7NoKMSAmvy7i2ljWXMYLue3EBIBBR2qTFbs6QCe5eoFr2CU9WzCVJ8u0J3z3eAo3Ajv1LXamZASFtbj9sA_gD-Kp3hfgAk17Xh17RoLQ/s320/rainy.png";
          break;
      case 'Mist':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVpL23l0t1U_ibWi01TFcHMF6J_t-9Ada5PavGlwG4M_mKIcx0pV1md9SN9ip1d84NaVowml5Do16XO3nsuttnM2-Ov05d-wCjEYjdzaOYfKvijw8k6Hfj9pOiPyEZTp2W20EPbTeONTgJE2Rdxs4KZUfg6f2PmbMF1094NcqJ7DwSFUQwYiRmVCNvuA/s320/mist.png";
          break;
      case 'Snow':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-P3iT_uQK95qFY4h7QGdEtbRc1aVQo9BZy0ZWyPBvCNrP-4wnRStw0xYj9e4xa4ZlYISeNZqVJ33UP4YukR4jBennDD_obIN4QxYNZHdzG_z6_MNL2U08wMXwdFhtfvitW5LGiHgrwMJFC8QJFqbSO3woGSBqOdagGxaEQ20_S31Gc-GYL4vYzPzaPw/s320/snow.png";
          break;
      case 'Haze':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjld66Ia5g_hpBn3Impi3zzOBHqWkjQInGLxTb2uXksuCsrkQU8HjlVyLobEJEGg8fRSIxeFzldGEHUmWcaiZBwAcRy4dGDpFX1BjTSB56qmBjW5tEW3RSC9_mCuLU_a8RuXchxGY7Oc8HLLl-IfaDW19Z0ZJJfNae9tECXRIyEu7rmJ3da08z8cI-phw/s320/haze.png";
          break;
      
      case 'Fog' :
    	  weatherIcon.src = "https://png.pngtree.com/png-clipart/20230823/original/pngtree-daytime-foggy-weather-clouds-illustration-picture-image_8201381.png";
    	  break;
  }
	  </script>
	  
</body>

</html>