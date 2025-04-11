<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .payment-form {
            background-color: #fff;
            padding: 35px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            box-sizing: border-box;
        }

        .payment-form h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .payment-methods {
            margin-bottom: 20px;
        }

        .payment-methods input[type="radio"] {
            margin-right: 10px;
            cursor: pointer;
        }

        .payment-methods label {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            cursor: pointer;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            transition: background-color 0.2s, border-color 0.2s;
        }

        .payment-methods label span {
            flex-grow: 1;
            text-align: left;
        }

        .payment-methods label:hover {
            background-color: #f0f0f0;
            border-color: #999;
        }

        .payment-methods input[type="radio"]:checked + img {
            border-color: #4CAF50;
        }

        .payment-icon {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }

        .form-group {
            margin-bottom: 15px;
            display: none; /* Initially hide all form groups */
            flex-wrap: wrap;
            gap: 15px;
        }

        .form-group.active {
            display: flex; /* Display only active form group */
        }

        .form-group input {
            flex: 1 1 100%; /* Each input takes full width of the form-group */
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .returntocart {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            margin-top: 10px;
            display: block;
            transition: background-color 0.3s;
            text-transform: uppercase;
            text-decoration:none;
        }

        .returntocart:hover {
            background-color: #45a049;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 200px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .success-icon,
        .error-icon {
            width: 50px;
            height: 50px;
            margin-bottom: 20px;
        }

        .success-message {
            color: green;
        }

        .error-message {
            color: red;
        }

        .button {
            display: block;
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }

        .success-button {
            background-color: #4CAF50;
            color: white;
        }

        .error-button {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="payment-form">
        <h2>Payment Methods</h2>
        <form id="paymentForm" action="index.jsp" method="POST" novalidate>
            <div class="payment-methods">
                <label for="debit-card">
                    <input type="radio" id="debit-card" name="payment_method" value="debit-card" checked>
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4AbVvS132apa5RS3XVm1e7KT91_QW0eawBg&s" alt="Debit card" class="payment-icon"> 
                    <span>Debit Card</span>
                </label>
                <label for="paypal">
                    <input type="radio" id="paypal" name="payment_method" value="paypal">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR0hotUhX7ZR4FQit77BChfSk8apdjuIJIdQ&s" alt="PayPal" class="payment-icon"> 
                    <span>PayPal</span>
                </label>
                <label for="credit-card">
                    <input type="radio" id="credit-card" name="payment_method" value="credit-card">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyhXX3CQzbDrMn80ZAFzxp2Qa1JVr7-j_8HA&s" alt="Credit card" class="payment-icon"> 
                    <span>Credit Card</span>
                </label>
                <label for="upi">
                    <input type="radio" id="upi" name="payment_method" value="upi">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzNi6J3NL8AE7tufKZGVER0OrOsadL9xc9zg&s" alt="UPI" class="payment-icon"> 
                    <span>UPI</span>
                </label>
            </div>

            <div id="debit-card-form" class="form-group active">
                <input type="text" id="debit_card_number" name="debit_card_number" placeholder="Debit Card Number" pattern="\d{16}" title="Debit card number must be 16 digits" required>
                <div id="debit_card_number_error" class="error"></div>
                <input type="password" id="debit_card_cvc" name="debit_card_cvc" placeholder="Security Code" pattern="\d{3}" title="Security code must be 3 digits" required>
                <div id="debit_card_cvc_error" class="error"></div>
                <input type="date" id="debit_card_exp_month" name="debit_card_exp_month" required>
                <div id="debit_card_exp_month_error" class="error"></div>
            </div>

            <div id="paypal-form" class="form-group">
                <input type="email" id="paypal_email" name="paypal_email" placeholder="PayPal Email" required>
                <div id="paypal_email_error" class="error"></div>
            </div>

            <div id="credit-card-form" class="form-group">
                <input type="text" id="credit_card_number" name="credit_card_number" placeholder="Credit Card Number" pattern="\d{16}" title="Credit card number must be 16 digits" required>
                <div id="credit_card_number_error" class="error"></div>
                <input type="password" id="credit_card_cvc" name="credit_card_cvc" placeholder="Security Code" pattern="\d{3}" title="Security code must be 3 digits" required>
                <div id="credit_card_cvc_error" class="error"></div>
                <input type="date" id="credit_card_exp_month" name="credit_card_exp_month" required>
                <div id="credit_card_exp_month_error" class="error"></div>
            </div>

            <div id="upi-form" class="form-group">
                <input type="text" id="upi_id" name="upi_id" placeholder="UPI ID" required>
                <div id="upi_id_error" class="error"></div>
            </div>

            <button type="submit" onclick="return validateForm()" class="returntocart">SUBMIT PAYMENT</button>
            <a href="cart.jsp" class="returntocart">Return to Cart</a>
        </form>
    </div>

    <div id="successModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('successModal')">&times;</span>
            <p class="success-message">Payment Successful!</p>
            <a href="index.jsp" class="button success-button">Continue</a>
        </div>
    </div>

    <div id="errorModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('errorModal')">&times;</span>
            <p class="error-message">Oops!!</p>
            <a href="payment.jsp" class="button error-button">Try Again</a>
        </div>
    </div>

    <script>
        document.querySelectorAll('.payment-methods input[type="radio"]').forEach(radio => {
            radio.addEventListener('change', function() {
                document.querySelectorAll('.form-group').forEach(group => {
                    group.classList.remove('active');
                });
                document.getElementById(this.value + '-form').classList.add('active');
            });
        });

        function validateForm() {
            let isValid = true;

            if (document.getElementById('debit-card').checked) {
                const debitCardNumber = document.getElementById('debit_card_number').value;
                const debitCardCVC = document.getElementById('debit_card_cvc').value;
                const debitCardExpMonth = document.getElementById('debit_card_exp_month').value;

                if (!/^\d{16}$/.test(debitCardNumber)) {
                    isValid = false;
                    document.getElementById('debit_card_number_error').textContent = 'Debit card number must be 16 digits';
                } else {
                    document.getElementById('debit_card_number_error').textContent = '';
                }

                if (!/^\d{3}$/.test(debitCardCVC)) {
                    isValid = false;
                    document.getElementById('debit_card_cvc_error').textContent = 'Security code must be 3 digits';
                } else {
                    document.getElementById('debit_card_cvc_error').textContent = '';
                }

                if (!debitCardExpMonth) {
                    isValid = false;
                    document.getElementById('debit_card_exp_month_error').textContent = 'Expiration month is required';
                } else {
                    document.getElementById('debit_card_exp_month_error').textContent = '';
                }
            } else if (document.getElementById('paypal').checked) {
                const paypalEmail = document.getElementById('paypal_email').value;

                if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(paypalEmail)) {
                    isValid = false;
                    document.getElementById('paypal_email_error').textContent = 'Invalid email address';
                } else {
                    document.getElementById('paypal_email_error').textContent = '';
                }
            } else if (document.getElementById('credit-card').checked) {
                const creditCardNumber = document.getElementById('credit_card_number').value;
                const creditCardCVC = document.getElementById('credit_card_cvc').value;
                const creditCardExpMonth = document.getElementById('credit_card_exp_month').value;

                if (!/^\d{16}$/.test(creditCardNumber)) {
                    isValid = false;
                    document.getElementById('credit_card_number_error').textContent = 'Credit card number must be 16 digits';
                } else {
                    document.getElementById('credit_card_number_error').textContent = '';
                }

                if (!/^\d{3}$/.test(creditCardCVC)) {
                    isValid = false;
                    document.getElementById('credit_card_cvc_error').textContent = 'Security code must be 3 digits';
                } else {
                    document.getElementById('credit_card_cvc_error').textContent = '';
                }

                if (!creditCardExpMonth) {
                    isValid = false;
                    document.getElementById('credit_card_exp_month_error').textContent = 'Expiration month is required';
                } else {
                    document.getElementById('credit_card_exp_month_error').textContent = '';
                }
            } else if (document.getElementById('upi').checked) {
                const upiID = document.getElementById('upi_id').value;

                if (!upiID) {
                    isValid = false;
                    document.getElementById('upi_id_error').textContent = 'UPI ID is required';
                } else {
                    document.getElementById('upi_id_error').textContent = '';
                }
            }

            if (isValid) {
                showModal('successModal');
            } else {
                showModal('errorModal');
            }

            return false;
        }

        function showModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }
    </script>
</body>
</html>