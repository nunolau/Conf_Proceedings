rm -rf CONF_Online/*
mkdir -p CONF_Online/files
mkdir -p CONF_Online/images
#cp CONF_header.png CONF_Sponsors.png CONF_Patrons.png CONF_Org.png CONF_Online/images
cp CONF_header.png CONF_Sponsors.png CONF_Org.png CONF_Online/images
awk -f gen_usb.awk < Conf_Papers.csv >CONF_Online/index.html
awk -f gen_usb_program.awk < Conf_Program.csv > CONF_Online/program.html
