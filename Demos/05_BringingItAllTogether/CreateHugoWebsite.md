# Hugo

Build a hugo website within our dev container.

![image](https://user-images.githubusercontent.com/981370/194907982-1219f67a-a3b7-4ac3-9d5f-e7063abb5ac3.png)

We can ensure hugo is installed and ready for action by checking the version:

```PowerShell
hugo version
go version
```

Something similar to this will be returned

```Text
hugo v0.104.0-c744dbd6edeeb27288c9dd67e0eb92951f911397 linux/amd64 BuildDate=2022-09-23T14:32:56Z VendorInfo=gohugoio
go version go1.19.1 linux/amd64
```

## Create our website

0. Change directory

    ```PowerShell
    cd /workspaces/SCSWorkshop/
    ```


1. Create a new hugo site

    ```PowerShell
    hugo new site SouthCoastSummit
    ```

1. Change directory

    ```PowerShell
    cd SouthCoastSummit
    ```

1. Convert Hugo site to a Hugo Module (this creates the go.mod file)

    ```bash
    hugo mod init github.com/jpomfret/SCSWorkshop
    ```

1. Create the config folder

    ```PowerShell
    New-Item /workspaces/SCSWorkshop/SouthCoastSummit/config/_default -Type Directory
    ```

1. Download the sample config files

    ```PowerShell
    wget "https://github.com/nunocoracao/blowfish/blob/main/config/_default/config.toml?raw=True" -O /workspaces/SCSWorkshop/SouthCoastSummit/config/_default/config.toml
    wget "https://github.com/nunocoracao/blowfish/blob/main/config/_default/languages.en.toml?raw=True" -O /workspaces/SCSWorkshop/SouthCoastSummit/config/_default/languages.en.toml
    wget "https://github.com/nunocoracao/blowfish/blob/main/config/_default/markup.toml?raw=True" -O /workspaces/SCSWorkshop/SouthCoastSummit/config/_default/markup.toml
    wget "https://github.com/nunocoracao/blowfish/blob/main/config/_default/menus.en.toml?raw=True" -O /workspaces/SCSWorkshop/SouthCoastSummit/config/_default/menus.en.toml
    wget "https://github.com/nunocoracao/blowfish/blob/main/config/_default/module.toml?raw=True" -O /workspaces/SCSWorkshop/SouthCoastSummit/config/_default/module.toml
    wget "https://github.com/nunocoracao/blowfish/blob/main/config/_default/params.toml?raw=True" -O /workspaces/SCSWorkshop/SouthCoastSummit/config/_default/params.toml
    ```

1. Open `module.toml`

    ```PowerShell
    code config/_default/module.toml
    ```

    a. add the theme - this is using hugo modules (some themes use git submodules)

    ```toml
    [[imports]]
    path = "github.com/nunocoracao/blowfish"
    ```

1. Start up hugo (with drafts enabled)

    ```PowerShell
    hugo server -D
    ```

## Let's improve things a bit

1. Let's configure things a little more

    ```PowerShell
    code config/_default/languages.en.toml
    ```

    a. Update the title

    ```toml
    title = "Jess & Rob's Super Site"
    ```

1. Create our first post

    ```bash
    hugo new posts/WorkshopDay.md
    ```

1. Open the post & add some interesting content

    ```PowerShell
    code content/posts/WorkshopDay.md
    ```

1. Start up hugo (with drafts enabled)

    ```PowerShell
    hugo server -D
    ```

1. Click the toast, or open a browser and go to http://localhost:1313/

## How about a better post?

1. Create a post with a thumbnail

    ```bash
    hugo new posts/BikeRiding/BikeRiding.md
    ```

1. Open the post & add some interesting content

    ```PowerShell
    code content/posts/BikeRiding/index.md
    ```

1. Copy the image into the `content/posts/BikeRiding` folder and name it `featured.jpg`.

1. Start up hugo

    ```PowerShell
    hugo server
    ```

1. Click the toast, or open a browser and go to http://localhost:1313/

## To the internet!

1. Create a new branch to work on

    ```PowerShell
    git checkout -b postv7
    ```

2. Add files
3. Add a commit message
4. Push to remote
5. Create a PR

## Notes

- Two versions of Hugo - Normal & extended?
- Different themes have different install methods
- Blowfish has the option of configuring the front page to display posts under the about me stuff
