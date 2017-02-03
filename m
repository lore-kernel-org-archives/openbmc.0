Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3ng2vFSzDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:30:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ie/6OOmu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZpMoBjoB"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A780320B13;
 Thu,  2 Feb 2017 23:30:28 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=d4aAwcMnfTnzWc3L4Y7Y+JUemfQ=; b=Ie/6OO
 mubAbWMKuIQThp7ZnAvX2pxAoeZnNDCYNuR8Y49mDlVFqEt1bVYnbbjaBroUzJ0a
 DPsgWmJlOs8rPYLsLCbbPWhoE38+H5rHwEgtG+2/u1A6n78S+qTg996vIfSfzEjE
 QCZmNRdWyM44AISaZpwUOY3EfLZuXX9TkG1BA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=d4aAwcMnfTnzWc
 3L4Y7Y+JUemfQ=; b=ZpMoBjoB1CSjCvDapa1BvKMG4RGFHL7C0EOi8q/cmuE42L
 XcufAh9H+7N07vU8Se63m7K0cEW3S6J00kOlYxSaRF5/e0247DMvqwWkFII7VCac
 hnYamJkAkGhbjv3wd3i3JDeX3c5wHNrKougwgBdK2v21UOrylqCea0BK01Z3M=
X-ME-Sender: <xms:ZAeUWBfeZEvn7B19sh7R2HDIvy1tRJOCdhH3Pjs7m1SBnzPRDvUlxA>
X-Sasl-enc: uG2SrCRtvlP3mi0T5xCH47jrwW5WX3+FIO7PZ+Fn3eHt 1486096227
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39F007E06B;
 Thu,  2 Feb 2017 23:30:26 -0500 (EST)
Message-ID: <1486096223.7271.7.camel@aj.id.au>
Subject: Re: OpenBMC Kernel Development Process
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 03 Feb 2017 15:00:23 +1030
In-Reply-To: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
References: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yPS5xGlA24BENewzmLBE"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Fri, 03 Feb 2017 04:30:32 -0000


--=-yPS5xGlA24BENewzmLBE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-02-02 at 15:44 +1030, Joel Stanley wrote:
> # Processes
>=20
> ## Patch submitters (wishing to have a change included through this proce=
ss)
>=20
> =C2=A0- ensure that patches conform to base-level quality guidelines
> =C2=A0=C2=A0 - no warnings from checkpatch
> =C2=A0=C2=A0 - does not introduce errors or warnings, for specific defcon=
figs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed_g4_defconfig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed_g5_defconfig
> =C2=A0=C2=A0 - boot test the kernel using the qemu simulation environment
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - At a minimum, the system should boot to =
a userspace prompt of
> the OpenBMC userspace
> =C2=A0- submit upstream first
> =C2=A0- submit proposed patches to openbmc@lists.ozlabs.org
> =C2=A0=C2=A0=C2=A0 - This version of hte patch should contain "[PATCH lin=
ux
> <branch>]" in the subject, where <branch> is the name of the current
> OpenBMC development tree

It should be noted that if you're cherry-picking changes applied
upstream to backport them to OpenBMC you should be wary of `git send-
email` Cc'ing people, e.g upstream maintainers, who have Signed-off-by
tags on the cherry-picked patch.

To avoid this you can do: `git send-email --suppress-cc=3Dsob`.

Separately it would pay to do a `git send-email --dry-run` beforehand,
and check the result.

Andrew
--=-yPS5xGlA24BENewzmLBE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYlAdfAAoJEJ0dnzgO5LT5l0cP/1AU7gY+1JUN/9M+4/PCdy3L
kguTvXcy2M+ocXmq3wcFr2I0jGohKkog+I/7JCN4DHs1QimqGxSUiIXchw/WgGIb
CY0QlRr6DSSoJYOkiTvjmV3u7IK1OUrShqHWm5CQxFXn487IRtJHHkVV/Z+g+jML
B4yToPCk4v1M2e0Hbpclbuxy5DM3Xk7rQnrpLUXKTTmYMNAgoKVjcX3nMMXCTa9P
nx7PJusZg2eriRvWlFPKdcvHAXeFmKG3a+COJXngdSdzHrGACt/KoQZNyYAhKQxF
qsl2K1yefTa3LqBkNgnlCSKU8PHvvvQlLPLHiC8w0z4LSLbbUkMrSvqueVkHzRM1
KEpdDq7hcaNjwUEooxsJWTCvU324rFEqkX1Sye3xGP7h9/EkrroI6tLFazGyuBi1
1+RknGLAAxwlGQVMUwMaaebPw5zyrue3N6I4k4OvtQzCzniFMG7/HRVuK0SID8kT
VEM3AUJ60L13BEfx3rb9Ytp8+51iHCFgyK7F2zlgXkvaMml7SYg7wwa+oMK1Xg8N
ZezTffcrDrzFOpIfHz6X/nTulNy6dKI/R0IqKtwIrqjv3STyDlwRRco8jsuRTneP
QvIzii7HrFdBDlRK80qlw/mUJUc3X5X5E1fO3rodYwINfKJbqBv4AWW0sVlXWrkB
eT6N6Tjb1LBLp/AUurct
=SUtW
-----END PGP SIGNATURE-----

--=-yPS5xGlA24BENewzmLBE--
