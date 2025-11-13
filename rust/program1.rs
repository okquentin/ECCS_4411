fn average_numbers(numbers: &[f64]) -> f64 {
    let sum: f64 = numbers.iter().sum();
    let count = numbers.len() as f64;
    if count == 0.0 {
        0.0
    } else {
        sum / count
    }
}

fn main(){
    let numbers = vec![1.0, 2.0, 3.0, 4.0, 5.0];
    let avg = average_numbers(&numbers);
    println!("The average is: {}", avg);
}