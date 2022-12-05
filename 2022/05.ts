import * as fs from 'fs';

const lines = fs.readFileSync('input.txt', 'utf-8').split('\n');

const seperatorIndex = lines.findIndex((line) => line === '');

const stackCount = Number(lines[seperatorIndex - 1].trim().split(' ').pop());

type Stacks = string[][];

const instructions = lines.splice(seperatorIndex + 1);

const crateLayout = lines.splice(0, seperatorIndex - 1).reverse();

function createStacks(): Stacks {
    const stacks: Stacks = Array.from({ length: stackCount }, () => []);

    crateLayout.forEach((line) =>
        stacks.forEach((stack, index) => {
            const crate = line[1 + index * 4].trim();

            if (crate) {
                stack.push(crate);
            }
        })
    );

    return stacks;
}

interface Move {
    count: number;
    from: number;
    to: number;
}

function parseInstruction(instruction: string): Move {
    const [count, from, to] = instruction
        .split(' ')
        .map(Number)
        .filter((t) => !isNaN(t));

    return {
        count,
        from: from - 1,
        to: to - 1,
    };
}

const moves = instructions.map(parseInstruction);

function getTopCrates(stacks: string[][]): string {
    return stacks.map((stack) => stack.pop()).join('');
}

const stacks_1 = createStacks();

for (const move of moves) {
    for (let i = 0; i < move.count; i++) {
        const crate = stacks_1[move.from].pop();

        if (!crate) {
            throw 'empty stack';
        }

        stacks_1[move.to].push(crate);
    }
}

console.log(getTopCrates(stacks_1));

const stacks_2 = createStacks();

for (const move of moves) {
    const crates = stacks_2[move.from].splice(-move.count, move.count);

    stacks_2[move.to] = stacks_2[move.to].concat(crates);
}

console.log(getTopCrates(stacks_2));
