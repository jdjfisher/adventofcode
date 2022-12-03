use std::collections::HashSet;
use std::fs;

const FILE_PATH: &str = "input.txt";

fn main() {
    let data = fs::read_to_string(FILE_PATH).expect("Unable to load input");

    let priority_sum: usize = data
        .split('\n')
        .map(find_item_in_rucksack)
        .map(item_priority)
        .sum();

    println!("{priority_sum}");

    let priority_sum: usize = data
        .split('\n')
        .collect::<Vec<_>>()
        .chunks_exact(3)
        .map(find_item_in_rucksacks)
        .map(item_priority)
        .sum();

    println!("{priority_sum}");
}

fn find_item_in_rucksacks(group: &[&str]) -> char {
    let common_items = group
        .iter()
        .map::<HashSet<char>, _>(|rucksack| HashSet::from_iter(rucksack.chars()))
        .reduce(|acc, set| acc.intersection(&set).copied().collect())
        .expect("Empty group");

    *common_items.iter().next().expect("No common item")
}

fn find_item_in_rucksack(rucksack: &str) -> char {
    let (left, right) = rucksack.split_at(rucksack.len() / 2);

    left.chars()
        .find(|c| right.contains(*c))
        .expect("No common item")
}

fn item_priority(item: char) -> usize {
    item as usize - if item.is_uppercase() { 38 } else { 96 }
}
