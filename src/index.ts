import chalk from 'chalk';
import chalkAnimation from 'chalk-animation';

const sleep = (ms = 2000) => new Promise((r) => setTimeout(r, ms));

async function animation() {
    const rainbow = chalkAnimation.rainbow('hello');

    await sleep(20000);
    rainbow.stop();
}

await animation()