### rust-project-template
A template project to use with `cargo-generate`. For installing `cargo-generate` refer to [cargo_generate](https://github.com/cargo-generate/cargo-generate). This template creates projects with logging enabled.

### Prequsites
- `cargo-generate` version `0.11,1` or later.

### Creating Projects
- To create a binary project
```bash
$ cargo generate --git drvspw/rust-project-template project
```

- To create a library project
```bash
$ cargo generate --git drvspw/rust-project-template --lib project
```

- To initialize a workspace
```bash
$ cargo generate --git drvspw/rust-project-template project -d workspace=true
```
