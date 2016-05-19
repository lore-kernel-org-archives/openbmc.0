Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9GKx69GdzDqCh
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 13:11:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=f3z853VS; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 0F87D7EC064;
 Wed, 18 May 2016 20:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=zkn3o3CGyqx7SjC+YrSy9
 fR5LEg=; b=f3z853VSa0HFvH8tiII+uYEZ4Pguv07XgXMDD0+cd8pEWb08NvhG3
 uWsbCouo6UAkQ925iofcWIBhJmSi+/1rWXDSphJs2zFngrWQ0UAGFXfgUlsXLwnX
 ONex2492Y1Iesg1p3rMKE1SJ/B+SPUI9Ps+PJdzoM4f9xWeN7cxoUE=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 08D267EC069;
 Wed, 18 May 2016 20:10:57 -0700 (PDT)
Message-ID: <1463627449.2703.140.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 1/6] Initialise variable to avoid using it
 uninitialised
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Date: Thu, 19 May 2016 12:40:49 +0930
In-Reply-To: <1462324208-11150-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ft3wtV8l8Vdq3NM9JreR"
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
X-List-Received-Date: Thu, 19 May 2016 03:11:02 -0000


--=-ft3wtV8l8Vdq3NM9JreR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>=20
> Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> ---
> =C2=A0btbridged.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/btbridged.c b/btbridged.c
> index fe692bb..3e261a9 100644
> --- a/btbridged.c
> +++ b/btbridged.c
> @@ -489,7 +489,7 @@ static int dispatch_sd_bus(struct btbridged_context *=
context)
> =C2=A0static int dispatch_bt(struct btbridged_context *context)
> =C2=A0{
> =C2=A0	int err =3D 0;
> -	int r;
> +	int r =3D 0;
> =C2=A0
> =C2=A0	assert(context);
> =C2=A0

Building with this patch and native GCC* gives errors:

    $ KERNEL_HEADERS=3D../../linux/ast2400/include/uapi/ make
    cc=C2=A0=C2=A0-Wall -O2 -g -I../../linux/ast2400/include/uapi/=C2=A0=C2=
=A0=C2=A0=C2=A0btbridged.c=C2=A0=C2=A0-lsystemd -o btbridged
    btbridged.c: In function =E2=80=98main=E2=80=99:
    btbridged.c:590:6: warning: =E2=80=98r=E2=80=99 may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]
    =C2=A0=C2=A0=C2=A0if (r < 0)
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
    btbridged.c:342:6: note: =E2=80=98r=E2=80=99 was declared here
    =C2=A0 int r, len;
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^

That's weird, because the note isn't relevant to the function of line
that generated the warning. However, the 'r' defined in=C2=A0bt_host_write(=
)
suffers the same initialisation issue. Initialising it gives me a build
with no warnings so maybe it's worth doing that here also?

Otherwise,

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Cheers,

Andrew

* $ gcc --version
gcc (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413
--=-ft3wtV8l8Vdq3NM9JreR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPS65AAoJEJ0dnzgO5LT5fk4P/ifK8xx2SYgD5qHEHsKpHQqO
sUioR8wwKL/OkXrnnrWQ6EeB5mr7oI6gGWQHblqXrIR15mY2aCBlJaT8pUFP0ZQa
KEvxibYhL8WmxUMoFZ8OX3O1pUR25HbREl3i8TCQFsfv3+mdEvW+Ur7+vibbT/bD
yTgMGiH6K47A0htv6xqMMGZ2Xa5wUtM6OokKB/3Pv6rj95aFOxH4pC4MoYV/b+lM
97CHzLJK62yAZNXbqfuCyODAt7t2PTM9WlaX5LKUV3E9Qc8O2X1vEjJ2xm5Q6qKE
3m6S5v3fBFNDHKn2P2Sp6G5rx1GT9NX0BmtdVeWkI7YRGZbO3Gk785OhhNZ9KWO4
flghUihGw8Qk8ePHeA61yoM1a65nFyToGn1q7HsIxWB9Wb/1jHrB9s34MZE/99wj
qWrxUtq1iIh6mROLOoxAooeMmI3XqVOUHsvHE/xR0AGplnxtkcYOyS3RrC0/1+B+
PFZFFKU2T22WPkzty7r3/BUH+GOaIiL1D7VFl3FSLsWdOq61YufswEpDrecWYUkC
DOFPwu1K6OriMXTBAh3ZNuJxCYjE9FMd1zoxZcYlgPFs4YvLCCkNv9Knfk/6glra
L/QHd6hMcmeAIpm01Vz5/iGFl8RHcXJab7W5R6/vUptu79YBV5Z2VEt6WJ8IlQ0i
MC4FvMajk2bMXzXxzbQd
=9nuC
-----END PGP SIGNATURE-----

--=-ft3wtV8l8Vdq3NM9JreR--
