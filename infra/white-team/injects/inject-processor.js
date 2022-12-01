#!/usr/bin/env node
const fs = require('fs');
const document = require('./injects.json')

for (let inject in document.injects) {
    const template = `### White Team - Inject ${inject}

### ${document.date}

---

## ${document.injects[inject].type}
**To:** Security Teams<br>**From:** ${document.from}<br>**Date:** ${document.date}<br>**RE:** ${document.injects[inject].name}

Hello!

${document.injects[inject].desc}

${document.injects[inject].end}

Best,<br>${document.from}
`

    fs.writeFile(`inject-${inject}.md`, template, (e) => {
        if (e) console.log(`[x] - ${e}`)
        else console.log(`[+] - Created inject-${inject}`)
    });
}
