fetch("/lesson/electrique/blues/debutant/__sidebar/sidebar.html")
.then(response => response.text())
.then(html =>
{
    document.getElementById("sidebar").innerHTML = html;

    const details = document.querySelectorAll(".lesson-menu details");

    details.forEach(detail =>
    {
        detail.querySelector("summary").addEventListener("click", function ()
        {
            // Si on va ouvrir ce chapitre
            if (!detail.open)
            {
                details.forEach(other =>
                {
                    if (other !== detail)
                        other.removeAttribute("open");
                });
            }
        });
    });

    const current = document.body.dataset.lesson;

    const currentLink = document.querySelector(
        `a[data-lesson="${current}"]`
    );

    if (currentLink)
    {
        currentLink.classList.add("current");

        currentLink.closest("details").setAttribute("open", "");
    }
})
.catch(console.error);