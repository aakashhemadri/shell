# sed

Sed is a stream editor.
- Allows pattern matching in-buffer.
- Only makes a single pass over each line.
```bash
$ man sed
```
Best short guide on sed
```bash
$ info sed
```

## Options

| POSIX          | GNU                 | Description                                                                               |
| -------------- | ------------------- | ----------------------------------------------------------------------------------------- |
| -n             | --quiet/--silent    | suppress automatic printing of pattern space                                              |
| -e script      | --expression=script | add the script to the commands to be executed                                             |
| -f script-file | --file=script-file  | add the contents od script-file to the commands to be executed                            |
|                | --follow-symlinks   | follow symlinks when processing in place                                                  |
| -i[SUFFIX]     | --in-place[=SUFFIX] | edit files in place (makes backup if SUFFIX supplied)                                     |
| -l N           | --line-length=N     | specify the desired line-wrap length for the 'l' command                                  |
|                | --posix             | disable all GNU extensions                                                                |
| -E -r          | --regexp-extended   | use extendd regular expressions in the script (for portability use POSIX -E).             |
| -s             | --seperate          | consider files as seperate rather than as a single continous long stream                  |
|                | --sandbox           | operate in sandbox mode                                                                   |
| -u             | --unbuffered        | load minimal amounts of data from the input files and flush the output buffers more often |
| -z             | --null-data         | seperate lines by NUL characters                                                          |
|

- If no -e, --expression, -f, or --file option is given, then the first non-option argument is taken as the sed script to interpret.
- All remaining arguments are names of input files; if no input file is read then stdin is read.

## sed commands

### zero address commands
--