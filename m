Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id AED801A08ED
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 12:14:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=I2BiUXxi; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 95B88103006A;
 Wed, 24 Feb 2016 17:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=3NJ7dQ3I3PI5/wVay37Tv
 FPZJg0=; b=I2BiUXxiLKe5kcSZw2c5UBMmMtYv5YLxqu64Ba8UJt8ZxrsYhQLK0
 q5nLCalVocdqeCnhGS4gaMJos2AXzMofrfQdV5oO52EkQfW9BJEXuO0s5COJSyN1
 Ju6VwazKChLl/q+E8I+KfMX8oUB+cM6thC5fc7lZq6uwOH0wX1+rWU=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 9DB511030063;
 Wed, 24 Feb 2016 17:14:51 -0800 (PST)
Message-ID: <1456362883.27420.53.camel@aj.id.au>
Subject: Re: [PATCH openbmc 7/9] initfs: Do not warn on missing jffs2 fsck
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 25 Feb 2016 11:44:43 +1030
In-Reply-To: <1456339224-27295-8-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456339224-27295-8-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-y6qqv5+uxBDvBxIzptBQ"
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
X-List-Received-Date: Thu, 25 Feb 2016 01:14:56 -0000


--=-y6qqv5+uxBDvBxIzptBQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-02-24 at 12:40 -0600, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> We know there is no command and we plan to have this the default.
>=20
> Suppress the message to avoid user questions and concerns.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh    |=
 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-ini=
tfs/files/obmc-init.sh
> index 7fc6587..f2fe938 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-init.sh
> @@ -119,7 +119,8 @@ then
>  > 	> then
>  > 	> 	> debug_takeover "fsck of read-write fs on $rwdev failed (rc=3D$rc=
)"
>  > 	> fi
> -else
> +elif test $fsck !=3D /sbin/fsck.jffs2

This is fairly minor, but would it be better to test $rwfst rather than
the path? Otherwise we're hardcoding '/sbin/fsck.' in two places (not
that I expect it to change). The filesystem type is the differentiating
factor here, and it's jffs2 that has no fsck (i.e. we don't expect it
to exist anywhere, let alone a different path). So maybe:

    elif test $rwfst !=3D jffs2

Thoughts?

Otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +then
>  > 	> echo "No '$fsck' in read only fs, skipping fsck."
>  fi
> =20
--=-y6qqv5+uxBDvBxIzptBQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWzlWDAAoJEJ0dnzgO5LT572EP/0USEdaRDSOslpwDC2VfUSKS
qb41tQOP/oErr/e6xf8FbWz7Q8mDn2u7zUS8cYCmFvPkJYEjDp5I/jFLqg/fkln2
mQmE6tAbNAi9nmOtibciCPAkfQNoZeaZ1/KRVssaAnaos8LKS3nepkmeT7O8z5KL
AOh8k06LcVHvgUJAW63nvRrw6IXYTxBsPF8mqzFPPoGSqLmKh/k0yzZDqc7dsb3H
Adgh6FtwTzoPtWxW0npfXH9sn90uOMqNfkG8OmyANlAzsANOhSVJKXgYU0LPBms3
QpfreeiAWVcpMBlLmV0OGfR8ts4rULMaDs/fuHtIvAT1QtI6qfJHW3C+H4Somnls
2I61NZmCDTxZZstByb7X7Dz/QPIpzZtQWqNqO5FDtmn83ICFp/wD5lH1RU+dOqBd
fDn2Mo+UDMUEpKPgNr5RmFsDAyDYE9I5+0aGhIwzHDWk6ol+Wx+o+P6pF7y0OzCO
xVFbJSSUAOzz0xzSgdM+P3ZrsFzjAgBOouzC3IaUG35O2wP7XvUtAnZo+0liP4iT
RYem0wlyyTUabRTEnghY59AV4nz60shtltwarkfud0qofjkFHqrHdPUvbYDsFcSI
E14qPZXKRW1v6i55IKR6dWY7AAwrzlVHrcV0hL0O7uEMsem4ekNUz7E5l6B7fNp3
cQWguXS3PiV+1SAOI2kd
=+U8w
-----END PGP SIGNATURE-----

--=-y6qqv5+uxBDvBxIzptBQ--
