Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rt2Tj5q6MzDqLd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2016 09:25:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=R5Cz7Kl+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=oTymNClB; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7C036947;
 Sun, 17 Jul 2016 19:25:08 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Sun, 17 Jul 2016 19:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=qPU9N
 qx9r+kbd5viottE7m39Kmk=; b=R5Cz7Kl+lhunoagU6QvdvaOB7anx9wo/kUjE0
 8y62Cscw2GHD7kQNsFobkWmJM+Z2Pgqd2rM/Mfttuh1Z4I5Fb/05Bs1VSTVEDa0c
 +ZiYx4pNhFEbEItXWQ9iPlSF27f93EEulJQ0NQ+NotJhmrnhkz6n5oRsKAQtMiKS
 3Wo9Vc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=qPU9Nqx9r+kbd5viottE7m39Kmk=; b=oTymN
 ClBItYfDsb2nocg2hz80pNNKqDGxjtYHcnZAuO877Pci1XUfc3NmpaDAcIT6/5D2
 NjH/RJ7UUcP5ECccLxkPlpB0zcZZqfltvSXYLw1akvlgOsd3s4D08UP5TgMcmZCp
 921kWPEkYFXisNP7MznRJGF20s9ms1CdcFFZI0=
X-Sasl-enc: fmXGapJsuzZMVWKvdPXNNOFwoleiQIvwer3rPekTo9GU 1468797907
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D25BCCD81;
 Sun, 17 Jul 2016 19:25:05 -0400 (EDT)
Message-ID: <1468797898.954.35.camel@aj.id.au>
Subject: Re: [PATCH docs] Enhancing instructions on QEMU
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org, 
 Chris Austen <austenc@us.ibm.com>
Date: Mon, 18 Jul 2016 08:54:58 +0930
In-Reply-To: <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
References: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
 <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-cZ9n+KlLL/hz2tTwbp1n"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Sun, 17 Jul 2016 23:25:15 -0000


--=-cZ9n+KlLL/hz2tTwbp1n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-13 at 15:20 -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> Added step by step details on using QEMU in both a virtual
> bridge and tap environment.=C2=A0=C2=A0Latest features of QEMU palmetto
> integration now allow for uboot flash support and ftgmac100
> device support.=C2=A0=C2=A0That means you can start the qemu session
> from uboot and run the real ftgmac ethernet device.
>=20
> Signed-off-by: Chris Austen <austenc@us.ibm.com>
> ---
> =C2=A0cheatsheet.md | 59 ++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 59 insertions(+)
>=20
> diff --git a/cheatsheet.md b/cheatsheet.md
> index 873fbf9..37a9c60 100644
> --- a/cheatsheet.md
> +++ b/cheatsheet.md
> @@ -105,6 +105,65 @@ qemu-system-arm \
> =C2=A0
> =C2=A0To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `q=
uit` to exit.
> =C2=A0
> +## Using QEMU With Network capabilities
> +
> +In an attempt to get a palmetto working model with network capabilties a=
 fork
> +was created.=C2=A0=C2=A0The plan is to merge it back in to the qemu repo=
 but for right now
> +the steps required to build, launch and verify are as follows.
> +
> +Compile a Palmetto flash image via Yocto and locate the file...
> +>build/tmp/deploy/images/palmetto/flash-palmetto
> +
> +```
> +git clone git@github.com:legoater/qemu.git

I agree with Joel here, I don't think we should be patching the docs to
point at someone's "private" tree. It's not great that openbmc/qemu
isn't yet suitable for you, but I'll try to resolve that as soon as I
can.

> +cd qemu
> +git checkout aspeed
> +mkdir build
> +cd build
> +../configure --target-list=3Darm-softmmu
> +make
> +cd arm-softmmu
> +```
> +
> +### Use a bridge device
> +Using a bridge device requires a bit of root access to set it up.=C2=A0=
=C2=A0The benefit
> +is your qemu session runs in the bridges subnet so no port forwarding is=
 needed.
> +There are packages needed to yourself a virbr0 such as
> +```
> +apt-get install libvirt libvirt-bin bridge-utils uml-utilities qemu-syst=
em-common
> +```
> +
> +```
> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> +-drive file=3D/flash-palmetto,format=3Draw,if=3Dmtd \
> +-net nic,macaddr=3DC0:FF:EE:00:00:02,model=3Dftgmac100=C2=A0=C2=A0\
> +-net bridge,id=3Dnet0,helper=3D/usr/lib/qemu-bridge-helper,br=3Dvirbr0
> +```
> +
> +### Use a tap device
> +When running in an environment that does not support you having root you=
 will
> +need to forward the model ports.
> +```
> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> +-drive file=3D/flash-palmetto,format=3Draw,if=3Dmtd \
> +-net nic \
> +-net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,h=
ostname=3Dqemu \
> +
> +```
> +Now you just need to redirect to communicate...
> +```
> +curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST http=
s://localhost:2443/login -d "{\"data\": [ \"root\", \"0penBmc\" ] }"
> +```
> +or
> +```
> +ssh -p 2222 root@localhost
> +```
> +
> +There are some other useful parms like that can redirect the console to =
another
> +window.=C2=A0=C2=A0This results in having an easily accessible qemu comm=
and session.
> +-monitor stdio -serial pty -nodefaults
> +
> +

At face value I don't think all of this information belongs in the
cheatsheet (I haven't tried out the commandlines or verified their
behaviour against the text, so I may send a follow-up email along those
lines). I'd suggest a separate qemu document if this is the type of
content you want to add. My aim with the existing cheatsheet entry was
to provide the least amount of supporting words for the commandline to
have context, and explicitly avoided step-by-step instructions like
"how to build".

Given the openbmc/qemu repository supports booting from the flash image
the existing cheatsheet commandline should be updated. Again, I hope to
address the differences between openbmc/qemu and legoater/qemu soon.

Cheers,

Andrew

> =C2=A0## Booting the host
> =C2=A0
> =C2=A0Login:
--=-cZ9n+KlLL/hz2tTwbp1n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXjBPKAAoJEJ0dnzgO5LT5Bu0P/20/MMj5g4S71nSVUOFdXNNQ
fOc1GrwXkQgwf9cBdQwfeZcNUHmBFmpseDR1aQXbaSrhncAEEBhBS4E7MzxW+9QD
a1Wiotv6UHmZCmF967czgof+tCGx2Bk9B1ffxPCEFRUoFjQx6MprZv6xAz0fz+Up
SSOCby6KQiX+/xqA7jzIcuh47AH1OGk3HoXhPxDVH64/gKF2IDrZ9369nnZbVQZa
9zLqA116KP6p572R8uTfIeaprohsIQqzc6SX03VY0w9eq6wAMnYA/4AgUEmygulD
g9ZJSTGbZMb83LNp1M5i6j2hdw0waJImm4h0B40r/k1edo7PUk8H/8g4YFOvViyi
Juk9F4bIzPOg1006H2W6PR54KsOkbVj78JHoPuIs+f47/uEmXcEKFuDwnC9ghtQO
2ATj5lFWn778BsxYtJlzbLCZOtr9XtG9FlEG5UILJiq5LJhSQ3Er92WbjxJqaAmh
FYwjfHT6IcrEPAnYqCIV6MP1lOOWIC5FHQUePTaprKbm+se6T/GLN8pbpPa3eQmD
6mFI/tJ8QKdbfRRjDupfUEiD/GupchO4inEyBQOoun5zAgOXBlh1LajTrQ6Cv4wi
xvufFWUVtgj3yDDtA+/1qZ/mYTQ0PGKBOE/XNS099Ah1r427uXNM5qWN9y6UED1u
gdOvZhCZAI0Pbd4gVIIF
=Tm9X
-----END PGP SIGNATURE-----

--=-cZ9n+KlLL/hz2tTwbp1n--
