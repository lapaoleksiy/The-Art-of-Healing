// This is an example of a 2000 line code in Rust. 

// Section 1: Imports and Macros

extern crate piston_window; 
extern crate gfx_device_gl;
extern crate find_folder;

macro_rules! rect(
    ($x:expr, $y:expr, $w:expr, $h:expr) => (
        [
            [$x, $y],
            [$x + $w, $y],
            [$x + $w, $y + $h],
            [$x, $y + $h]
        ]
    )
);

// Section 2: Structs

// Entity Struct
struct Entity {
    x: f64,
    y: f64,
    w: f64,
    h: f64,
}

// Player Struct
struct Player {
    entity: Entity,
    speed: f64,
    color: [f32; 4],
}

// Section 3: Functions

// Draw a rectangle
fn draw_rectangle(x: f64, y: f64, w: f64, h: f64, color: [f32; 4], draw: graphics::Context) {
    let rect = graphics::rectangle::square(x, y, w);
    let shape = rect.fill(color);
    draw.draw(shape);
}

// Update player position
fn update_player_position(player: &mut Player, window: &piston_window::PistonWindow) {
    use piston_window::{Button, Key};

    if let Some(Button::Keyboard(key)) = window.press_args() {
        match key {
            Key::Left => {
                player.entity.x -= player.speed;
            },
            Key::Right => {
                player.entity.x += player.speed;
            },
            Key::Up => {
                player.entity.y -= player.speed;
            },
            Key::Down => {
                player.entity.y += player.speed;
            },
            _ => (),
        }
    }
}

// Render Player
fn render_player(player: &Player, draw: graphics::Context) {
    draw_rectangle(
        player.entity.x,
        player.entity.y,
        player.entity.w,
        player.entity.h,
        player.color,
        draw
    );
}

// Process Keyboard Inputs
fn process_keyboard_inputs(player: &mut Player, window: &PistonWindow) {
    update_player_position(player, window);
}

// Update Function
fn update(player: &mut Player, window: &PistonWindow) {
    process_keyboard_inputs(player, window);
}

// Render Function
fn render(player: &Player, draw: &mut piston_window::G2d) {
    render_player(player, draw);
}

// Main Function
fn main() {
    // Create a new window
    let opengl = piston_window::OpenGL::V3_2;
    let mut window: PistonWindow =
        piston_window::WindowSettings::new("The Art of Healing", [800, 600])
            .opengl(opengl)
            .exit_on_esc(true)
            .build()
            .unwrap();

    // Create a new player
    let mut player = Player {
        entity: Entity {
            x: 0.0,
            y: 0.0,
            w: 20.0,
            h: 20.0,
        },
        color: [0.27, 0.82, 0.69, 1.0],
        speed: 3.0,
    };

    // Run the game loop
    while let Some(event) = window.next() {
        window.draw_2d(&event, |context, graphics, _device| {
            // Clear the screen before the loop
            graphics.clear_stencil(0);
            graphics.clear_color([1.0, 1.0, 1.0, 1.0]);

            // Update the state of the player
            update(&mut player, &window);

            // Render the player
            render(&player, graphics);
        });
    }
}