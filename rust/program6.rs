use std::io::{self, Write};

fn sort_array(mut arr: Vec<i32>) -> Vec<i32> {
    arr.sort();
    arr
}

fn main() {
    let mut input = String::new();

    print!("Enter a list of integers (separated by spaces): ");
    io::stdout().flush().expect("failed to flush stdout");

    io::stdin()
        .read_line(&mut input)
        .expect("failed to read line");

    let numbers: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("invalid input"))
        .collect();

    let sorted_numbers = sort_array(numbers);

    println!("Sorted array: {:?}", sorted_numbers);
}