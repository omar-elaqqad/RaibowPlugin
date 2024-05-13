
// listen to page loading to fetch the token
document.addEventListener('DOMContentLoaded', function() {
    //retrieves the token in the current url of the page and delete first character which is #
    var hashParams = new URLSearchParams(window.location.hash.substring(1));
    //get the token from the url
    var token = hashParams.get('access_token');

    //if token isn't null we make a AJAX POST Method to save the token 
    if (token) {
        console.log('Token retrieved successfully : ');
        
        const progressBar = document.querySelector('.progress-bar');
        let currentProgress = 0;
        
        jQuery.ajax({
            url: 'http://localhost:8080/jcms/plugins/RainbowPlugin/jsp/app/LoginInfo.jsp',
            type: 'POST',
            data: { access_token: token },
            dataType: 'text', // Change dataType to text since the response is plain text
            success: function(response) {
                //if the response is Succes meaning the token is saved then we redirect the user to the rainbow plugin
                if (response === "Success") {
                    console.log("Token Sent successfully. Redirecting...");
                    // redirection with a deelay
                    setTimeout(function() {
                        window.location.href = "plugins/RainbowPlugin/jsp/app/Rainbow.jsp";
                        currentProgress=100;
                    }, 1000); // Delay in milliseconds
                } else {
                    console.error("Failed to save token.");
                }
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });

        const intervalId = setInterval(() => {
            if (currentProgress >= 100) {
                clearInterval(intervalId);
                return;
            }
            currentProgress += 5;  // Adjust increment for desired speed (lower for faster)
            progressBar.style.width = `${currentProgress}%`;
            
            // Display the current progress value in the console
            console.log(`Current Width: ${currentProgress}%`);
        }, 20); // Adjust interval for animation frame rate (lower for smoother)
    }



});
