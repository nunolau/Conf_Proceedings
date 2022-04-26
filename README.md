# Conf_Proceedings

## Dependencies

To run these tools please install (in ubuntu):

```bash
sudo apt install texlive-latex-base texlive-latex-extra gawk make
sudo snap install pdftk
```

## First Run

To run the precompiled example, execute:

```bash
make
```

you should get a `Conf_Proceedings.pdf` file with frontmatter, a keynote talk and 2 papers.

Then execute:

```bash
./gen_usb.sh
```

you should get a directory `CONF_Online` containing the html version of the proceedings and program.

## Adapt to your conference

The source files of the system are `config.txt`, `Conf_Proceedings.tex`, `Conf_Papers.xlsx` 
and `Conf_Program.xlsx`. 

The 2 `.xlsx` files must always be converted to `.csv`, using `;` separator and no quotes
(we use `libreoffice´ "Save as" for this) before executing `make`.

The system also depends on a directory structure that includes a folder for each paper pdf file.
If you have downloaded the camera ready files from easychair, `makePaperFolders.sh` should help
you in setting up this structure. `movePapersToFolder.sh` and `updatePaperFolders.sh` may be used 
later for updating, if needed.

You can start by editing `config.txt` to define adequate values for the variables.

Update `Conf_Papers.xlsx` and `Conf_Program.xlsx` by copy pasting the adequate tables from easychair to
the relevant sheets. Save each of them as a "Text CSV" file using `;` separator and no quotes.

To fill collumn with the number of pages of each paper, the `pdfPages.sh` script may help. 

Update `Conf_Proceedings.tex` and add the "Welcome message" and "Committees", etc..

Execute:

```
make
./gen_usb.sh
```

## Authors

* Nuno Lau - nunolau@ua.pt


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
