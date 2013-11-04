# Determine the install directory.
templatesDirectory=~/Library/Developer/Xcode/Templates
projectTemplatesDirectory=$templatesDirectory/Project\ Templates/C++""
fileTemplatesDirectory=$templatesDirectory/File\ Templates/Mac/C\ and\ C++/""
installDirectory=~/.xcodecpptemplates

echo "\033[0;34mCloning Xcode C++ Templates...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/lidanh/xcode_cppTemplates.git $installDirectory || {
  echo "git not installed"
  exit
}

echo "\r\033[2K  [ \033[00;32mOK\033[0m ] Creating customized templates directories at $templatesDirectory"
mkdir -p "$projectTemplatesDirectory"
mkdir -p "$fileTemplatesDirectory"

# Delete the install directories if it already exists
# projects
if [ -d "$projectTemplatesDirectory/C++ Command Line Project.xctemplate" ]
  then
  echo "\r\033[2K  [ \033[00;34m..\033[0m ] C++ Project templates directory already exists. deleting..."
  rm -r "$projectTemplatesDirectory/C++ Command Line Project.xctemplate"
fi

# files
if [ -d "$fileTemplatesDirectory/C++ Class Without Header.xctemplate" ]
  then
  echo "\r\033[2K  [ \033[00;34m..\033[0m ] C++ File templates directory already exists. deleting..."
  rm -r "$fileTemplatesDirectory/C++ Class Without Header.xctemplate"
fi


# Copy all of the xctemplate folders
# project templates
cp -r $installDirectory/Project\ Templates/*.xctemplate "$projectTemplatesDirectory"

# file templates
cp -r $installDirectory/File\ Templates/*.xctemplate "$fileTemplatesDirectory"

# Create empty directories that the project templates will copy.
mkdir -p "$projectTemplatesDirectory"/"C++ Command Line Project.xctemplate/bin/"
mkdir -p "$projectTemplatesDirectory"/"C++ Command Line Project.xctemplate/src/"
mkdir -p "$projectTemplatesDirectory"/"C++ Command Line Project.xctemplate/include/"

rm -r $installDirectory

echo "\r\033[2K  [ \033[00;32mOK\033[0m ] C++ Xcode Templates installed successfuly.\n"