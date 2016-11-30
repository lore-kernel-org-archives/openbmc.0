Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT0sy1CfvzDvp9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 11:00:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="S2qgL8PI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FH89zb1x"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A8D7208BA;
 Tue, 29 Nov 2016 19:00:18 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 29 Nov 2016 19:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=623iEtRPwh7J4chFpXriqU/+GI8=; b=S2qgL8
 PIl4f18Zws1Qed+987IgV6QQ6avxN9kVUCW4AFsL/TP3585gBoUq558kCxfsAJtH
 VinezM0eUfMs5ZqwlMo7IJw1o6RbR+4PQJ5JVnCfFkCCPEfSQXX3AACwYYHfYdPD
 CmuTRxUjcR8cXpqVcDRJJ9SF1i5yYLskLX9lc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=623iEtRPwh7J4c
 hFpXriqU/+GI8=; b=FH89zb1xeWnfpOqtUsp5x8XXpfyINF9B4P3XPf7rohwwV2
 h3DzGN9m7u3SsDDSn1aPN8Q4cQfItek1vQENxuTyFCrXw0kvzBvdCVY62TUF92px
 utWUFj4ATU1HfWlFyrT+d6LbgST5hhjXVAX30pmT91HK9nKYOmPxz1jgvqC6g=
X-ME-Sender: <xms:khY-WNJIq02oOiqle9UoHkx84YrMp_b1-ODLo9rLanVlpONMvc7MQg>
X-Sasl-enc: 8Vn9kUnp7d4YCmlOAhDS7ZwJKyEzxmhGpxCMXo3pL4Fb 1480464017
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 486FF7ED6D;
 Tue, 29 Nov 2016 19:00:17 -0500 (EST)
Message-ID: <1480464009.2503.91.camel@aj.id.au>
Subject: Re: Palmetto GPIO pin configuration for Voltage Translator Control
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 Nov 2016 10:30:09 +1030
In-Reply-To: <CAA0LjjUSPqRb452Up-VR4xHTWs3OP2EoZsqmYmW+rsFS3Law1Q@mail.gmail.com>
References: <CAA0LjjUbmBkFU2YDpvSK01uBGrLyK_H2Dvt3UdG-LC09uWg_9w@mail.gmail.com>
 <1480378504.2503.87.camel@aj.id.au>
 <CAA0LjjUSPqRb452Up-VR4xHTWs3OP2EoZsqmYmW+rsFS3Law1Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-xBy7so5pwqYx3Y0K1e+R"
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
X-List-Received-Date: Wed, 30 Nov 2016 00:00:23 -0000


--=-xBy7so5pwqYx3Y0K1e+R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 11:55 -0600, Christopher Bostic wrote:
> > On Mon, Nov 28, 2016 at 6:15 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > On Mon, 2016-11-28 at 14:56 -0600, Christopher Bostic wrote:
> > > Note that this is not directly related to the GPIO hog updates that
> > > are in process of being added to the palmetto device tree.
> >=20
> > So, to clarify:
> >=20
> > The patch I sent to the list a week or so ago isn't in the process of
> > being applied in any way for two reasons:
> >=20
> > 1. Per Joel's reply it will not be carried in the OpenBMC kernel tree
> > 2. The OpenBMC bitbake build process *already* applies it to the kernel
> > during its build process, as of September. The patch is carried in the
> > OpenBMC tree[1].
> >=20
> > [1] https://github.com/openbmc/openbmc/blob/a103a3723b4329225d9316393bf=
0620027d02aa6/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linu=
x/linux-obmc_%25.bbappend#L3
> >=20
> > > This issue exists without that change.
> >=20
> > You can confirm the presence of the hog at runtime either from dmesg or
> > sysfs:
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0# ls -1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/sys/f=
irmware/devicetree/base/ahb/apb/gpio@1e780000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| grep h6
> > =C2=A0=C2=A0=C2=A0=C2=A0pin_gpio_h6
> > =C2=A0=C2=A0=C2=A0=C2=A0# dmesg | grep -i h6
> > =C2=A0=C2=A0=C2=A0=C2=A0GPIO line 382 (H6) hogged as output/high
> >=20
>=20
> Hi Andrew,
>=20
> The hog messages weren't there prior in my tests.=C2=A0=C2=A0I was using =
a
> slightly older dev-4.7 kernel and the Palmetto dts file didn't have
> the hog definitions.

"slightly older" is a vague, but it shouldn't matter as the Palmetto
DTS in openbmc/linux repo never had (and never will have) the hog
definitions in it.

>=20
> > If you are booting your own kernel built directly from the OpenBMC
> > kernel tree with your patches applied and are still seeing the pin in
> > use then that's certainly odd. The existence of the hogs patch can be
> > ignored and we need to investigate what is going on.
>=20
> I have been booting my own kernel from a forked version of the OpenBMC
> kernel tree using the bitbake build process.=C2=A0

I strongly suspect this is where your problem lies. You are using
bitbake to build the kernel, and I presume have modified the recipe to
point to your local kernel tree. If that is the case then bitbake is
automatically applying the hog patch for you no matter what you try, by
my later comment:

    > However, if you are booting the kernel produced from the OpenBMC
    > bitbake build process, then seeing this pin in use is expected
    > behaviour as the hogs patch will have been applied.

I was trying to make the distinction between booting a kernel built by
you directly invoking `make` in your local *kernel* source tree vs
indirectly building the kernel by invoking `bitbake` in your local
*openbmc/openbmc* source tree.

> =C2=A0Maybe I had missed some
> updates.

I don't think any would have been relevant.

> =C2=A0=C2=A0In any case, today I updated to the dts file with all the
> hog definitions and removed only the H7 pin lines.=C2=A0=C2=A0=C2=A0I see=
 that H7 is
> not hogged and that I can successfully grab the pin.=C2=A0

H7? Or H6? Anyway, my hypothesis here is that hogs patch no longer
applied, perhaps due to a conflict, and as you didn't hog the line in
your change you are free to acquire it through the GPIO API. It feels
wrong that bitbake would continue in the face of the patch failing to
apply, but that sort of wouldn't surprise me either.

> =C2=A0I wasn't able to
> do this before.=C2=A0=C2=A0I'll back up to v4.9-rc1 and see if the proble=
m is
> resolved there as well.
>=20
> Still not clear to me what was grabbing the pin prior to this.

=46rom the above, I still think it was the hogs patch being applied by
bitbake.

Andrew
--=-xBy7so5pwqYx3Y0K1e+R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPhaJAAoJEJ0dnzgO5LT58iYP/3HaR734Ae219sU79N2NFpyM
sTTOBdNOwtq4w4yC2dXOXLpJiB6BuQfTW3CvTGmgnpW03J2TP4NVTlISJz+FcXh4
xTa5DUU51UI7HSN5YV/6FL1dFpHM13U5hYgDT9Hujk1Ugnm970TTpdVOZAVxoNkJ
WLF5pCtv4RDnsF/vBuNPvnxDs/LSW12H1CGumNQdFHEoG9N1ycEOFW/EHANxxrXX
v+fv/i86Vft1i/Zqj2OGVw1t+mjI9tUYYLnzCCfoEBL1PDF1ssaqK5rwWInvs0hf
U5CGYVghg/p/+CAF3qZdkoPyAnzZ3m7j/6p6E2V4nUn1hUyD52jQVDKdnmNRkGAs
5j3W42GxZMqnATm9e22qfotgIi5FkWQ9YYTIUdCzthve0JDdlmiQhy1kZ/38CfM0
G/UGiYZ2Efo/9bD6MugGumhwk7yiqC8GGpWlPBeSRl57vGQXmpaznEdHkvdxTvh+
gXoIUNlgE3jJ6DinBlfOBUIlfSGB751AtBq8ljT7IOB7re9y3P5Jqc9gRe2Q4Zg/
bOovmnjP0D/uX6D/PhfWJkhpL+rLf77bLOVZ1tGcIsDt4aFXcDvwCT4F/2jEQdhs
xxXNUaFoPctt0kMWRAiXHc3BqFzHrjskMS+aG9OhStBp/D8BXQ2aoeB8dn1lv516
lR1r0rUycA79+N8CWRt6
=UHX6
-----END PGP SIGNATURE-----

--=-xBy7so5pwqYx3Y0K1e+R--
