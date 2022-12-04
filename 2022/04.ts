import fs from 'fs';

const pairs = fs.readFileSync('input.txt', 'utf-8').split('\n');

function parse(pair: string): [[number, number], [number, number]] {
    const [left, right] = pair.split(',');
    const [leftStart, leftEnd] = left.split('-').map(Number);
    const [rightStart, rightEnd] = right.split('-').map(Number);

    return [
        [leftStart, leftEnd],
        [rightStart, rightEnd],
    ];
}

const covers = pairs
    .map(parse)
    .filter(([[ls, le], [rs, re]]) => (ls >= rs && le <= re) || (rs >= ls && re <= le))
    .length;

const overlaps = pairs
    .map(parse)
    .filter(([[ls, le], [rs, re]]) => ls <= re && le >= rs)
    .length;

console.log(covers, overlaps);
