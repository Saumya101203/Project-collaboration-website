document.addEventListener('DOMContentLoaded', function() {
    fetchNotifications();
});

function fetchNotifications() {
    fetch('notifications.php', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(notifications => {
        console.log('Fetched notifications:', notifications); // Debugging
        const notificationsContainer = document.getElementById('notifications');
        notificationsContainer.innerHTML = ''; // Clear previous notifications

        if (notifications.length === 0) {
            notificationsContainer.innerHTML = '<p>No notifications available.</p>';
        } else {
            // Reverse the notifications array to display from bottom to top
            notifications.reverse();

            notifications.forEach(notification => {
                const notificationDiv = document.createElement('div');
                notificationDiv.className = 'notification';

                const notificationText = document.createElement('p');
                notificationText.textContent = `${notification.user_email} is interested in your project ${notification.projectName}`;
                notificationDiv.appendChild(notificationText);

                notificationsContainer.appendChild(notificationDiv);
            });
        }
    })
    .catch(error => console.error('Error fetching notifications:', error));
}
