Return-Path: <andrew@aj.id.au>
Received: from homiemail-a39.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 744AE1A005A
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2016 10:45:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=mztso1En; 
 dkim-atps=neutral
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id 1E5B015007E;
 Tue, 16 Feb 2016 15:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=ZWTTxYzrKCNL281l72Fab
 vMiU+s=; b=mztso1EnYH03rlF3Vt03qzD53poo9XEqmxHwrd/0oPPy9AJA9O8C+
 Jjam2ZB2WbBNxiO6wRDNvbksg9sI4jBEZmv67cskNDv6Ja0sa0A+9JvO5oM4CYM2
 n3WATpBxNoceOjy/m+fS4uBCqrAk9i815M7EV3U6Ic5L0cha5qzzBo=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id E84EB15006D;
 Tue, 16 Feb 2016 15:45:39 -0800 (PST)
Message-ID: <1455666324.3022.48.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc-patches <openbmc-patches@stwcx.xyz>, openbmc
 <openbmc@lists.ozlabs.org>, Stewart Smith <stewart@linux.vnet.ibm.com>
Date: Wed, 17 Feb 2016 10:15:24 +1030
In-Reply-To: <201602120308.u1C38vNo004937@d01av05.pok.ibm.com>
References: <201602120308.u1C38vNo004937@d01av05.pok.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9Gemz5w13chHyx5H3COD"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 16 Feb 2016 23:45:43 -0000


--=-9Gemz5w13chHyx5H3COD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-02-12 at 03:12 +0000, Chris Austen wrote:
> Would it make sense to integrate gerrit? =20
>=20
> I love the review I'm all for it.  I asked for the issue because I
> knew it was merged. No issues at all with comments.=20
>=20
> I've work a project with gerrit and it seems that would resolve the
> issue with losing context

In a past life I (haphazardly) maintained (and used) a Gerrit instance
for several years. It has its pros and cons, but probably the bigger
issue as Stewart points out would be fracturing the development process
with respect to other projects in the OpenPOWER stack (along with the
problems of hosting/sysadmin/system integration).

It's convenient to have all comments visible against a line rather than
spread over multiple reviewers' emails, but from a feature perspective
a fairly large drawback was Gerrit's handling of patch series. Up until
recently management of a series could be half-heartedly done through
'topics', but the patches still needed to be submitted individually
through the web UI or by a combination of web UI and git operations.
There was a plan to introduce a feature to atomically merge all patches
in a topic, but I haven't checked on the state of that recently.
There's also some tedium involved when patches are split or squashed,
as the older revisions can often (confusingly) hang around in the web
UI until they are manually abandoned. A simple 'v2' does away with
those problems on a mailing list or github pull-req. But maybe these
are usability issues that we can work around/cope with? Overall I don't
think Gerrit would be my choice in this context.

Using the mailing list with patchwork and snowpatch (a patchwork CI
-related tool brewing at ozlabs) might give us github-levels of CI
testing infra integration without the need for github? That would just
leave sorting out email for non-LTC IBM people...

Andrew

>=20
> Sent from my iPhone using IBM Verse
>=20
> On Feb 11, 2016, 5:09:41 PM, "Andrew Jeffery" <andrew@aj.id.au> wrote:
> On Fri, 2016-02-12 at 08:15 +1100, Stewart Smith wrote:
> > Chris Austen  writes:
> > > Open an issue to migrate to inet_pton.
> >=20
> > Fixing such things in code review is a much better approach.
> >=20
> > For the submitter, it helps get quick feedback on tehir code, and
> > promotes a culture of examining your own code closely for things before
> > submitting it.
> >=20
> > For maintainers and those who hare going to have to debug the systems,
> > it means that it's *very* quick and cheap (in time) to point out odd
> > things.
> >=20
> > Opening issues is approximately an order of magnitude slower.
> For transparency, I sent the email despite knowing the code had been
> merged at the point I hit send because the timeline went along the
> lines of: Open my laptop for the day, start reading email, come across
> the patch, find some areas that I think we can improve on, write 90% of
> the reply, head to github to check a small detail, discover the patch
> has already been merged.
> Since I'd spent some time composing the review I didn't want to throw
> it away or spend further time to massaging it into a github issue with
> the necessary context, so I reworded the first paragraph to reflect the
> fact that it was already merged and hit send. This dovetails into
> Stewart's point below, primarily the one about github issues lacking
> the code context for the comments (without some manual effort). To be
> fair as it stands the github issue I created doesn't (yet) contain any
> of the context or comments provided in the email review, but at least
> that's available through the list archives (and can be easily linked in
> a comment).
> Maybe this should be a separate thread, but anyway: I find the mailing
> -list/github split a little awkward - is there a way we can improve
> this? Use one xor the other?
> Andrew
> >=20
> > I can hit reply, type ten words and hit send in maybe a few seconds. Fo=
r
> > an issue, you're adding a couple of seconds in network round trip to
> > browse to the project, go to issues, click create issue, then type a
> > whole description of the problem because you don't have the context of
> > what you're trying to reply to, and then manage the issue by adding
> > tags, target releases, closing it when something is finally merged (and
> > having the submitter have to open another pull request and keep track o=
f
> > it)... Urgh.
> >=20
> > Good code review provides a positive feedback loop of improvement to
> > code with a positive reinforcement at the end of "patch merged!"
> > Contrast this to the negative re-inforcement of filing bugs, of which
> > there is little to no direct motivation for the code author to go and f=
ix.
> >=20
>=20
--=-9Gemz5w13chHyx5H3COD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWw7SUAAoJEJ0dnzgO5LT5XjgQALMDEkV7DkywsQ79lvGJ3XI1
SUagmDoDKS6r3gBtRrIv900Ic+TSfD2VWw4by/SqBgyEIVi1tnN3Mu4PgCe94/JG
gYMM7X1MlcGb0A3BbITiEQMwC7Z92O893zgVbbPUfm7kb+JScSHwkd3NHhbaQTC8
8LNK7kRSCy85DYczyMIjLkqzYd4oUZYuLIu086fB1IEwdGiI2lxszZOHA+6QxPln
xVRy/yvfnAXPOtrqhILqEkT23LWtnfsGDMPN4Qt7AKt0X1JcF2LjN5jsILLJ/Z8N
erHYpz0B5nRhNGpJrpZllqNcGtaTf3qCmzzOiWKmzzO+u+5P6ifjRbMrn6wTsU8a
ORy5esaq0UROxF29H9uQ6wQC352wtd3Vd4zqL8iihCSBZpNDYsoiolyb7HzPfoJe
ZfH1dbDx+1uty6eUwpygGfX6/O9Tu//OjLgBz4nCDITzNiteHbF8eOU3tfHQRGhU
/8q0JjUJcBvCHM1bjQeX7qJLVjDkPDJ3z8/jtJWHuJetxHyKzDjPURDKar+6gy36
Pllh/KWFjP8I4qb6zzlJq2mRC0tt19rLwT5ZGx61KvbaSrLixXi5VXNraceMWnTe
09tb0C9bxKRKJpBDtsU0YmpUH9wpKcWYPjkap/kSsK9OwX9LA9Y80kKIgH2soN/d
b3X1rytgHDF5nkH3UYGw
=uJ1N
-----END PGP SIGNATURE-----

--=-9Gemz5w13chHyx5H3COD--
