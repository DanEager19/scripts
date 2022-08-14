import chalk from 'chalk';
import chalkAnimation from 'chalk-animation';

const sleep = (ms = 2000) => new Promise((r) => setTimeout(r, ms));

async function animation() {
    const rainbow = chalkAnimation.rainbow(`sumanai sumanai sumanai`);

    await sleep(5000);
    rainbow.stop();
}

await animation()