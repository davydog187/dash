use rand::distributions::{Distribution, Uniform};
use rand::rngs::ThreadRng;

#[rustler::nif]
fn speak(text: String) -> String {
    let mut rng = rand::thread_rng();

    text.chars().map(|c| silly(c, &mut rng)).collect()
}

fn silly(c: char, mut rng: &mut ThreadRng) -> String {
    let value = Uniform::from(0..2).sample(&mut rng);

    match value {
        0 => c.to_uppercase().to_string(),
        1 => c.to_lowercase().to_string(),
        _ => panic!("bad random number"),
    }
}


rustler::init!("Elixir.Dash.Spongebob", [speak]);
