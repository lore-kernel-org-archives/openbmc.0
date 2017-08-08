Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRJQW2MqdzDqkp
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 12:34:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FBVCtiSW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O5sa8s3q"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 17D9F2075E;
 Mon,  7 Aug 2017 22:34:57 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 07 Aug 2017 22:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=y3Gy76DIMisjOy5h++S66yUK0Tu8O1nBW0UxijUJ6
 ME=; b=FBVCtiSWwh2UdLb0FMn/j0Ul1NPC30ifINDQ6rYPWBh8v2Dj5S5ZokRFd
 43/v6pMs2ji0ZnXk6v/LqCH/Me3Wc4O4UtbJMsmM0tqwdNi0BmRKiQF+bpVGk8cT
 TDl7ip8uS+sEux2cq+SN74A35L6LKB8oOeKAVAfW1SsnTyuegaO4f3B++sNp9lE9
 4OJ98yHwzsG1mlOC+27nMt9PDhiPC9QDqcqjDc6ujmFIVyBiuJFsKODN36tgTI4x
 crrAqgq/1o0kfz/k7jo7A7nCSXlKKBhmOWxqR5w8UIC84/sE8mr4UVHe2g0j3Is3
 e69NufpkyJlqeeacg6mOJWnetgGVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=y3Gy76DIMisjOy5h++
 S66yUK0Tu8O1nBW0UxijUJ6ME=; b=O5sa8s3qVWPe5QBn1sHcIaHAPo2+R3GvtE
 7X6X0irnAFrZLODFBtSZGb9lbGs96SAnJc3LaaN1OCLSXKdi0KHeiOyY5DpX1FNG
 2ursWgYxd8jXwR8JaXLdDpPbSC3NcHqjAObV7ULDIGKWVw+M2C8NyMyfB0PDaH6f
 9RRt1P+MwwsyDyh+mUsVJ2tEhOUKt8BkrKMHB4AcHsipTD7gszHowhNEGoSbxicG
 xHQT/kpEenpEN6ZgHnh0JFXGxYF5RrWTY2e1AO+WAxDAVxZ/Fg+tJsmlWht95D5l
 +Fz6FDiE20IgrR3d2DcbkZuWPyO2ENOTQiQScPGUR5/veGusyMvQ==
X-ME-Sender: <xms:USOJWUg5GuT82xF2jYJUW7J3wPYoJ62LdjS78m-POJccpOHDmu00mQ>
X-Sasl-enc: Jf0LlL+9qe4pcqCHkIZvVma8eQBHCmwod8unslU84mdh 1502159696
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 010357E317;
 Mon,  7 Aug 2017 22:34:54 -0400 (EDT)
Message-ID: <1502159688.7946.6.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM
 power supply hwmon driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Tue, 08 Aug 2017 12:04:48 +0930
In-Reply-To: <1502084490.7709.1.camel@aj.id.au>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806869.29409.14.camel@aj.id.au>
 <80c3981a-b3b3-f9da-2fcb-f64dd06ac9b8@linux.vnet.ibm.com>
 <1502084490.7709.1.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zENx58Wg8qu51u6J4k1e"
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
X-List-Received-Date: Tue, 08 Aug 2017 02:35:01 -0000


--=-zENx58Wg8qu51u6J4k1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-07 at 15:11 +0930, Andrew Jeffery wrote:
> >=C2=A0
> > >=C2=A0
> > > > +
> > > > +static const struct i2c_device_id ibmps_id[] =3D {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "witherspoon=
", witherspoon },
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ }
> > > >=C2=A0
> > > > +};
> > > > +MODULE_DEVICE_TABLE(i2c, ibmps_id);
> > > > +
> > > > +static const struct of_device_id ibmps_of_match[] =3D {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =
=3D "ibm,ibmps" },
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> > > >=C2=A0
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> > >=C2=A0
> > > p8_i2c_occ_of_match isn't right. Do we need both device tables?
> > > "witherspoon" as a device ID also seems unusual. What's going on ther=
e?
> >=C2=A0
> > Uhh, not sure how that got in there... How does this compile?? I'll fix=
=C2=A0
> > it. The power supply doesn't have any device id or anything, so I just=
=C2=A0
> > went with witherspoon...
>=20
> My issue is "withersoon" identifies a class of machine, not a power
> supply, even if the powersupply is specific to Witherspoon.

Further to this, I've just got hold of the datasheet. My reading of it
says the part number is "01KL054". Maybe the driver should include that
in its name and compatible.

Andrew
--=-zENx58Wg8qu51u6J4k1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZiSNIAAoJEJ0dnzgO5LT5wloQAI3zs8iltBN0RXjDOh8FOT7D
tNKCfng0CUnMXM2efcqxaYlrX9eSZdHccTym8hcxpbP9ZujCRt+Qh92WDhCOy+6A
0q1JgeQOPyJpKBEYm/3mxwpnW8375Delq1X2znFDbi67yT5+P7nxmlyyU/Fvzu4t
QPUL7IHqX9OmoIAnNvMCabV0SeKhlh16x066c2A7PaNxVLzHJbgtKy7KaX4J+UWC
59RGhHOAhbh+U1vzDeFUJcHzDW6JFEmuZxrbMGDhRF4mBw3gUEMJ3cevYmgFLXHk
ds2Ww6nte8XKcYTf3btq+hZEFgDp5pUyZ4NXPN8qFz5gjK/5JDXOz1RRPSt/Vrzt
mzTCK9Rc4NxrIy+c2wmmAhE6Nx39GC+Od5GW/tPyIGjhKonzLA0J9trrQ4NbcbZr
jyKWmrWOC7u5q/2zGwT6M6YTxVBSbjrBKtzzRtXaZi/gGz2m9qbEsbwG9dVf+GmR
X6TTp+MdbvR3eTdGd22E+maO5aCExVKIQOu0BDabkDT9TdTPmt36kEBl8/fsf6z3
0me+aJauLiqnx3z6SR49kLXPrb1zkItpXRCxf1/NjcfbrrudUAuU5E0cdO6iJ4pV
xcHycwVi+Is8zxYlgU/A+EMeBZbbiohzKQo68rYDuKUsryTQ9sabiKK/+zg6SZ5r
ES8ynDTWdOBVwEAHLg/O
=XYOD
-----END PGP SIGNATURE-----

--=-zENx58Wg8qu51u6J4k1e--
