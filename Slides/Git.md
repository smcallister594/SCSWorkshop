---
marp: true
theme: uncover
paginate: true
backgroundImage: url('https://marp.app/assets/hero-background.svg')
footer: '@jpomfret - @sqldbawithbeard'
style: |
    #git ul {
        list-style-image: url('images/git_sm.png');
    }
    li.blog {
        list-style-image: url('images/intro/blog-logo.png');
    }
    li.github {
        list-style-image: url('images/intro/github-logo.png');
    }
    li.email {
        list-style-image: url('images/intro/email-logo.png');
    }
    li.twitter {
        list-style-image: url('images/intro/twitter-logo.png');
    }
    li.linkedin {
        list-style-image: url('images/intro/linkedin-logo.png');
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

---

# Git


---

# Agenda

<div id="git">

- Forking & Cloning
- Keeping in Sync
- Making a change
- Oh Git! Wrong branch
- Rebasing your branch
- Clean up

</div>

---

