document.addEventListener('DOMContentLoaded', () => {
    const faqItems = document.querySelectorAll('.faq-item');
    const modal = document.getElementById('modal');
    const modalTitle = document.getElementById('modal-title');
    const modalText = document.getElementById('modal-text');
    const span = document.getElementsByClassName('close')[0];

    const content = {
        content1: {
            title: 'Need help purchasing at Vriksha?',
            text: '1. How to place an order at Vriksha?\nFirst of all, you have to register at Vriksha if you are a new customer. If you are an existing customer, then just login and select the Delivery city or Pincode & choose the gifts to order.\n\n2. What are the benefits of registering at Vriksha?\nOn registering with Vriksha, you will get 10% off.\n\nAs a registered member of Vriksha, you don’t need to enter your details every time for your order as it is already saved in My Account.'
        },
        content2: {
            title: 'Expected Delivery Date of Courier Products',
            text: 'Courier products will be shipped within 2-3 business days from the order placed date. For Tracking number, you can contact our customer service.'
        },
        content3: {
            title: 'Special Discounts and Deals at Vriksha',
            text: 'Does Vriksha provide discounts and deals on occasions? \n\n Yes, we provide several discounts and deals on occasions.'
        },
        content4: {
            title: 'Vriksha Cancellation and Refund Policy',
            text: 'You can cancel your order within 24 hours of placing it. Refunds will be processed within 5-7 business days after cancellation.'
        },
        content5: {
            title: 'Customized Orders',
            text: 'For customized orders, please contact our customer service. We offer a variety of customization options for cakes, gifts, and more.'
        },
        content6: {
            title: 'Managing my Orders',
            text: 'You can manage your orders by logging into your account and navigating to the "My Orders" section.'
        },
        content7: {
            title: 'Inquiries about charges',
            text: 'For any inquiries about charges, please contact our customer support team with your order details.'
        },
        content8: {
            title: 'Collaborate with us',
            text: 'If you are interested in collaborating with Vriksha, please reach out to us at collaborations@Vriksha.com.'
        }
    };

    faqItems.forEach(item => {
        item.addEventListener('click', () => {
            const contentId = item.getAttribute('data-content');
            modalTitle.innerText = content[contentId].title;
            modalText.innerText = content[contentId].text.replace(/\n/g, '\n');
            modal.style.display = 'block';
        });
    });

    span.onclick = () => {
        modal.style.display = 'none';
    };

    window.onclick = (event) => {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    };
});
