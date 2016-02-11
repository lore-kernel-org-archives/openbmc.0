Return-Path: <andrew@aj.id.au>
Received: from homiemail-a101.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 681731A004B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 10:09:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=wMYb3ZXJ; 
 dkim-atps=neutral
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id 860DB117E06C;
 Thu, 11 Feb 2016 15:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=OLmHazcpxmbO0X3C3ZS0M
 72AmPM=; b=wMYb3ZXJUepVr0xF85Z98SOD3uyz3rNBUolLryCJG0w0pDkdNuNbN
 LazQPhgTHZ6gE/BsfNZ/wFm6sX7zvYR6zAZnCbwHto5LQ76pe+VNd9CVke+wePbv
 grmm1PfMOt5NSRJwikv6Owke+rIPyjA+ALVvc0WlTuOdDb1rs0+Uac=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id 1649E117E065;
 Thu, 11 Feb 2016 15:09:30 -0800 (PST)
Message-ID: <1455232163.2576.27.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Stewart Smith <stewart@linux.vnet.ibm.com>, Chris Austen
 <austenc@us.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Fri, 12 Feb 2016 09:39:23 +1030
In-Reply-To: <87vb5vne33.fsf@linux.vnet.ibm.com>
References: <87io1vq04t.fsf@linux.vnet.ibm.com>
 <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
 <201602110544.u1B5ilIu004589@d03av01.boulder.ibm.com>
 <87vb5vne33.fsf@linux.vnet.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zpe2wY1tcqpe5JPscbtA"
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
X-List-Received-Date: Thu, 11 Feb 2016 23:09:35 -0000


--=-zpe2wY1tcqpe5JPscbtA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-02-12 at 08:15 +1100, Stewart Smith wrote:
> Chris Austen <austenc@us.ibm.com> writes:
> > Open an issue to migrate to inet_pton.
>=20
> Fixing such things in code review is a much better approach.
>=20
> For the submitter, it helps get quick feedback on tehir code, and
> promotes a culture of examining your own code closely for things before
> submitting it.
>=20
> For maintainers and those who hare going to have to debug the systems,
> it means that it's *very* quick and cheap (in time) to point out odd
> things.
>=20
> Opening issues is approximately an order of magnitude slower.

For transparency, I sent the email despite knowing the code had been
merged at the point I hit send because the timeline went along the
lines of: Open my laptop for the day, start reading email, come across
the patch, find some areas that I think we can improve on, write 90% of
the reply, head to github to check a small detail, discover the patch
has already been merged.

Since I'd spent some time composing the review I didn't want to throw
it away or spend further time to massaging it into a github issue with
the necessary context, so I reworded the first paragraph to reflect the
fact that it was already merged and hit send. This dovetails into
Stewart's point below, primarily the one about github issues lacking
the code context for the comments (without some manual effort). To be
fair as it stands the github issue I created doesn't (yet) contain any
of the context or comments provided in the email review, but at least
that's available through the list archives (and can be easily linked in
a comment).

Maybe this should be a separate thread, but anyway: I find the mailing
-list/github split a little awkward - is there a way we can improve
this? Use one xor the other?

Andrew

>=20
> I can hit reply, type ten words and hit send in maybe a few seconds. For
> an issue, you're adding a couple of seconds in network round trip to
> browse to the project, go to issues, click create issue, then type a
> whole description of the problem because you don't have the context of
> what you're trying to reply to, and then manage the issue by adding
> tags, target releases, closing it when something is finally merged (and
> having the submitter have to open another pull request and keep track of
> it)... Urgh.
>=20
> Good code review provides a positive feedback loop of improvement to
> code with a positive reinforcement at the end of "patch merged!"
> Contrast this to the negative re-inforcement of filing bugs, of which
> there is little to no direct motivation for the code author to go and fix=
.
>=20
--=-zpe2wY1tcqpe5JPscbtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWvRSjAAoJEJ0dnzgO5LT52UoQAJtuIKHqFvxDYkQLrQzDESag
BrWRTuAkCGTq5o76l+QqGJxYwmtFNqvUYGqwUzH818X3tyWAQCmKGgXbKrG4rMyn
NBivrJDsjBSsj854tcc7rjftlzHMgOPM943p2ajGb/S7r3DExWQGzkMc28A4y4cP
zERCSlLdJ08H4+gkvXsXoxz9xR9nYMvRxtelZB96mQEz2wnQFyVEVRegybaqTn2N
ph6iqrB9XIq7PCiC2cy+P7/ZMWV0OE7fKlhg8g6qH8JExPFHvo+DV+6/miWIMhKa
Stf1YF/8wFJkBPz+pr/PuYkfCMcG3LHYwNjTmgwhagDqg56pDrCwFrG20dCMjXKx
BRlVE1zMbeZBxXLec35f4Dv+Z20YpopijOQQnRM3nc2l/uFAL7cEKflUbsv5MqfR
zGWkRzGeX/+m/MdlqwqoSZHcMAkssjiNQdNv42Dyq7UuSmQlFTyBGYYIqJdCN25n
VTEJl2Q7laoJy0DS3cpntAdEmJ8DwylszXqIQ5QxBea1hfRjCHHRASeNkf0KyRLG
mhhgE2zy7mMOeibp5S2QS0S8rsKVZpfA/E4jzwAtomktv0VJPVlJBflIN7GheQq9
LcJds9LvBnujlq/bkhaPx6vha0eSPJ9nnAp4ePOlw6WpOu0C5P/ZY1vr7hiRXKYu
uxq3XAg0iqQjAcRkcEMj
=3TrP
-----END PGP SIGNATURE-----

--=-zpe2wY1tcqpe5JPscbtA--
