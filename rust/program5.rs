use std::io::{self, Write};

fn reverse_string(string: String) -> String {
    return string.chars().rev().collect();
}

fn main() {

    let mut user_string = String::new();
    let mut width = String::new();

    print!("Enter a string: ");
    io::stdout().flush().expect("failed to flush stdout");

    io::stdin()
        .read_line(&mut user_string)
        .expect("failed to read line");
    
    let user_string: String = user_string.trim().parse().expect("invalid input");
    let reversed = reverse_string(user_string);

    print!("Reversed: {}", reversed);
}