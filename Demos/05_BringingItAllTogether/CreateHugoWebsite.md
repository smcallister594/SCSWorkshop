# Hugo

Build a hugo website within our dev container.

![image](https://user-images.githubusercontent.com/981370/192148499-e5fae9d1-0fb6-4fc3-ab64-e33a323131f1.png)

We can ensure hugo is installed and ready for action by checking the version:

```PowerShell
hugo version
```

Something similar to this will be returned

```Text
hugo v0.104.0-c744dbd6edeeb27288c9dd67e0eb92951f911397 linux/amd64 BuildDate=2022-09-23T14:32:56Z VendorInfo=gohugoio
```

## Create our website

1. Create a new hugo site

    ```PowerShell
    hugo new site SouthCoastSummit
    ```

1. Choose a theme from https://themes.gohugo.io/
    - [Beautiful Hugo](https://themes.gohugo.io/themes/beautifulhugo/)

1. Install the theme - this depends on which theme you use, but most make use of git submodules.

    ```PowerShell
    cd SouthCoastSummit
    git init
    git submodule add https://github.com/halogenica/beautifulhugo.git themes/beautifulhugo
    ```

1. Open `config.toml`

    a. add the theme

    ```toml
    theme = 'beautifulhugo'
    ```

    a. Update the title

    ```toml
    title = "Jess & Rob's Super Site"
    ```

    a. If you have a domain ready set the base url (Azure Static Web Url??)

    ```toml
    baseURL = "http://azure.com??/"
    ```

1. Create our first post

    ```PowerShell
    hugo new posts/WorkshopDay.md
    ```

1. Open the post & add some interesting content

    ```PowerShell
    code ./content/posts/WorkshopDay.md
    ```

1. Start up hugo (with drafts enabled)

    ```PowerShell
    hugo server -D
    ```

1. Click the toast, or open a browser and go to http://localhost:1313/

## Notes

Two versions of Hugo - Normal & extended?
Different themes have different install methods
