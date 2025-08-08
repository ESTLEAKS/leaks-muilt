window.addEventListener('message', function(event) {
    if (event.data.type === 'showUI') {
        const slots = document.getElementById('slots');
        slots.innerHTML = '';
        event.data.characters.forEach((char, index) => {
            const div = document.createElement('div');
            div.className = 'character-slot';
            div.innerHTML = `
                <h3>${char.name}</h3>
                <p>DOB: ${char.dob}</p>
                <p>Location: ${char.location}</p>
                <button onclick="selectCharacter(${index})">Play</button>
            `;
            slots.appendChild(div);
        });
    }
});

function selectCharacter(index) {
    fetch(`https://${GetParentResourceName()}/selectCharacter`, {
        method: 'POST',
        body: JSON.stringify({ index }),
        headers: { 'Content-Type': 'application/json' }
    });
}

function createNew() {
    const name = prompt("Enter character name:");
    const dob = prompt("Enter date of birth:");
    const location = prompt("Enter location:");
    fetch(`https://${GetParentResourceName()}/createCharacter`, {
        method: 'POST',
        body: JSON.stringify({ name, dob, location }),
        headers: { 'Content-Type': 'application/json' }
    });
}
