Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT4Wc4D1pzDqqK
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 09:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RcCf2KYO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nPkyupvA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF54921E56;
 Thu, 10 Aug 2017 19:45:29 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 10 Aug 2017 19:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=orP2oZfgf+jAJXfQQq9Xt1FOsunvysx1xCGPv5jR7
 KI=; b=RcCf2KYOeSl7u1bl28vUAA+m+V7zruufcAhiaAd9y9KH1Xv12vRzxJ8/y
 WH9Zi3Iym9xXp4g9JNAr/Fi6tHfs3QQ/1zjweM19oxAydMpkFf2cawIi6kasKngR
 0VZbhkR9Rf5GIqodcglccOnKdpKpUSVbNCMtNgdN0viIocXKQgGH3naktKVH/biI
 fTnPp3WPHpb6dpNdCwUDIFT7oEzhxPRhR79cLbDSpLIRkMmSZEeDAwbMPqPk59ur
 lW+Txn5UDRfOhGpmhBsgIv2W2Pg/pF2jVhEso3NotiTEkk4LWBohExe6u0+0N2rq
 2JKHIWRxn56i92Oide5hbUtsXp40w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=orP2oZfgf+jAJXfQQq
 9Xt1FOsunvysx1xCGPv5jR7KI=; b=nPkyupvA+zwnRVduJCWFCCmD/9kUuLFWUd
 jj0aSjxvKaD/SEm2U7iZesuZBskjny2+f0Khw1gE0FLsSAZUiroM6CnyLOKr6AMV
 fUXEJ6qR/sPskQZDnPKakinmBrKushqTID3Udhm96q+rthXDKJR/V5GRIk4SKL8x
 Fj9TWWpWk2XZWEkoIMIJ7kAyvlqp438mWNelYCcCMUfzhQBtpuEXmuNqXOJ3/MDq
 VgiAtlI0bGgIU5GJfv0hNmGZhh5tyB3Khb8GAvGHeiAZz77yLILPd+1UU75BnNoC
 OG6qrG6u6+4UmfnH1TEJygCovkp8d2YRMkBnVTX/dx+BnEV4QknA==
X-ME-Sender: <xms:GfCMWU1e7AVkWu7ALpD21CmSIaCJmCkbrXzjZp-nR3O_BB82iC6ZLg>
X-Sasl-enc: suLavpaJGEkqHjmhq5IeVTfWWbWtebkyDX4PuL+6HB/i 1502408728
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F0787F987;
 Thu, 10 Aug 2017 19:45:27 -0400 (EDT)
Message-ID: <1502408722.7946.21.camel@aj.id.au>
Subject: Re: AST SOC gpio pass-through support
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Yong Li <sdliyong@gmail.com>
Date: Fri, 11 Aug 2017 09:15:22 +0930
In-Reply-To: <CAPLgG==GHvy__Lq7su=J6i=Uqi6VmuL5_2oL8iwVCepEk6_M0Q@mail.gmail.com>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
 <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
 <1502359910.7946.17.camel@aj.id.au>
 <CAPLgG==GHvy__Lq7su=J6i=Uqi6VmuL5_2oL8iwVCepEk6_M0Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gYWywXm3F2jcti41caRc"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 23:45:34 -0000


--=-gYWywXm3F2jcti41caRc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-08-10 at 09:11 -0700, Rick Altherr wrote:
>=20
>=20
> On Aug 10, 2017 3:12 AM, "Andrew Jeffery" <andrew@aj.id.au> wrote:
> On Thu, 2017-08-10 at 17:01 +0800, Yong Li wrote:
> > thanks for your quick response Andrew!
>=20
> No worries!
>=20
> > i will read these info deeply. just a quick question, is it
> possible
> > to enable/disable the pass through dynamically after kernel
> boots?=C2=A0=C2=A0how?
>=20
> So there is the concept of runtime pinmuxing[1]: It's possible for a
> device to have several pinmux states that can be configured/selected
> from process context.
>=20
>=20
> On Quanta Q71L, the hardware strap is used to enable pass through so
> the power button works even if the BMC fails to boot. The BMC
> firmware is expected to disable the pass through once it is ready to
> take over. I believe I sent the patch upstream to allow pinmux to
> modify the strap register for this case. That is, pass through is
> disabled when the user exports a GPIO to userspace.

Ah yes, I forgot we added an exception there. It does require that the
strapping is used for the configuration and not the alternative SCU
bits that are set by the GPIE{0,2,4,6} functions, which were enabled by
the devicetree snippet I sent previously. If the mux is requested with
the GPIE{0,2,4,6} functions then the runtime pinmuxing is really the
only choice.

Yong: What is your use case? If it's similar to the Q71L as Rick has
outlined, then please ensure the strapping is set correctly in hardware
- setting it in U-Boot doesn't really gain you much unless you fail to
load/boot the kernel.

Cheers,

Andrew
--=-gYWywXm3F2jcti41caRc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZjPASAAoJEJ0dnzgO5LT5tOgQAJkXpiKqLDykUatHDUp5+fDu
b/6sM8FH6U99HXKtFTU0bazLOEOQXj2pAO5hBANP2afb5nG9ydmGeW4NFueKZ48u
gJZvqsrMfLSt38vSjsgDzzrvRDPd78MkqDOMiBfN0vCE/0DA8sPzQiaLjqq2BvQF
zJD7iQkv1tJ7Df4OqeupyPgbFAmI+ASnimRUn1hVK+mwSPWhr5Hfj/z42UYnCY7+
a9i0n1OYbAqBnF9TOJeX2ORKwo6mGwxHsqT5JG85R7KnGQHpyjtgCErKM8o0FaQS
NEzmRJZvHZzyXbjOwMOLaAfcxqke/ABt4IXTZ3mc27UuCEYtS9f5S4QBPFMKWfvX
MRJg+e3Ra1+bbiUY/H/CG62/nJDFCJ8uzaGlEqyPQB3WFeT3zRiUWL6ZwKtXY2ft
ECf6IqSGJM8/esMBwreSompr1uMKIpcflntsn7WNcVjjJjKS2/Kq/+H5kpgRVjh0
ktXd0kvSvHjeJfOxqQWk4CjwTpZeYfjbw1XUXiBb1RQ8/7H94B0XSBon1b5VnakN
o1b6MXwcVEDsY0CvJ4o6VHePmHJCPzzSnhxTBsvGl37fM12L2/NTK+CEnNuny9fL
jiiORBzFjHzd5teSRqjl4ROsj7yXJbQ2yTLJ5pvC5vlLVgnma2WQOMpLG3L6OVgj
4FxfNzpacutpJqc/3oqR
=CuN8
-----END PGP SIGNATURE-----

--=-gYWywXm3F2jcti41caRc--
