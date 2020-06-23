# add GA's images fonts
cp -r ~/Work/surround/VocPrez-theme-cgi/style/* ~/Work/surround/vocprez/vocprez/view/style

# replace page templates
cp ~/Work/surround/VocPrez-theme-cgi/templates/index.html ~/Work/surround/vocprez/vocprez/view/templates/index.html
cp ~/Work/surround/VocPrez-theme-cgi/templates/page.html ~/Work/surround/vocprez/vocprez/view/templates/page.html
cp -rf ~/Work/surround/VocPrez-theme-cgi/style ~/Work/surround/vocprez/vocprez/view/style

# configure config
# cp ~/Work/surround/VocPrez-theme-cgi/_config/__init__.py ~/Work/surround/vocprez/vocprez/_config/
