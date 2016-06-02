Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rKxJ14dRlzDqmT
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2016 15:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=OFvDOaCg; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 706244B006F
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2016 22:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:content-type:mime-version; s=
 aj.id.au; bh=8Bhij2i+YeMhDwszwHEQ15qVFoU=; b=OFvDOaCgke26MGXvwPM
 lu3oA5OMvqXr467t+8fQx0uXv2uZWYXxTdD2Hrp37aCCGgcmSNstyrRALwSWP9ar
 wg1d8xX33Yh36hUlZvrkeCwkT0qDC3pR7VYW/Ji08D9YcYqJdFTCEuCWsfw3M2S4
 yxzInzPZffe2ga43Il1WnNNo=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 616184B0062
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2016 22:54:22 -0700 (PDT)
Message-ID: <1464846847.17842.61.camel@aj.id.au>
Subject: LWN: The value of drive-through contributions
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC <openbmc@lists.ozlabs.org>
Date: Thu, 02 Jun 2016 15:24:07 +0930
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ijrxvsfTpwWrEV3fE4VD"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2016 05:54:26 -0000


--=-ijrxvsfTpwWrEV3fE4VD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all,

LWN recently ran an article on community and drive-by contributions:

https://lwn.net/SubscriberLink/688560/9fa49b203bb0997d/

I think the article outlines some decent points to measure ourselves
against, so I've picked some out and added my thoughts.

* Provide a quick start guide

    We have=C2=A0cheatsheet.md[1] in the docs repository=20

* Provide an in-depth contribution guide

    Similarly, we have=C2=A0contributing.md[2]. We should probably expand o=
n it
    to cover the split we have in the contribution styles: projects with an
    existing upstream use the upstream workflow, OpenBMC projects use pull-
    reqs/Gerrit (when it's available). This last point has already been
    brought up on the mailing list in an exchange with Rick.

* Describe how the project communicates

    So we use email (this list) and IRC with #openbmc on Freenode. Neither
    of these mechanisms appear to be mentioned in the wikis or repositories
    of openbmc/openbmc or openbmc/docs. This looks like something we can
    improve with little effort.

* Have a code of conduct

    To my knowledge we don't have a code of conduct. What are the opinions
    here? Should we have one? If so, what priority do we put on it, who do
    we get to write it and what process should be used to develop it?

* Document roles and who performs them (leadership, subject-matter-
experts)

    As far as I'm aware, the best snapshot we have of this is Chris' email
    "Resolving the lonely pull request"[3] where he makes suggestions for
    the owners of the various repositories that make up OpenBMC. This
    information probably deserves a more permanent home if people agree
    with the list, however should that be in the docs repository, or spread
    about in the relevant repositories? Both?

* Provide a road-map

    Probably the best way to get a grip on the roadmap at the moment is to
    look at the milestones in Github. That's not a bad place to be, but do
    we have all the information there (e.g. are we doing a v0.9)? If not,
    is there anything significant that's missing, and if so, why is it not
    there?

* Document rules and process (transition from drive-by to core
contributor)

    As we gain contributors this will become more relevant, but it's
    probably manageable in an ad-hoc way at the moment.

Process suggestions:

* Tag "starter" bugs

    We have our "bitesize" label[5]!

* Mentor new contributors with code review
* Contribution SLA (review patches at most X days after posting)

    For both of these points I think the fact that Chris sent "Resolving
    the lonely pull request" indicates we had a problem. Have we
    improved? As pointed out in the comments on the article this is
    probably a hard one to meet, but it seems like a decent aspiration.

* Credit contributors in release notes

    At the moment we're pushing tags to github with no further fanfare.
    Having release notes or an announce email would be a nice touch, and
    would allow us to give credit where it's due. As an example, Skiboot
    does a breakdown of various contributions in its release
    announcements[4], as do many other projects. I'd like to see release
    announcements for OpenBMC!

* Follow up with contributors about their experience

    Again, probably something to aspire at the moment, but seems like a
    decent suggestion.

Overall, to me the article highlighted the need for documentation and
transparency to help bootstrap people new to the project. In the vein
of transparency there was some discussion earlier today about
refactoring the codebase and how to approach it with growing interest
in OpenBMC. At a general level I think the answer lies in having open
(on-list) communication as much as possible so all parties can stay in
the loop. If off-list discussions occur I think it would be great to
seen them summarised on-list to improve communication and transparency.

Anyone else have thoughts on how issues raised in the article might
apply to OpenBMC? What can we do to improve the experience for new (and
existing!) contributors?

Andrew

[1] https://github.com/openbmc/docs/blob/master/cheatsheet.md
[2] https://github.com/openbmc/docs/blob/master/contributing.md=20
[3] https://lists.ozlabs.org/pipermail/openbmc/2016-April/002677.html
[4]=C2=A0https://lists.ozlabs.org/pipermail/skiboot/2016-March/003028.html
[5]=C2=A0https://github.com/issues?utf8=3D%E2%9C%93&q=3Dis%3Aopen+is%3Aissu=
e+user%3Aopenbmc+label%3Abitesize
--=-ijrxvsfTpwWrEV3fE4VD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXT8n/AAoJEJ0dnzgO5LT5nOgP/39zJrXx7/NpETj0FgYhKsCN
648z/0ppWHkiV/w2+jvhTEhphQl1MQlBwHjKdE1VUpqJO80DU9eU03xtAULY7xCP
OEDmc45AYLDDxhO8lCTQGsdsxDd2BeeHvqmCFNK3C0Fu/9U92STfqHUq+fLz+DgT
LzmL9aLdGwrKvJay8OgSgaJFepucM8iKMel4CRxJBa5oKoJJdIjYHiH2n3svZ1N2
bWvX0d/75hJRjhJ2KAW3dPyplQIvO45pqRB6kkyBiTvRfvFvYojaoJXKCDs+gL6Y
O/LklSSqhFajilmAw5Gbqe5pYqsaQDn6tdCdg9m6bVxMrYBJWkxesIF+C5HY6ky7
Z6u9hfODCA1Vo4Of+uTIsPxxnSu25x31D5Iv9kk9QsYskEOmye9uXvyFvAX6l0iw
BKk0vt66W02K63EIwtzx260GsDPvNAvaXP017jHrFk0QYfK/p+RRbz+xmuFtr4sx
Djf0qA6qoEuOMW/kMOKwaiPT/312aK0/ifC3JskD6qWHcdtYLegZ7LVWHojuAYvK
ImfeJI4gGVJi1tM14CgwDohDQoZ2/leQrb8Ma11rmiTXXzs539S1s5HRWdYgAt0p
HQz5ygjy7mgWS8IPLoMqqTFMYzW3Gmbo55Taj5AJ3vPgdEBDu3kHY6ti/yBMIyVT
MNIwHy4KbLJw33dv4IGt
=5uHt
-----END PGP SIGNATURE-----

--=-ijrxvsfTpwWrEV3fE4VD--
