Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E9C131A03BD
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 00:43:09 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445434986801864.65102948403;
 Wed, 21 Oct 2015 06:43:06 -0700 (PDT)
Date: Wed, 21 Oct 2015 08:43:04 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Recommendations on how to interact with github.
Message-ID: <20151021134304.GR13316@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WOTjKnJ88wpJKlWH"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 13:43:10 -0000


--WOTjKnJ88wpJKlWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There have been a lot of pull requests that generate a very messy patch
set sequence.  This is my recommendations on working with git(hub) to
avoid this.

Cloning a repository:
    * Create a user fork of the repository you want to work on.
        - https://github.com/openbmc/<repo> , click 'fork' in right
          corner.
    * Clone the repository.
        - git clone git@github:<user>/<repo>
    * Add original repository.
        - git remote add github git@github:openbmc/<repo>
    * Change the URL of the original repository to prevent accidental
      pushes.
        - git remote set-url --push github dont_push_to_team_repo

Starting new work:

If you have an outstanding pull request, it is best if you can frame
your addition as a separate item from your first pull request.  If you
know you are working on something entirely different, create a new
branch for the new work.  This prevents the case where you have two pull
requests in process and one pull request includes all of the other pull
request, which leads to confusion as to which pull request is suppose to
be reviewed.

    * Fetch from the team repository to make sure you are up to date:
        - git fetch github
    * Create a local branch from the team repository.
        - git checkout -b <workitem> github/master
    * ... do your work ...

Pushing work for pull request:

You should ensure your work is up-to-date before you create your pull
request.

    * Fetch from the team repository:
        - git fetch github
    * Rebase your work on top of the latest.
        - git rebase github/master
    * Push your work to a [new] branch on your github repository.
        - git push origin HEAD:refs/heads/<workitem>

Updating your pull request to fix review comments:

When you get a review comment on a specific commit, you should fix that
specific commit.  You should not create a NEW commit with review fix-ups.
We don't want to see code that didn't pass review in the team's git
history at all.

    * Checkout the branch you did the work on.
        - git checkout <workitem>
    * Make sure it is up to date with the team repository.
        - git fetch github
        - git rebase github/master
    * Do a rebase interactive to 'edit' any of the commits you need to.
        - git rebase --interactive github/master
        - The previous command will bring up an editor with a number of
          lines prefixed with 'pick'.  Any of them that you want to
          modify to fixup code reviews you should change to 'edit'.
        - You are now in the most scary part of git: a rebase.
        - Git will stop at the first commit you asked to 'edit'.
            + Edit the files you need to for the code review.
            + 'git add <files edited>'
            + 'git commit --amend'
            + 'git rebase --continue'
        - Repeat the previous step until you complete the rebase.
    * Confirm the code after the rebase still compiles and works.
    * Push to your github repository.
        - git push origin HEAD:<workitem> --force
    * Your pull request will automatically update if you have correctly
      pushed to the same branch you originally made the pull request
      from.

A note on commit messages:

I would strongly recommend reading through these two pages for advice on
what [good] commit messages should look like.

[1] https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
[2] https://wiki.openstack.org/wiki/GitCommitMessages

--=20
Patrick Williams

--WOTjKnJ88wpJKlWH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJ5ZoAAoJEKsDR8wtAMEZOcAP/jgg1P3G57EA0u3rdcKdnYOl
hH0Y2ceI/n79a8V98UTGcjZSPp64PBmwOSXZUZ54tAXAgc1sXZvDlNHYU5jsApQf
Mvk02WoroTAcPBlL+AFwbrcG+AYZCQ9hW9ujV9sZc8qGn2WM4KuXt7FPBQYYz3Q/
uTJn6ZEFabTueeoP8OJOYXLK/o3/ozl3vRjDHJS0BkYZl70fROXdl43HadpenLOQ
OA8N1qqB7LiY5huSxQda8vuUJzd4GvrZtTJP3ML57yCiBbwyIO3qe2y1qcolXnyI
nOaXIWLjufWvF2/NV8WGbIMUPp0YXTR35nLMvWeGI+60COqTF7AS0x0zmm1koBqO
gJ6Z2TDq8v2JC5lTClzc0hfa58XN+cYy6I5YD+WKxaQzc1wreqR6CJQ7T04csydS
X/YQ7Jl6bx7/XXLQQtmyzZkzcGIf4oaUUIGOoOYL4w7J3o/lP/mSHxU9FU7wMznC
6mfsANo+Z8giOCIpSxAou1rriLVzRcodquYDGlXd0EnMmpDzZb4rK37khpxlXmd4
DS8Uak5B50ezWwLfC9e4MdZ2fsqc7WMcTcnOBcraUYBISMvYpMZdIV0kNShuw78M
dZv/vO97T9GnwZ//eeiJlgT3trlitHM0k4L40AtJy9TrZQmpCnZ2+EQhlmPl0CsF
SrCEH17LBvdmxFjXqdpQ
=JwWY
-----END PGP SIGNATURE-----

--WOTjKnJ88wpJKlWH--
