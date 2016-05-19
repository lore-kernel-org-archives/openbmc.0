Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9KQr1SfJzDqGs
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 15:30:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=IkARMcvt; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id 5B5B0300074;
 Wed, 18 May 2016 22:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=+z9IlT1XUcHb238MZtEPl
 Yl03HE=; b=IkARMcvty8AgWi0/hyHTpb48CRO5RYkppFamoGBrOmolJ1UIwsJg7
 OXindhVXa1iCAacSepwBNfTQ8LHcNNgCnRSPJeQ1WrsSyZf7ykmtUXcZDawukVMp
 JelhvjSakTYPMtYoy2m078aZ6NoOz1QmEiZDup29omHJ22S2xmDe30=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id C3F7E300061;
 Wed, 18 May 2016 22:30:24 -0700 (PDT)
Message-ID: <1463635820.2703.176.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 6/6] Add .gitignore
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Date: Thu, 19 May 2016 15:00:20 +0930
In-Reply-To: <1462324208-11150-7-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-7-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mUOwncOqzApY6SY5tb6i"
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
X-List-Received-Date: Thu, 19 May 2016 05:30:28 -0000


--=-mUOwncOqzApY6SY5tb6i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>=20
> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0.gitignore | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
> =C2=A0create mode 100644 .gitignore
>=20
> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 0000000..d0bbfdb
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,5 @@
> +bt-host.so
> +btbridged
> +ipmi-bouncer
> +linux/*
> +
--=-mUOwncOqzApY6SY5tb6i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPU9sAAoJEJ0dnzgO5LT5Ho0QAKEGJFDXxVGfb4jULJb131xE
G5R/dzuFE6eSNwxwFFt3ItibkWm6/haMHuOcAe7I3JQJBXdGIIR7vaApBjXFMhx2
Za5JBMOSCTdkQYSiwoPhqpAwJGRKBtcdW9to+IaA0AADzHRipeSq8AQQ7DMlCRJ1
VKBCO74B0UqH2jsLpwCwL9x04l7Dx9bKtM9gKO8H23myMc6CveKwZMrO3AHQyOV3
D+rgHFQmjF3EQdD3BgcjLfKMEe1FreRpt8Nh4R9PrCrOkNRbTAGmG1gpkozX77gu
YscqLCfEnZEhlE7DOQO0cJfmD7qecq6FbJTWU5fd42QoTTL3NmceS9g94zezrO+X
rFjpIr0uvFEb2cw+rBPmI868do6P/48qADpC8/PFrQrdVGPpOzYFf6Xqx30kOQ8s
mgiI7LSbAf4Y2AR3rOf/sE/CzA/PAo3iHelihVKshEcEmWgk33MQuvoxNWCxRL06
/jU3V2yJT4MAth39VkdF6vGf8x4CZ4jgyEX5uAFPHOQINdz40abuzPvvBrcYC+30
oawBkaA7845ETdFmgcXm+S14uURdGLiuC0Rao6jMphGmkgK2KpFwfWMIOtvIGOWf
gTnZOVAULK/3scEffUlqfnYwWcIwIgNdW0BQATo4mkrH1KzwFUXBrsD0CVOy6pGs
W8rTn425LwCDUOI5nqJI
=BuGD
-----END PGP SIGNATURE-----

--=-mUOwncOqzApY6SY5tb6i--
