Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7yw36060zDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 10:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=VolM6CPq; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id 8DF28300072;
 Mon, 16 May 2016 17:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=arskj/bdv34nHy4cjrtfs
 Oqo6w0=; b=VolM6CPqCXMgB3bO/bhcpMAo5x/Z1w7DsAsrpDuUqTNqLTsw5x7I3
 pSUmoJkIV90rHb5LufTW1wj6TLkeCTxUWwy0u6aA61dpudN4dwQKeqCXqkEsKSGt
 BOAoi6QadqfLyn5aG/irYqXpLNWoK9T9RsvFbQxfyeWd3AR8LCIU6A=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id 9B344300061;
 Mon, 16 May 2016 17:32:32 -0700 (PDT)
Message-ID: <1463445148.2703.86.camel@aj.id.au>
Subject: Re: [RFC PATCH openbmc v3 8/8] runqemu-internal: Configure tun/tap
 network for palmetto-bmc
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 17 May 2016 10:02:28 +0930
In-Reply-To: <20160516202028.GL19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-9-git-send-email-andrew@aj.id.au>
 <20160516202028.GL19968@asimov.austin.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FBxjjUC+udMDB9p489BK"
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
X-List-Received-Date: Tue, 17 May 2016 00:32:36 -0000


--=-FBxjjUC+udMDB9p489BK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-16 at 15:20 -0500, Patrick Williams wrote:
> On Wed, Mar 23, 2016 at 06:33:35PM +1030, Andrew Jeffery wrote:
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0yocto-poky/scripts/runqemu-internal | 5 ++++-
> > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/r=
unqemu-internal
> > index f461e9f..bdaea01 100755
> > --- a/yocto-poky/scripts/runqemu-internal
> > +++ b/yocto-poky/scripts/runqemu-internal
> > @@ -392,7 +392,10 @@ if [ "$MACHINE" =3D "palmetto" ]; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0QEMU=3Dqemu-system-arm
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MACHINE_SUBTYPE=3Dpalmetto-bmc
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0export QEMU_AUDIO_DRV=3D"none"
> > -=C2=A0=C2=A0=C2=A0=C2=A0KERNCMDLINE=3D"console=3DttyS4"
> > +=C2=A0=C2=A0=C2=A0=C2=A0if [ "$SLIRP_ENABLED" !=3D "yes" ]; then
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0KERNEL_NETWORK_CMD=3D$=
{KERNEL_NETWORK_CMD}"::eth0"
> > +=C2=A0=C2=A0=C2=A0=C2=A0fi
> > +=C2=A0=C2=A0=C2=A0=C2=A0KERNCMDLINE=3D"console=3DttyS4 $KERNEL_NETWORK=
_CMD mem=3D$QEMU_MEMORY highres=3Doff"
> Lots of stuff that is "palmetto" specific shoved in to the
> runqemu-internal.=C2=A0=C2=A0I think we need to propose a way to upstream=
 to add
> machine-specific gorp in here from the meta layer.

Yep, as mentioned in another reply I'll close the pull-req and start a
conversation with upstream.

Cheers,

Andrew

--=-FBxjjUC+udMDB9p489BK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXOmacAAoJEJ0dnzgO5LT5cYwQALYVHvLot482+4MbCcsAPziY
ZpTm661L+7/P7rCkYYDkoxfz9hra0h3fRWzB4xdzOqBBUeDepmBxPllCHlaUXAy+
/5+RTCJ+XUfUFO4xT0crvI6p4vruLYyYII1EGKrCp7IEvq3fbFd3MXDgBaSL1eCO
FashsFWirMUefGBEbxCnhwsvUJkdbi1igBEVQiaa6w549bXom1lIXrlfAS4UU5uN
tuZSIJKFwCc/KJMHehg5Ug/95fXYoBO6GwPWu1sODa9/zMICuSEILJ6sZHJxVagk
2j7kDRt4N7Y0oVgX+2fJQFbi6IVVys0mX1IFOfiNXb66IwCDDdrZneGt78JQYpIj
zGI83W+YlhDTyP0bD2QY+QRnsE0V14PqdG5MiX2vvptIco+/NryG/JuISb71eSO5
qP5gbgFL8zUKbrET6EbKJD1fm3vT4/zpvbEwcz5/gFv5CLqi9PH1htYonBe3nSIH
A3ZBOgz6JSd8/oz7GJDN7fX/HFNkwOQYr97tbME4pCyncMKiEj1PJlgZB0BO13q9
OFtzr1KPAAdWwzjTyPhuS/wX+CuhKH+DUiGLXRc9Xk+m2TYh7EmXy9AZpMnZkAV0
qi/B4yT1djGeh22k/ceN+xE9L2HtuayJGE7Kuoz4or4VAYkcz0yU2xIl5I9Gp0u3
fDtLVuSxf9dN5NCXPCja
=khtA
-----END PGP SIGNATURE-----

--=-FBxjjUC+udMDB9p489BK--
