document.addEventListener('DOMContentLoaded', function() {
    // Prompt for email and password
    const userEmail = prompt("Enter your email:");
    const userPassword = prompt("Enter your password:");

    // Send request to verify email and password
    fetch('verify_user.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: userEmail, password: userPassword })
    })
    .then(response => response.json())
    .then(data => {
        if (data.authenticated) {
            // If authenticated, fetch notifications for the user
            fetchNotifications(userEmail);
        } else {
            alert('Invalid email or password. Please try again.');
        }
    })
    .catch(error => console.error('Error verifying user:', error));
});

function fetchNotifications(userEmail) {
    fetch('notifications.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ userEmail: userEmail })
    })
    .then(response => response.json())
    .then(notifications => {
        const notificationsContainer = document.getElementById('notifications');
        notifications.forEach(notification => {
            const notificationDiv = document.createElement('div');
            notificationDiv.className = 'notification';

            const notificationText = document.createElement('p');
            notificationText.textContent = `${notification.user_email} is interested in your project ${notification.projectName}`;
            notificationDiv.appendChild(notificationText);

            notificationsContainer.appendChild(notificationDiv);
        });
    })
    .catch(error => console.error('Error fetching notifications:', error));
}
