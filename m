Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFWg35VlLzDqFh
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 11:25:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Y60gw+3Y; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 40B4D6E06C;
 Wed, 25 May 2016 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=l2vN5fdVm5mKoXvb7lLOj
 Z0F1Dk=; b=Y60gw+3YdwULdFItpucyDMKvqtpKpYloJ8w8IAUtatKVXrUg/0MjW
 KqfHfExo/IGYemwsysdfsi/5s6qNAnrImMX73xS0XLpP1ARiQ/G+1Cy58zroEuJw
 i+j3fLvejwC7Dw00Saly0cWiBXBETPB3jHEgDLMvhPRB6ErZm0k6rI=
Received: from nat104.cor1.adl1.base64.com.au (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id 353856E06A;
 Wed, 25 May 2016 18:25:32 -0700 (PDT)
Message-ID: <1464225896.8430.21.camel@aj.id.au>
Subject: Re: [PATCH] Fix i2c-tools SRCURI syntax
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Rick Altherr <raltherr@google.com>, openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Date: Thu, 26 May 2016 10:54:56 +0930
In-Reply-To: <1464223026-8881-1-git-send-email-raltherr@google.com>
References: <1464223026-8881-1-git-send-email-raltherr@google.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pyBZr4tP1feDpaEVwm0z"
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
X-List-Received-Date: Thu, 26 May 2016 01:25:36 -0000


--=-pyBZr4tP1feDpaEVwm0z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rick,

Thanks for the patch. I've reproduced the warning* and tested the fix.
As an aside, the commit message introducing the .bbappend was pretty
terse, I assume the reason for switching the SRC_URI is that
{www,dl}.lm-sensors.org seem to be unreachable.

Separately, the means to contribute to OpenBMC is a bit fragmented at
the moment, and there are ongoing discussions about how to manage it.
As it stands for the openbmc/openbmc repository, pull-requests are the
preferred approach. More generally, for projects that are OpenBMC-
specific pull-requests are preferred**, but for contributions to our
forks of other projects the upstream workflow is preferred. So for u-
boot, the kernel and qemu, sending patches to the list is the way to
go.

* The warning was:
WARNING: Failed to fetch URL http://downloads.yoctoproject.org/mirror/sourc=
es/i2c-tools-3.1.2.tar.bz2http://dl.lm-sensors.org/i2c-tools/releases/i2c-t=
ools-3.1.2.tar.bz2, attempting MIRRORS if available

** Though the word is the OpenBMC repos will be using Gerrit shortly

On Wed, 2016-05-25 at 17:37 -0700, Rick Altherr wrote:
> Override syntax (FOO_append, FOO_prepend) doesn't insert spaces to
> separate the append from the original value.=C2=A0=C2=A0This caused the t=
wo URIs
> to be incorrectly merged into one and caused a download failure.=C2=A0=C2=
=A0It
> happens that the fallback in that case is to use the Yocto mirror so it
> kept working other than emitting a warning.=C2=A0=C2=A0Using =3D+ prepend=
 syntax
> correctly adds the separating space.
>=20
> Change-Id: I36f48cb53aa29ea9a4bde738c975784f6ce24250
> Signed-off-by: Rick Altherr <raltherr@google.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Cheers,

Andrew

> ---
> =C2=A0meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappen=
d | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.=
bbappend b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbap=
pend
> index bdbdc67..599394d 100644
> --- a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappen=
d
> +++ b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappen=
d
> @@ -1,4 +1,5 @@
> +# Prefer the Yocto mirror over the direct lm-sensors download.
> =C2=A0SRC_URI_remove =3D "http://dl.lm-sensors.org/i2c-tools/releases/${B=
P}.tar.bz2"
> -SRC_URI_prepend =3D "http://downloads.yoctoproject.org/mirror/sources/${=
BP}.tar.bz2"
> +SRC_URI =3D+ "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar=
.bz2"
> =C2=A0
> =C2=A0RDEPENDS_${PN}_remove =3D "${PN}-misc"
--=-pyBZr4tP1feDpaEVwm0z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRlBoAAoJEJ0dnzgO5LT5dskP/2xEuhTqbAvGKZ1kek6etC+F
dCFAzUQ4i04sD1k0yvu1qREKbdPmQg6joWxDqdY0RbMNVGFW2+47yAIdcURtWgXi
2Me9eCd2yUmMJxIsq2HtYTD1rJHnefb+rD0NvzmyEQHadMd8uHkXPtce59SEJ9W5
xSLCAqXT/28ROqTZQl0t3x2NFip8Fcn4vcGiIt+MCUooN9wLxWLOy8TEN/78e1G/
/mS0YKDfic2XF+pImctFeb0P8wptIGVqQEb4Zpq73GqCPPI2Twq+jwzZhJtBCqPJ
PNl0SitO8I64ilCYNCWl3OAaQQIgCCfV8VacjRhQlzcnLzM5oCkvVKOvFMJr1GBG
pB7gJh3zGs6ZAo5jPot9DVtTsuHI8j6zAS8KM5A909nBnt9wQGNXcrh5w7P3v15S
c6COhVvf1wVo1yZeudZzwq9lqe2DLXrSxaRwr9Mz6/0YGH6F89WB2vcxjeSi2aZe
NLttV+BiEj8AN3k1d+5M8sht8RsFSt/uGE/QsWloM81Luims402WITxlOyML1+A9
og4/BVKDg/2CHaLqYDHW6qSxHYYe37rATgLs+67aH075zC+0DHzqXaEMuatBNfYq
MgVOPT7/5DEs1IKDflb5/wDvHWheTdFK4IGYeU3iBq+qtyrCryj7osWV9nPpTe8o
B+27umWiUpPI6Yb3MOJc
=ZDya
-----END PGP SIGNATURE-----

--=-pyBZr4tP1feDpaEVwm0z--
