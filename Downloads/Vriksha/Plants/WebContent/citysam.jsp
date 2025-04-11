<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file = "/includes/headJSP/head.jsp"%>
   
    <style>
        /* Additional CSS for city selection */
       .city-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
       .city-box {
            margin: 20px;
            text-align: center;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            width: 270px;
            height: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
       .city-box img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }
       .city-link {
            text-decoration: none;
            color: #337ab7;
        }
       .city-link:hover {
            color: #23527c;
        }
    </style>
</head>
<body>

     
        <section class="main-content">
            <div class="city-container">
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/banglore.png">
                    <a href="#" class="city-link" data-city="Bangalore">Bangalore</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/hydrabaad.png">
                    <a href="#" class="city-link" data-city="Hyderabad">Hyderabad</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/delhi.png">
                    <a href="#" class="city-link" data-city="Delhi">Delhi</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/pune.png">
                    <a href="#" class="city-link" data-city="Pune">Pune</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/chennai.png">
                    <a href="#" class="city-link" data-city="Chennai">Chennai</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/mumbai.png">
                    <a href="#" class="city-link" data-city="Mumbai">Mumbai</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/jaipur.png">
                    <a href="#" class="city-link" data-city="Jaipur">Jaipur</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/patna.png">
                    <a href="#" class="city-link" data-city="Patna">Patna</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/kolkata.png">
                    <a href="#" class="city-link" data-city="Kolkata">Kolkata</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/lucknow.png">
                    <a href="#" class="city-link" data-city="Lucknow">Luchnow</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/gurgaon.png">
                    <a href="#" class="city-link" data-city="Gurgaon">Gurgaon</a>
                </div>
                <div class="city-box">
                    <img src="https://assets.winni.in/groot/2021/12/15/citypageicons/desktop/ahmedabaad.png">
                    <a href="#" class="city-link" data-city="Ahmedabad">Ahmedabad</a>
                </div>
                <!-- Add more city boxes as needed -->
            </div>
        </section>

       

        <script>
            // JavaScript code for city selection
            document.addEventListener('DOMContentLoaded', function() {
                const cityLinks = document.querySelectorAll('.city-link');
                cityLinks.forEach(cityLink => {
                    cityLink.addEventListener('click', function(event) {
                        event.preventDefault(); // Prevent default link behavior

                        // Get the selected city name
                        const selectedCity = this.dataset.city;

                        // Store selected city in localStorage
                        localStorage.setItem('selectedCity', selectedCity);

                        // Redirect to home.jsp
                        window.location.href = 'index.jsp';
                    });
                });
            });
        </script>
    </body>
</html>