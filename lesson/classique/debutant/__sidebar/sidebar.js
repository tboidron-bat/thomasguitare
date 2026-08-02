fetch("../__sidebar/sidebar.html")
    .then(response => response.text())
    .then(html => {

        document.getElementById("sidebar").innerHTML = html;

        const current = document.body.dataset.lesson;

        document
            .querySelector(`a[data-lesson="${current}"]`)
            ?.classList.add("current");

    })
    .catch(console.error);