# mkfile

Easy template file creation. Stop writing boilerplate.

#### Creating new template from a file

`$ mkfile init MyTemplateName "$(cat from-some-file.whatever)"`

This will create a template file with name of `MyTemplateName` in the templates directory (commonly `/home/username/mkfile/templates`, may be elsewhere depending on OS).

#### Creating a file from a template

`$ mkfile create MyTemplateName new-file-name.whatever`

This creates a new file in your current directory.

If both of these commands are run sequentially `from-some-file.whatever` and `new-file-name.whatever` will have the same contents.

#### Installation

1. Download binary [Here](https://github.com/mini-eggs/mkfile/releases/download/1.0.0-rc1/mkfile)

2. Add correct permissions.

3. Alias or put in path.

On Linux this may be:

```bash
curl -o ~/Applications/mkfile -sSL https://github.com/mini-eggs/mkfile/releases/download/1.0.0-rc1/mkfile && \
chmod +x ~/Applications/mkfile && \
alias mkfile="~/Applications/mkfile"
```