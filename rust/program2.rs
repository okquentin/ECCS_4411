use std::io::{self, Write};

fn main() {
    let mut name = String::new();

    print!("What is your Name?: ");

    io::stdout().flush().expect("failed to flush stdout");

    io::stdin()
        .read_line(&mut name)
        .expect("failed to read line");

    let name = name.trim_end_matches(&['\n', '\r'][..]);

    println!("Hello, {}!", name);
}