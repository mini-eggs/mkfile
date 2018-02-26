# mkfile

Easy template file creation. Stop writing boilerplate.

#### Creating new template from a file

`$ mkfile init MyTemplateName "$(cat from-some-file.whatever)"`

This will create a template file with name of `MyTemplateName` in the templates directory (commonly `/home/username/mkfile/templates`, may be elsewhere depending on OS).

#### Creating a file from a template

`$ mkfile create MyTemplateName new-file-name.whatever`

This creates a new file in your current directory.

If both of these commands are run sequentially `from-some-file.whatever` and `new-file-name.whatever` will have the same contents.

#### Installation on MacOS (x86_64)

```bash
curl -o ~/Applications/mkfile -sSL https://github.com/mini-eggs/mkfile/releases/download/1.0.0-rc1-linux/mkfile_mac_64 && \
chmod +x ~/Applications/mkfile && \
alias mkfile="~/Applications/mkfile"
```

#### Installation on Linux (x86_64)

```bash
curl -o ~/Applications/mkfile -sSL https://github.com/mini-eggs/mkfile/releases/download/1.0.0-rc1-linux/mkfile_linux_64 && \
chmod +x ~/Applications/mkfile && \
alias mkfile="~/Applications/mkfile"
```

#### From source

1. Clone this repo

2. Have Roswell and Make installed

3. Run `$ make`