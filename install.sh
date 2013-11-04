# Determine the install Folder.
templatesFolder=~/Library/Developer/Xcode/Templates
projectTemplatesFolder=$templatesFolder/Project\ Templates/C++""
fileTemplatesFolder=$templatesFolder/File\ Templates/Mac/C\ and\ C++/""
installFolder=~/.xcodecpptemplates

echo "\033[0;34mCloning Xcode C++ Templates...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/lidanh/xcode_cppTemplates.git $installFolder || {
  echo "git not installed"
  exit
}

echo "\r\033[2K  [ \033[00;32mOK\033[0m ] Creating customized templates directories at $templatesFolder"
mkdir -p "$projectTemplatesFolder"
mkdir -p "$fileTemplatesFolder"

# Delete the install directories if it already exists
# projects
if [ -d "$projectTemplatesFolder/C++ Command Line Project.xctemplate" ]
  then
  echo "\r\033[2K  [ \033[00;34m..\033[0m ] C++ Project templates folder already exists. deleting..."
  rm -r "$projectTemplatesFolder/C++ Command Line Project.xctemplate"
fi

# files
if [ -d "$fileTemplatesFolder/C++ Class Without Header.xctemplate" ]
  then
  echo "\r\033[2K  [ \033[00;34m..\033[0m ] C++ File templates folder already exists. deleting..."
  rm -r "$fileTemplatesFolder/C++ Class Without Header.xctemplate"
fi


# Copy all of the xctemplate folders
# project templates
echo "\r\033[2K  [ \033[00;32mOK\033[0m ] Copying project templates"
cp -r $installFolder/Project\ Templates/*.xctemplate "$projectTemplatesFolder"

# file templates
echo "\r\033[2K  [ \033[00;32mOK\033[0m ] Copying file templates"
cp -r $installFolder/File\ Templates/*.xctemplate "$fileTemplatesFolder"

# Create empty directories that the project templates will copy.
mkdir -p "$projectTemplatesFolder"/"C++ Command Line Project.xctemplate/bin/"
mkdir -p "$projectTemplatesFolder"/"C++ Command Line Project.xctemplate/src/"
mkdir -p "$projectTemplatesFolder"/"C++ Command Line Project.xctemplate/include/"

rm -r $installFolder
echo "\r\033[2K  [ \033[00;32mOK\033[0m ] Deleting installation folder $installFolder.\n"
echo "\r\033[2K  [ \033[00;32mOK\033[0m ] C++ Xcode Templates installed successfuly.\n"