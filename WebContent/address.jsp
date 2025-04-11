<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Page</title>
<link rel="stylesheet" href="style.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        max-width: 800px;
        margin: 20px auto;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    .header {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 20px;
    }

    .progress-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }

    .step {
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
        margin: 0 10px;
    }

    .bullet {
        width: 30px;
        height: 30px;
        background-color: #ccc;
        color: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 16px;
    }

    .step.active .bullet {
        background-color: #149253;
    }

    .label {
        margin-top: 5px;
        font-size: 14px;
    }

    .step:not(:last-child)::after {
        content: '';
        position: absolute;
        width: 50px;
        height: 2px;
        background-color: #ccc;
        top: 15px;
        left: 100%;
        z-index: -1;
    }

    .step.active:not(:last-child)::after {
        background-color: #149253;
    }

    .left-section {
        width: 100%;
        padding: 0 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="text"],
    select {
        width: calc(100% - 20px);
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .checkout-button,
    .returntocart {
        background-color: #48ae57;
        color: #ffffff;
        padding: 15px 20px;
        border: none;
        cursor: pointer;
        font-size: 18px;
        text-transform: uppercase;
        width: 100%;
        margin-top: 20px;
        display: block;
        text-align: center;
    }

    .returntocart {
        background: #48ae57;
        color: #ffffff;
        margin-top: 10px;
        text-decoration: underline;
    }

    .checkout-button:hover,
    .returntocart:hover {
        background-color: #3d8c4a;
    }

    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 5px;
    }

    .invalid {
        border-color: red;
    }

    @media (max-width: 768px) {
        .container {
            padding: 10px;
        }

        .left-section {
            width: 100%;
        }

        input[type="text"],
        select {
            width: 100%;
        }
    }
</style>
</head>
<body style = "background-color: #fff6f4">
    <div class="header">
        <img src="includes/css/logo1.jpg" alt="Logo" style="width: 150px; height: auto; margin-bottom: 20px;">
        <div class="progress-bar">
            <div class="step" id="step1">
                <div class="bullet">1</div>
                <div class="label">Cart</div>
            </div>
            <div class="step active" id="step2">
                <div class="bullet">2</div>
                <div class="label">Address</div>
            </div>
            <div class="step" id="step3">
                <div class="bullet">3</div>
                <div class="label">Payment</div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="left-section">
            <h2>Shipping address</h2>
            <form id="shippingForm" action="DemoServlet" method="post">
                <div class="form-group">
                    <label for="firstName">First name</label>
                    <input type="text" id="firstName" name="firstName" required>
                    <p class="error-message" id="firstName-error"></p>
                </div>
                <div class="form-group">
                    <label for="lastName">Last name</label>
                    <input type="text" id="lastName" name="lastName" required>
                    <p class="error-message" id="lastName-error"></p>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                    <p class="error-message" id="address-error"></p>
                </div>
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" required>
                    <p class="error-message" id="city-error"></p>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <select id="state" name="state" required>
                        <option value="">Select State</option>
                        <option value="TS">Telangana</option>
                        <option value="AP">Andhra Pradesh</option>
                        <option value="KL">Kerela</option>
                        <option value="TN">Tamil Nadu</option>
                        <option value="MH">Maharashtra</option>
                        <option value="KT">Karnataka</option>
                    </select>
                    <p class="error-message" id="state-error"></p>
                </div>
                <div class="form-group">
                    <div class="pincode-checker">
                        <label for="pincode">Pincode</label>
                        <input type="text" id="pincode" placeholder="Enter pincode to check delivery">
                    </div>
                    <p id="pincode-error" class="error-message"></p>
                </div>
    
                <button type="submit" class="checkout-button">CONTINUE TO PAYMENT</button>
            </form>
            <a href="cart.jsp"><button type="button" class="returntocart">RETURN TO CART</button></a>
        </div>
    </div>

    <script>
        function validateName(name) {
            const namePattern = /^[a-zA-Z ]+$/;
            return namePattern.test(name);
        }

        function validateAddress(address) {
            const addressPattern = /^[a-zA-Z0-9\s,'-]*$/;
            return addressPattern.test(address);
        }

        function validateCity(city) {
            const cityPattern = /^[a-zA-Z\s]+$/;
            return cityPattern.test(city);
        }

        function validatePincode() {
            const pincode = document.getElementById('pincode').value;
            const pincodePattern = /^[0-9]{6}$/;
            const errorMessage = document.getElementById('pincode-error');
            if (!pincodePattern.test(pincode)) {
                errorMessage.textContent = 'Sorry, this pincode is not serviceable yet!';
                errorMessage.classList.add('error-message');
                return false;
            }
            errorMessage.textContent = '';
            errorMessage.classList.remove('error-message');
            return true;
        }

        document.querySelector('#shippingForm').addEventListener('submit', function(e) {
            e.preventDefault();
            let isFormValid = true;

            // Validate name fields
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            if (!validateName(firstName)) {
                document.getElementById('firstName-error').textContent = 'First name should not contain numbers.';
                document.getElementById('firstName').classList.add('invalid');
                isFormValid = false;
            } else {
                document.getElementById('firstName-error').textContent = '';
                document.getElementById('firstName').classList.remove('invalid');
            }
            if (!validateName(lastName)) {
                document.getElementById('lastName-error').textContent = 'Last name should not contain numbers.';
                document.getElementById('lastName').classList.add('invalid');
                isFormValid = false;
            } else {
                document.getElementById('lastName-error').textContent = '';
                document.getElementById('lastName').classList.remove('invalid');
            }

            // Validate address field
            const address = document.getElementById('address').value;
            if (!validateAddress(address)) {
                document.getElementById('address-error').textContent = 'Address should not contain special characters.';
                document.getElementById('address').classList.add('invalid');
                isFormValid = false;
            } else {
                document.getElementById('address-error').textContent = '';
                document.getElementById('address').classList.remove('invalid');
            }

            // Validate city field
            const city = document.getElementById('city').value;
            if (!validateCity(city)) {
                document.getElementById('city-error').textContent = 'City should not contain numbers.';
                document.getElementById('city').classList.add('invalid');
                isFormValid = false;
            } else {
                document.getElementById('city-error').textContent = '';
                document.getElementById('city').classList.remove('invalid');
            }

            // Validate pincode
            if (!validatePincode()) {
                isFormValid = false;
            }

            if (isFormValid) {
                window.location.href = 'payment.jsp'; // Redirect to payment page
            }
        });
    </script>
</body>
</html>