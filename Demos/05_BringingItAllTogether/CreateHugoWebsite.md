# Hugo

Build a hugo website within our dev container.

![image](https://user-images.githubusercontent.com/981370/192148499-e5fae9d1-0fb6-4fc3-ab64-e33a323131f1.png)

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

1. Create a new hugo site

    ```bash
    hugo new site SouthCoastSummit -f yml
    ```

1. Change directory

    ```bash
    cd SouthCoastSummit
    ```

1. Convert Hugo site to a Hugo Module (this creates the go.mod file)

    ```bash
    hugo mod init github.com/jpomfret/SCSWorkshop
    ```

1. Open `config.yml`

    ```bash
    code config.yml
    ```

    a. add the theme - this is using hugo modules (some themes use git submodules)

    ```yml
    module:
      imports:
        - path: github.com/CaiJimmy/hugo-theme-stack-starter
    ```

    a. Update the title

    ```yml
    title: Jess & Rob's Super Site
    ```

    a. If you have a domain ready set the base url (Azure Static Web Url)

    ```yml
    baseURL: https://happy-ocean-07fc83203.2.azurestaticapps.net/
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

## Notes

Two versions of Hugo - Normal & extended?
Different themes have different install methods
