---
marp: true
theme: uncover
paginate: true
backgroundImage: url('https://marp.app/assets/hero-background.svg')
footer: '@jpomfret - @sqldbawithbeard'
style: |
    li.blog {
        list-style-image: url('images/blog-logo.png');
    }
    li.github {
        list-style-image: url('images//github-logo.png');
    }
    li.email {
        list-style-image: url('images/email-logo.png');
    }
    li.twitter {
        list-style-image: url('images/twitter-logo.png');
    }
    li.linkedin {
        list-style-image: url('images/linkedin-logo.png');
    }

    #horz-list ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
        text-align: center;
    }

    #horz-list ul li {
        display: inline;
    }

    #horz-list ul li a {
        text-decoration: none;
        padding: 0.2em 1.1em;
        border-right: 1px solid rgba(255, 255, 255, 0.8);
        margin: 0 0 0 -6px;
    }

    #horz-list ul li:last-child a {
        border: none;
    }
    .grid-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 20px;
    }

    .grid-container  li{
        font-size: 25px
    }

    .name {
        font-weight:bold
    }

    .pronouns {
        font-size: 75%
    }

    .copyright {
        position: absolute;
        bottom: 8px;
        right: 16px;
        font-size: 18px;
    }

    #agenda ul {
        font-size: 21px;
        }

---

## Build a Hugo Website <br/> in Azure <br/> with GitHub Actions <br/> and Azure Bicep <br/> in Dev Containers

---

# Agenda

<div id='agenda' data-marpit-fragment>

- 09:00 – 10:30 – Workshop
    - Introduction to the Workshop
    - Tech stack introduction and expected outcome
    - Real-Life problems that will be solved during this day
- 10:30 – 10:45
- 10:45 – 13:00
    - 60 mins - git
    - 60 mins - GitHub\actions
- 13:00 – 14:00 – Lunch
- 14:00 – 15:30 – Workshop
    - 40 minutes Dev Containers
    - 45 mins - Intro to Bicep
- 15:30 – 15:45 – Break
- 15:45 – 17:30 – Workshop
    - 60 mins - Bringing it all together - deploying website with bicep
    - 30 min - recap

</div>

---

# Who are we?
<!-- can we add pics? -->

<div class="grid-container">
    <div class="grid-child">
         <div class="name">Jess Pomfret</div>
            <ul>
                <li class="blog">jesspomfret.com</li>
                <li class="github">jpomfret</li>
                <li class="twitter">@jpomfret</li>
            </ul>
        </div>
    <div class="grid-child">
        <div class="name">Rob Sewell</div>
            <ul>
                <li class="blog">blog.robsewell.com</li>
                <li class="github">SQLDBAWithABeard</li>
                <li class="twitter">@sqldbawithbeard</li>
            </ul>
        </div>
</div>
