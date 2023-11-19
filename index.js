// Make Embeds active one at a time

// Get all Project embeds
const embeds = [...document.querySelectorAll('.project')];
// Bind Onclick for each Embed
embeds.forEach(embed => {
    embed.addEventListener("click", (ev) => {
        // Not for Enabled Projects
        if (embed.classList.contains('shown')) return;

        // Close all embeds
        embeds.forEach(el => {
            const iframe = el.querySelector('iframe');
            if (iframe) iframe.src = "about:blank";
            el.classList.remove("shown")
        });

        // Enable this Project Embed
        const iframe = embed.querySelector('iframe');
        if (iframe) iframe.src = iframe.dataset.src;
        embed.classList.add("shown")
        
        // Smooth scroll into view once expanded
        setTimeout(() => embed.scrollIntoView({behavior: "smooth"}), 500);
    })
})