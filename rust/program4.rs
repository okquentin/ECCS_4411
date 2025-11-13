// Avoiding Null Pointer References in Rust using Option<T>

fn get_user_id(username: &str) -> Option<i32> {
    match username {
        "alice" => Some(101),
        "bob" => Some(202),
        // Return none if not found
        _ => None,
    }
}

fn main() {
    // Successful lookup
    let alice_id_option = get_user_id("alice");
        
    match alice_id_option {
        Some(id) => println!("\n[1] Found 'alice': ID is {}.", id),
        None => println!("\n[1] Could not find 'alice'."),
    }

    // Failed lookup (Value is missing)
    let charlie_id_option = get_user_id("charlie");
    
    println!("\n[2] Attempting to find 'charlie'...");

    // The Rust compiler forces a check for 'None' before accessing the value:
    if let Some(id) = charlie_id_option {
        println!("Found 'charlie': ID is {}.", id);
    } else {
        println!("User not found.");
    }
}