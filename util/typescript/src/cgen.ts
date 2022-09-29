#!/usr/bin/env ts-node

import fs from 'fs';
import chalk from 'chalk';
import inquirer from 'inquirer';
import { createSpinner } from 'nanospinner';
import { outputFile } from 'fs-extra';

const makefile = `all:
\tgcc -m32 src/main.c -o run.bin

clean:
\trm run.bin`;

const returnZero = `{
        
    return 0;
}`;

const sleep = (ms = 2000) => new Promise((r) => setTimeout(r, ms));

async function askName(): Promise<string> {
    const answer = await inquirer.prompt({
        name: 'name',
        type: 'input',
        message: 'Give the project a name:',
        default() {
            return 'project';
        }
    });

    return answer.name;
}

async function askHeaders(): Promise<string> {
    const answer = await inquirer.prompt({
        name: 'headers',
        type: 'input',
        message: 'Enter all header files to include. Separate header files with a space.',
        default() {
            return 'stdio.h';
        },
    });

    return answer.headers;
}

async function askCmdArgs(): Promise<boolean> {
    const answer = await inquirer.prompt({
        name: 'cmdArgs',
        type: 'confirm',
        message: 'Will the program take command line arguments?',
    });

    return answer.cmdArgs;
}

async function generateBoilerplate(): Promise<void> {
    let template = '';
    const projectName = await askName();

    const headerFiles = (await askHeaders()).split(' ');
    const cmdArgs = await askCmdArgs();
    const spinner = createSpinner().start();

    headerFiles.forEach((header: any) => {
        template += `#include <${header}>\n`;
    });
    
    cmdArgs ? template += '\nint main(int argc, char *argv[])\n' : template += '\nint main()\n';
    
    template += returnZero

    if (fs.existsSync(`${projectName}/Makefile`)) {
        spinner.error({
            text: chalk.redBright('[x] - Makefile already exists!')
        });
        process.exit(1);
    } else {    
        await outputFile(`${projectName}/Makefile`, makefile, (e) => {
            if (e) {
                spinner.error({
                    text: chalk.redBright(`[x] - ${e}`)
                });
                process.exit(1);
            }
        });
    }    

    if (fs.existsSync(`${projectName}/src/main.c`)) {
        spinner.error({
            text: chalk.redBright('[x] - Project already exists!')
        });
        process.exit(1);
    } else {    
        await outputFile(`${projectName}/src/main.c`, template, (e) => {
            if (e) {
                spinner.error({
                    text: chalk.redBright(`[x] - ${e}`)
                });
                process.exit(1);
            }
        });
    }    

    await sleep(2000);

    await spinner.success({
        text: chalk.greenBright(`[+] - Success! C Project: ${[projectName]} generated!`)
    });
}

console.clear()
await generateBoilerplate()