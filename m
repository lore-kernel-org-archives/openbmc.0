Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9KPD6Df1zDqGs
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 15:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=GLgZv06R; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id F26491030062;
 Wed, 18 May 2016 22:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=CqTaxGEZhwtFHaWSbLn7p
 bce494=; b=GLgZv06R97oMR4nAAzoUd79Rvhq4lG23rhnpz69A5/Xl8n6yUhqFB
 uEE4Ed/Wm7+ZaGcpz57hgxXGuffoW+g7dwLWaxW+eprL+lyJzjrpZxYamQ40q28I
 RafhNeSYRKVQ/dlDwhpIutSSgiuWCVfoYJWf8t3Yc4tGhOHpXmI+Hw=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 7A524103005E;
 Wed, 18 May 2016 22:29:01 -0700 (PDT)
Message-ID: <1463635726.2703.174.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 5/6] Travis CI: Bump to Ubuntu 16.04
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Date: Thu, 19 May 2016 14:58:46 +0930
In-Reply-To: <1462324208-11150-6-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-6-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-L6TiX6yCA2gPtRdmLFoO"
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
X-List-Received-Date: Thu, 19 May 2016 05:29:05 -0000


--=-L6TiX6yCA2gPtRdmLFoO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>=20
> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> ---
> =C2=A0travis/build.sh | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/travis/build.sh b/travis/build.sh
> index e330afd..6b7f0fb 100755
> --- a/travis/build.sh
> +++ b/travis/build.sh
> @@ -2,7 +2,7 @@
> =C2=A0set -evx
> =C2=A0
> =C2=A0Dockerfile=3D$(cat << EOF
> -FROM ubuntu:15.10
> +FROM ubuntu:16.04
> =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get update && apt-get upgr=
ade -yy
> =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get install --no-install-r=
ecommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> =C2=A0RUN mkdir /var/run/dbus
> @@ -13,7 +13,7 @@ RUN /bin/bash
> =C2=A0EOF
> =C2=A0)
> =C2=A0
> -docker pull ubuntu:15.10
> +docker pull ubuntu:16.04

Are there reasons for this beyond it being new and shiny? Whether there
are or not, can you please add a description of the motivation to the
commit message?

> =C2=A0docker build -t temp - <<< "${Dockerfile}"
> =C2=A0
> =C2=A0sudo cp ./travis/org.openbmc.HostIpmi.conf.test /etc/dbus-1/system.=
d/org.openbmc.HostIpmi.conf

Cheers,

Andrew
--=-L6TiX6yCA2gPtRdmLFoO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPU8OAAoJEJ0dnzgO5LT5HUQP/Ap7dihnLP9CbKTs19kyUv/b
zwuveo4amBG7pfG2dhFwbI9andXsKV9A1qbOvA8JfbwBbEl8VOiQtWgxL+K7eAnc
WRiODcsBq5EWkDyuWGQ1xJ5MmiSkO5s959EkOO3oCHkLH/VXHAwTZGalgrOsnHrP
bMplLHg64Y9yzbIySK2k3LdPlbit0ih4s+3uVIB/rfqrqeYrvHzjUncjJCqMtWa9
19Yr3QRGgxS37CAckoAGx3jM30QY8Mgk/K/LC9PN66rTOByqlnFonEJttBlwMvyP
u+9SVNPYSB+JjynVKsQoGL/ptFrqf+hBeFvl4qcibJD97ZebYvnF/0Kabrc7Ouct
LIReHQpBvC/1Evk7dEPwM/kCtKt22S+bDla0jqedYf4ImqKu/CPDJWNx5DtL/FmC
ThcGZI7/XEJftHB3NAeIvHpRNdI/Y72Pv3WTJsa5mlle7vNlyDH09aIHOv/1LS2f
SreDSNjYXQDLUG2bnRQ6UGLea7oQcjpXoiB1FETk3sHMDGv4aSKPqz3GjQqoC2LK
T6EbfhjCh6gvoyre28MaPzspYEwYlmFEXit5zIQ4lQTmccIPl1l51VaBUks3PAzh
P7fxkJ6aTmfyQOszbFFY1RSzhReCpG0/RRg00k51x2lNrlVsZshiabf+ijz4AGuY
nvXVO34srBWJcKl49HBP
=51k2
-----END PGP SIGNATURE-----

--=-L6TiX6yCA2gPtRdmLFoO--
