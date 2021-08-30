#[macro_use]
extern crate log;

fn main() {
    env_logger::init();

    debug!("debug Hello, world!");
    info!("info also");
}


#[cfg(test)]
mod tests {
    use test_env_log::test;

    #[test]
    fn it_works() {
        info!("Checking whether it still works...");
        assert_eq!(2 + 2, 4);
        info!("Looks good!");
    }
}
