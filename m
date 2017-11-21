Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PjE0A+uP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="scAOp+SY"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygqb43HPQzDrSP
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 13:41:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B76620DF6;
 Mon, 20 Nov 2017 21:41:00 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 20 Nov 2017 21:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sXDmaa2TQAPeuQLJ2LEQCOQqSBIpctwyH24o0QqAF04=; b=PjE0A+uP
 Hj6GXw9yRprdOciiJOXbzwxCujnRUzEu1WALshrUp3f6HcklG6XNOt2+kMwapMDW
 QBwobhR6mtaL1NoqAxSkd852wyk9f9bfxffRsgRgeu4KHQDSSdN8TYkwD4h3Fsvc
 ZzM+Zfz+/ix4qWSebschFkKausIdRLXM9pqO+c4AVi8uW5FyasAl/5gNKRPBGuC4
 mRtkAwNrBIp5DXHgpPS8FEOpzVfkmdNkZq6dCChimGjty8RgXD3INEyoGPSs17j1
 Vg+qlygWhLOY3GZFHPxYMx/AQp2CiMblP1DjEq6DENDuOJYyiJc/savCx2TTNNpe
 0Dw9g5O1Bh7UUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=sXDmaa2TQAPeuQLJ2LEQCOQqSBIpc
 twyH24o0QqAF04=; b=scAOp+SYRGHscclmpT0Zhrejr3UtRnVBXQ+BH4KU5umNn
 hMz7ddt6jLczrx18nlMQHagZTooLkYRs8iIssCzvKG+NWqo8PAQtvxKPvg9j7M1t
 wb/K/GQjLLLLFYgjBHWNCrTIsAP/m7aC9pjFvcYay2A6e0CDK1yk0q6QhZVcho0B
 vd4ciw2A8PeYwtfpA0QGf36hu0K/qS6xknlmmHNdTCvg70oR+8P8mvXoF4sBcIxN
 eMfvgKn0EmRvQVV2WB3dCRihyB2juReGFPqFItDWbByRfNo2FOwyRLM9Y28jCvuz
 CD7J3p6F88p3+e2QImsQtgqaZHfMzkXLtUaS1lfIw==
X-ME-Sender: <xms:PJITWtZJbauQg9jhZLEXTvLjOo4lB3YzCHeIU71J-Q4uVEZuvvaI2Q>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 363177E13B;
 Mon, 20 Nov 2017 21:40:57 -0500 (EST)
Message-ID: <1511232052.4287.95.camel@aj.id.au>
Subject: Re: OpenBMC community telecon - 11/20 Agenda
From: Andrew Jeffery <andrew@aj.id.au>
To: "Tanous, Ed" <ed.tanous@intel.com>, Stewart Smith
 <stewart@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 21 Nov 2017 13:10:52 +1030
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4A5C8D@ORSMSX114.amr.corp.intel.com>
References: <785099C4-5D19-4341-9F40-3B6A3404EEC8@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F4A58B2@ORSMSX114.amr.corp.intel.com>
 <873758zdai.fsf@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E82169932F4A5C8D@ORSMSX114.amr.corp.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-YcWQ8C4vTgpJidkgYUwD"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Nov 2017 02:41:08 -0000


--=-YcWQ8C4vTgpJidkgYUwD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-11-21 at 01:04 +0000, Tanous, Ed wrote:
> > A minimal starting point would be to run every code repository through
> > Coverity Scan. Setting this up with travs-ci isn't too hard (we do it f=
or parts of
> > host firmware today).
> >=20
> > Efforts to limit the damage could also be good, like strict SELinux pol=
icy. After
> > all, much of the current design would work quite well for that.
>=20
> I meant more along the lines of "would the community be ok with this"
> more than "is it technically possible".  I think the tooling story
> has come a long ways in the last few years, especially for open
> source tools, but I know any attempt to limit what's allowed tends to
> lead to controversy, so I wanted to see where we all stand.

I don't follow your points here - limiting the damage by defining
SELinux profiles for the distributed set of applications doesn't strike
me as anything that's controversial. Stopping applications from doing
things that they shouldn't under the guise of them "being allowed"
despite it not being intended behaviour seems like a stretch. Can you
elaborate?

Also being relatively clean with respect to Coverity seems like a
decent goal - we certainly shouldn't be using patterns that trigger it.
Why do you think this would be controversial?

Cheers,

Andrew
--=-YcWQ8C4vTgpJidkgYUwD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaE5I0AAoJEJ0dnzgO5LT5Yx8P/2N1+V00TSFfr8DKmEfqedwU
4gfsVsae52sG9P3nT4VijD+oFZz4PQ2UcP8mrJu56FcgcrrjC1XIUlYykFIrFz1+
BFUx2gAovAEWCOJ5UlhaqY9VMJedrxr0ZHNK77ze/knBmD0lFH8ALFdxzSIHPaGi
TZi+MVp8wpG8EQukXID0ZCjhQRaWTMdrr774J1K0g4bVqR2Q3uevLt/wn1OI+f6D
zuDf2G0kNXXGYgkmLVI9tKxc4KDTmQHucZ3SDpU6N+6kZU+JaKxqtm+6puhIUwYc
/jctBxqJhiHaECF2gJd95Key/iWE50EAx/9SYjFwNFU/Mg7vA2VsKd8EmRVlvIZ+
SZAF+M0umpycovlXgCT1yo0xTp5o59M+GkzibhsDembgKWHPHLhCK43mDQ2eh2MU
TX4ODiSomhrwnv9Hsyf77v9wdeBzzrJTjH1PalE87kebrVCRVm/PeOcDSK3kE9UK
xOKeGAn70O+EAr8ncKGct5u6UUNGfF3lM7iOSAVb0d+8jqBJgzEcTHBAI/R09Mrb
KcwOW/ikTEzyFZNpikwvB0h0EHOutibw0zYDsNifcMW8WXHZqkZYLIkUxGFpVz8b
X/EoEULmM7UFZ+T8G+AtDabP9F4fyUIfAQOeV1tPxq/MA7EDhytguQKBBqxAUN4o
uoL7W0xHHFoNWiFSDcAq
=3rQD
-----END PGP SIGNATURE-----

--=-YcWQ8C4vTgpJidkgYUwD--
