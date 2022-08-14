import chalk from 'chalk';
import chalkAnimation from 'chalk-animation';
import fs from 'fs';
import path from 'path';
import inquirer from 'inquirer';

let size = 0;
async function askDir() {
    const answer = await inquirer.prompt({
        name: 'directory',
        type: 'input',
        message: 'Enter the file directory',
        default() {
            return '.';
        },
    });

    return answer.directory;
}


async function fileWalker(dir: any) {
    const files = fs.readdirSync(dir);

    for (let i in files){
        const filepath = dir + '/' + files[i];
        const stats = fs.statSync(filepath);

        if(stats.isDirectory()) {
            console.log(chalk.blue(filepath));
            await fileWalker(filepath)
        } else {
            console.log(chalk.greenBright(files[i]));
        }    
    }
}

await fileWalker(await askDir());