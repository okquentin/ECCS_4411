use std::io::{self, Write};

fn calc_area(length: f64, width: f64) -> f64 {
    return length * width;
}

fn main() {

    let mut length = String::new();
    let mut width = String::new();

    print!("Rectangle Length: ");
    io::stdout().flush().expect("failed to flush stdout");

    io::stdin()
        .read_line(&mut length)
        .expect("failed to read line");


    print!("Rectangle Width: ");
    io::stdout().flush().expect("failed to flush stdout");

    io::stdin()
        .read_line(&mut width)
        .expect("failed to read line");

    let length: f64 = length.trim().parse().expect("invalid input");
    let width: f64 = width.trim().parse().expect("invalid input");

    let area = calc_area(length, width);

    print!("Area: {}", area);
}