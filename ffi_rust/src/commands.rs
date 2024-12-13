use miette::Result;
use nvim_oxi::api::opts::CreateCommandOpts;
use nvim_oxi::api::types::CommandNArgs;
use nvim_oxi::{
    api::{create_user_command, types::CommandArgs},
    Error,
};

pub fn commands() -> Result<(), Error> {
    // command! -bar -bang Q quit<bang>
    // command! -bar -bang W w<bang>
    // command! -bar -bang WQ wq<bang>
    // command! -bar -bang Wq wq<bang>

    create_user_command(
        "Greetings",
        |args: CommandArgs| {
            let who = args.args.unwrap_or("from Rust".to_owned());
            let bang = if args.bang { "!" } else { "" };
            print!("Hello {}{}", who, bang);
        },
        &CreateCommandOpts::builder()
            .bang(true)
            .desc("shows a greetings message")
            .nargs(CommandNArgs::ZeroOrOne)
            .build(),
    )?;

    Ok(())
}
