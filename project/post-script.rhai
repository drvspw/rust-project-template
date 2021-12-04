let workspace = variable::get("workspace");

if workspace {
  file::delete("src");
} else {
  let crate_type = variable::get("crate_type");

  if crate_type == "lib" {
    file::rename("src/main.rs", "src/lib.rs");
  }
}
