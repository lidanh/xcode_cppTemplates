# Xcode C++ Templates

While working on personal projects and university assignments I found myself constantly doing the same steps over and over again whenever I would create a new project. 
So I decided to jump into unknown world that is "Xcode Project Template documentation" and figure out how to create my own project template.

Most of what I learned was by looking at Apple's own templates (which are located in /Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/), and several github Xcode templates projects.

#### Project Templates
Creating src-include-bin project structure, with the same folders in the filesystem.
Build projects with fully-customized makefile.

#### File Templates
Create C++ files without header.

# Setup
You can install this automatically via the command line with either `curl` or `wget`.

#### via `curl`

```
curl -L https://raw.github.com/lidanh/xcode_cppTemplates/master/install.sh | sh
```

#### via `wget`

```
wget --no-check-certificate https://raw.github.com/lidanh/xcode_cppTemplates/master/install.sh -O - | sh
```

# Create Projects
![create project](https://dl.dropboxusercontent.com/u/4041100/github/xcodecreateproject.png)

# Build Projects
To build, press **⌘B**.

For cleaning the project, press **⇧⌘K** (or choose **Product / Clean**), Xcode will run the `clean` target in the Makefile.

# Run
Under the **Product** menu, choose **Scheme** then **Edit Scheme**. or press **⌘<**.
![run project](https://dl.dropboxusercontent.com/u/4041100/github/xcoderun.png)
Click on **Run** in the left pane. The click on the drop-down next to **Executable** and choose **Other…**. Find the executable in the bin folder and click on it.

To pass arguments to the default run, click the arguments tab and add them there.

Click **OK** to save.

Press **⌘R** to run, and Xcode will bring up a console window to display the program’s output.





