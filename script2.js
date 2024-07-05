document.addEventListener('DOMContentLoaded', function() {
    fetch('fetch_projects.php')
        .then(response => response.json())
        .then(projects => {
            const projectsContainer = document.getElementById('projects');
            projects.forEach(project => {
                const projectDiv = document.createElement('div');
                projectDiv.className = 'project';

                const projectName = document.createElement('h2');
                projectName.textContent = `Project Name: ${project.projectName}`;
                projectDiv.appendChild(projectName);

                const projectSubject = document.createElement('p');
                projectSubject.innerHTML = `<strong>Subject:</strong> ${project.projectSubject}`;
                projectDiv.appendChild(projectSubject);

                const projectDescription = document.createElement('p');
                projectDescription.innerHTML = `<strong>Description:</strong> ${project.projectDescription}`;
                projectDiv.appendChild(projectDescription);

                const projectTopics = document.createElement('p');
                projectTopics.innerHTML = `<strong>Major Topics:</strong> ${project.projectTopics}`;
                projectDiv.appendChild(projectTopics);

                const interestedButton = document.createElement('button');
                interestedButton.className = 'interested-button';
                interestedButton.textContent = 'Interested';
                interestedButton.onclick = () => {
                    saveNotification(project.id, project.email); // Pass project id and owner email
                };
                projectDiv.appendChild(interestedButton);

                projectsContainer.appendChild(projectDiv);
            });
        })
        .catch(error => console.error('Error fetching projects:', error));
});

function saveNotification(projectId, ownerEmail) {
    // Replace with actual dynamic email retrieval (e.g., from session or authentication)
    const loggedInUserEmail = prompt("Please enter your email:");
    if (!loggedInUserEmail) {
        alert('Email is required to save notification.');
        return;
    }

    fetch('save_notification.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ projectId: projectId, loggedInUserEmail: loggedInUserEmail })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Notification saved successfully!');
        } else {
            alert('Error saving notification: ' + data.message);
        }
    })
    .catch(error => console.error('Error saving notification:', error));
}

