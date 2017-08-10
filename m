Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xST446lhQzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 10:08:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Vwws7F8U"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qtk7z8tN"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E3DD921D5C;
 Wed,  9 Aug 2017 20:08:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 09 Aug 2017 20:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=X7WDWgF6kGzxbAU9zqwdzLWZPYHaSwFUNAxWsRscT
 XI=; b=Vwws7F8UNKZ24tU1l+AaK/ppUyoIgWwSx+E4Tf+2avWmM5uhwFiAhnNQq
 f+NIgg+zwMMZJZEJeu74yHilxp8kpaFvRivHGDtfXhVNbhta9g+jQiNKtuGwpo75
 U5ZoGtivbH2W4jASb6JT1vRQzX6R9W/nUqcUvnMBJ2cXMCS8dWzite3tCRydCkEn
 jiBgpv650uBCExuNmNy0eXsSa7fY0z2a+A88rydQaMHz7U32tjmPlvnG95/tKhcv
 ChzYWOnUA86dm7ZbgoNX5KlBoWdEWffNUL3zPzT+Dz/y3APjEkAzrdXNGAt8z6Rf
 8ZArzqmksO0B5hEohI5RF4X9J8asA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=X7WDWgF6kGzxbAU9zq
 wdzLWZPYHaSwFUNAxWsRscTXI=; b=qtk7z8tNI+zuSeRJWFAaq59jmNG5wQJgzF
 YWxINtz6F7mCToamPThd2AwxXu8swVYaCHhXs9s7Po4QcoRwmzR0k7tdRowcELBT
 uluDig9JmygGllE4SJy09AEEJxjohqaSvBlc3rEn15GJ0GF3E74VYob8EOtUK2Vc
 sOrMQ6HR69UVO5QQjey0nOhcA6WHw56xZKr6FNDPJLKKXIM/F3a18XsmdqO5rJEN
 aHT5sbWhSYOZwmbIqvxy5i6BUDT9o/edh6/BrMjNAulzTFCIhaa9rIUznHRAvVLG
 XwUbM3Kh7pCZvlnqCYcotLtTPwLxWAzs0vhVELnoxDAdA5KuTQqw==
X-ME-Sender: <xms:4aOLWU2RBCnis1l8CXPsGgU63AcUD25fw85AkF37nb2i9hmkMVEaLg>
X-Sasl-enc: d2FZaB81YONESdpr7MaLq4GqGybQhb6QvXa8RnCzkC2O 1502323681
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF5C67E5DF;
 Wed,  9 Aug 2017 20:07:59 -0400 (EDT)
Message-ID: <1502323673.7946.10.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM
 power supply hwmon driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Brandon Wyman <bjwyman@gmail.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 10 Aug 2017 09:37:53 +0930
In-Reply-To: <CAK_vbW1yFzg6MUiPJzZ7M=8TjsH8kR-01aDKWsQMz=749a+2mQ@mail.gmail.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806869.29409.14.camel@aj.id.au>
 <80c3981a-b3b3-f9da-2fcb-f64dd06ac9b8@linux.vnet.ibm.com>
 <1502084490.7709.1.camel@aj.id.au> <1502159688.7946.6.camel@aj.id.au>
 <CAK_vbW1yFzg6MUiPJzZ7M=8TjsH8kR-01aDKWsQMz=749a+2mQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Rd5Q9tVIwDbNoj6WK/ct"
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
X-List-Received-Date: Thu, 10 Aug 2017 00:08:06 -0000


--=-Rd5Q9tVIwDbNoj6WK/ct
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-09 at 17:43 -0500, Brandon Wyman wrote:
> > On Mon, Aug 7, 2017 at 9:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Mon, 2017-08-07 at 15:11 +0930, Andrew Jeffery wrote:
> > > >=20
> > > > >=20
> > > > > > +
> > > > > > +static const struct i2c_device_id ibmps_id[] =3D {
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "withers=
poon", witherspoon },
> > > > > > >=20
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ }
> > > > > >=20
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(i2c, ibmps_id);
> > > > > > +
> > > > > > +static const struct of_device_id ibmps_of_match[] =3D {
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compati=
ble =3D "ibm,ibmps" },
> > > > > > >=20
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> > > > > >=20
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> > > > >=20
> > > > > p8_i2c_occ_of_match isn't right. Do we need both device tables?
> > > > > "witherspoon" as a device ID also seems unusual. What's going on =
there?
> > > >=20
> > > > Uhh, not sure how that got in there... How does this compile?? I'll=
 fix
> > > > it. The power supply doesn't have any device id or anything, so I j=
ust
> > > > went with witherspoon...
> > >=20
> > > My issue is "withersoon" identifies a class of machine, not a power
> > > supply, even if the powersupply is specific to Witherspoon.
> >=20
> > Further to this, I've just got hold of the datasheet. My reading of it
> > says the part number is "01KL054". Maybe the driver should include that
> > in its name and compatible.
>=20
> I don't know that this part number value always remains the same, for
> the part used in a particular system. There was a similar 2000W PMBus
> power supply that had one part number, and it stuck. However, a
> previous 1720W power supply had at least four different part numbers
> before it finally stuck on the final one.
>=20
> That being said, there quite probably are some differences between
> various part numbers, but most of what this device driver is doing
> would still be compatible. I can see have 01KL054 in the compatible
> list, but trying to shoe-horn it into the device driver name doesn't
> feel like it makes sense to me.

Right; without the context you've provided above I wouldn't consider it
shoe-horning. However, since having a diversity of part numbers is a
thing, I agree with your assessment. It should be part of a compatible,
but maybe we do need something generic for the driver name.

Andrew

>=20
> >=20
> > Andrew
--=-Rd5Q9tVIwDbNoj6WK/ct
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZi6PZAAoJEJ0dnzgO5LT5EEQP/i8goMkIYVsqhgcA2EQw97xw
pm57ld9UcpvrZ6J/cbjof8VCwNvcyPbAcE/5F1GbvO17bBbxnN2WtXxwrG7Jre+O
7FTrge0EMiXUBgXhmsc1hPwSumMjKlsIZYrc9K5aQ5zVVENaovXhfHYy77dCNVGb
5F0dKDp2VueeN3Tm82jF2BuJtIwZWUF3AugvgsmLKyeF5F1pB1F8MX6wBUgpPElC
3cqQqC+a00c5u0t5jH5uUDZGDsU8CQNmI3D9LBGAq/Cg3c8UCMBdNgGMtZ2YSLCp
F7PotjcCigpaU9EPC7AJAdlPdOTpuLE5M7AXIh0LG6LnihImIhvHBZbGK324pvt7
X6N0ZvNH2C4UrYqEgrRzRYM43ho4EVt5i7K7fGE1F4Sd1d5AtKgpNcN41gTyeiEi
c/MLxlqDvO1iBVJtU9/D8m7GzIHp9eHusf0WtJLhJ/Uvaz6k+Nkjz0qyf0i4VES+
QtbNBCVlCsw1RoyFPyMwJhkA0hG7TMll3nFI0t/PTRySm5sJXtQwetP82ufKPrU3
whLKxt9/5KVJmowkBv0vN2QxTbeONEQuNrz3Xw/sYEPsYwfKeklMql+SNkGZrV3B
U7ZtTP8r+c6EJCzFyGLrX/PJulKXamd1VrRWW+JCAJ5GLkeWImYgxQcamrjTW6Ki
Drgh7bhwo8S/pC9r0Le3
=etrf
-----END PGP SIGNATURE-----

--=-Rd5Q9tVIwDbNoj6WK/ct--
