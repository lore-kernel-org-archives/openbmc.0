Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rKrhX1s9XzDqW9
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2016 12:26:50 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1464834405762302.029792853426;
 Wed, 1 Jun 2016 19:26:45 -0700 (PDT)
Date: Wed, 1 Jun 2016 21:26:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Roadmap for AST2500?
Message-ID: <20160602022644.GR19968@asimov.austin.ibm.com>
References: <CAPLgG==KjbSt766V7ztyOJfhp9=tg7ZDOboO+45Jwzu3CL7gjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WTbgq2twYBxfsYA6"
Content-Disposition: inline
In-Reply-To: <CAPLgG==KjbSt766V7ztyOJfhp9=tg7ZDOboO+45Jwzu3CL7gjA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 02 Jun 2016 02:26:52 -0000


--WTbgq2twYBxfsYA6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rick,

Joel has been working on the AST2500 support for the kernel. I believe
his current working tree is here:
    https://github.com/shenki/linux/tree/dev-4.7

We are currently using the u-boot from the Aspeed SDK without much
(any?) change at all. I think this is his tree for that:
    https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500

We are also in the process of creating the AST2500 BSP recipes to pull
this work all together. You should see some commits in the next few days
for this. In the worst case, it will be up by the end of next week.

One area of need we have is taking the u-boot changes from Aspeed and
getting them cleaned up, applicable to upstream master, and sent
upstream. Joel and Teddy from Facebook have both done a little work in
this area, but I think both of them have been busy with other tasks.

Have you looked at support for Zaius' NIC for the BMC? Some of the
systems use an NCSI shared interface and some have an independent PHY.
This has tended to be a "problematic" area for both u-boot and kernel.
If you're not using an already-supported interface there will be code
you need to write there. U-boot isn't required but is handy for netboot
in development.

I don't have the roadmap ready for the userspace work we are planning to
do. There is a significant amount of work we have planned over the next
N months for a machine we are developing in a parallel time-frame with
Zaius. I am really striving to get this all out on Github so we can
coordinate this work with your team, but had some snags that I am
working out.

I am going to be in town next Wed 6/8. We can discuss some more on the
userspace plans face-to-face. Hopefully, I can get our plans for the
next few months published in Github by the end of this month.

On Wed, Jun 01, 2016 at 12:54:51PM -0700, Rick Altherr wrote:
> For Zaius, Google and Rackspace's Power9 server, we'll be including an
> AST2500 and plan to run OpenBMC.  I have a few people on my team available
> to contribute to AST2500 bringup and Zaius-specific OpenBMC development.
> I'm trying to figure out what all needs to be done, what AST2500 work is
> already being done, and where my team's contributions can best be utilize=
d.
>=20
> I know Xo Wang (xow@google.com) has already been talking with some of you
> about the kernel work needed for AST2500.  What is needed in Yocto and the
> userspace apps?  I can easily put together a AST2500 bsp layer but without
> a corresponding kernel, that's not particularly useful.
>=20
> Is there a published roadmap somewhere?  Where do you see the biggest need
> for help?
>=20
> Rick

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--WTbgq2twYBxfsYA6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXT5lkAAoJEKsDR8wtAMEZ5cgP/3RHIUNO9I1+RngUZJ9dY7LR
IgK5U19LjLvqIGoH0lCzyVI4e9mlgFBVoAOEIlqPmQXsQ4mQCu4misg4ztOummSL
1BQ4quiOolWUIurD5vmTIiVU7El9J8gd3aC3BAU+nVjFLZA3bK2Jk5ieVjFyYLzB
cTnXmtpxN+jerG9jCJSIrvpOmrsYOSYfwTm0C3CsZEzApLX+q7ooQbpRrpi0o6I7
gbTMUUWScpizIs1bAVzO3HWRwXyGetIrnrrNuAUlZfY8OCeG/MfPOM4RZ3avdInn
l5NvIbW3RqVQMi8ZzO/F/EDy1J2M/SzbEINEPjE9/X9s/+Yzpvje1lWg0FgyM4rB
qgV2lfDyPJVGVHaczYD9i9z5GErkeR8JZZ5w0q7Jo+8zI6X++MUHaExERSNU+YK/
soVRnbm7wEvoqiqOljFbVVxDehQ+/AJ7qVomhMjdSzKGSI4+jjw7Uj9vd+q+1ElT
1XXEprbZxub1MMzffxIChOgN+hqfWMvxmxnlKckDKK+XNsTQUWabbza50bwhoNFt
6RZrtvYFMj5VtWLyoxhz3ptfaDuyiPSTYvYFXGxugzsVwJalcNF2wMbKAkZcx/ZH
Gjm0KIVxYeWMsPhp+Wh7pHZdrfFs+WUE4Lb0bBKyxAfGiKCaNCybXFsPIFPPuA27
Ix3bveeolrY6MnI3JJWO
=M2gQ
-----END PGP SIGNATURE-----

--WTbgq2twYBxfsYA6--
