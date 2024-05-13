document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const searchOptions = document.querySelectorAll('.search-option');
    const searchForm = document.querySelector('.search-form');

    // Add click event listener to search input
    searchInput.addEventListener('click', function() {
        this.classList.add('active'); // Add active class to input
        document.querySelector('.search-options').style.display = 'flex'; // Show search options
        searchForm.classList.add('active'); // Add active class to search form
    });

    // Add click event listener to search options
    searchOptions.forEach(option => {
        option.addEventListener('click', function() {
            searchOptions.forEach(opt => opt.classList.remove('active')); // Remove active class from all options
            this.classList.add('active'); // Add active class to clicked option
            searchInput.value = ''; // Clear search input
            searchInput.focus(); // Focus on search input
        });
    });
});
