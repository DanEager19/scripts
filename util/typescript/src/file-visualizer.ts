#!/usr/bin/env ts-node

import chalk from 'chalk';
import chalkAnimation from 'chalk-animation';
import fs from 'fs';
import path from 'path';
import inquirer from 'inquirer';

interface fileInfo {
    name: string,
    extension: string | undefined,
    size: number,
}

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


async function fileWalker(dir: string) {
    const fileTypes: fileInfo[] = [];
    const files = fs.readdirSync(dir);
    console.log(chalk.blue(dir));

    for (let i in files){
        const filepath = path.join(dir, files[i]);
        const stats = fs.statSync(filepath);

        if(stats.isDirectory()) {
            await fileWalker(filepath) 
        } else {
            console.log(chalk.greenBright(filepath));
            fileTypes.push({
                name: filepath,
                extension: filepath.split('.').pop(),
                size: stats.size,
            })  
        }
    }
    return fileTypes;
}

console.log(await fileWalker(await askDir()));

// for(let i = 0; i < 10; i++) {
//     console.log(chalk.red(' A '.repeat(10)));
// }