document.getElementById('addProjectForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const projectName = document.getElementById('projectName').value;
    const projectSubject = document.getElementById('projectSubject').value;
    const projectDescription = document.getElementById('projectDescription').value;
    const projectTopics = document.getElementById('projectTopics').value;
    const userEmail = document.getElementById('userEmail').value;

    const formData = new FormData();
    formData.append('projectName', projectName);
    formData.append('projectSubject', projectSubject);
    formData.append('projectDescription', projectDescription);
    formData.append('projectTopics', projectTopics);
    formData.append('userEmail', userEmail);

    fetch('add_project.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
            // Optionally redirect to another page upon successful project addition
            window.location.href = './ongoing-projects.html';
        } else {
            alert('Error: ' + data.message);
        }
    })
    .catch(error => {
        alert('An error occurred. Please try again.');
    });
});
