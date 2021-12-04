#[macro_use]
extern crate log;

{% if crate_type == "bin" %}
fn main() {
    env_logger::init();

    debug!("debug Hello, world!");
    info!("info also");
}
{% endif %}

#[cfg(test)]
mod tests {
    use test_env_log::test;
    use mockall::predicate::*;

    #[cfg_attr(test, mockall::automock)]
    trait MyTrait {
        fn foo(&self, x: u32) -> u32;
    }

    #[test]
    fn it_works() {
        info!("Checking whether it still works...");
        assert_eq!(2 + 2, 4);
        info!("Looks good!");
    }

    #[test]
    fn mock_test() {
        let mut mock = MockMyTrait::new();

        mock.expect_foo().with(eq(4)).times(1).returning(|x| x + 1);

        assert_eq!(5, mock.foo(4));
    }
}
