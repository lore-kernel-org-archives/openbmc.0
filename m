Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F3ecRL2u"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sQ8lNH78"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y1TTN44yjzDsMB
 for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2017 15:07:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 411EF20CF5;
 Tue, 26 Sep 2017 01:06:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 26 Sep 2017 01:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TSUbxzDR9oFJPTuGJ5k3pcxbNn346i7DTUV1fix0Q
 bQ=; b=F3ecRL2u2ZXOCXtnkyyDh1bds0UpHWghntvI1jRze/4LMi9kPFk09sHzI
 2K2ASdT7RTi0SwOIGS9xYDwySD1MuRqLgyAUc8lD2dCIeQth/oMkda1uK2RG0lPs
 WBeKiiI8KPgMBCisrWO1ukGF9nkjLGuFk2/1/+gmXXYAJhrbe4xjPaygDZT8xIct
 8TmsHJsq+kSZb856g+5L49tcmjS971dHAutXzxnIL9fAad9HlsCFJgktxUNBEpg7
 cfY/QbXxqs0i33RoZpaGSWDiMBPQN2bHtTAfqJteObk44odq9lY9mA3VNZhXIAjV
 T3tEp7gacvpl2CSunEtUoEzUxynog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TSUbxzDR9oFJPTuGJ5
 k3pcxbNn346i7DTUV1fix0QbQ=; b=sQ8lNH78eV1DJnyGf0THHYPjZwGEQNY/3o
 /rY1k72kZubdoCubmlN3+R1bWBfe4DnjX1Exf9JtgVssbfjzSapGgUs1Fp194wrW
 1/VPmEsyR2jWmppDKzEVx+nsiR32hyBnFYklTwox+KZBFZB6Ke2VysM7A+S/1lHK
 HhppsoTcw1BIv/dkmwgiuDbwsaM1z6pwgB4NfkOjUxVcD7xcDE7FzOnKFtG0qEha
 ViU7QYvGANsVJvyqEHIXVR8od+CxMLi+v6LDuc5ydY8n45cfthBpJjniWX1Y9xf2
 lQJZruG+4WNrPg0XGjw4YShCXhXuGM9J5LyK9pbifVzhyUFZ9kKQ==
X-ME-Sender: <xms:cODJWV0rE7vI2zn9E4PBXmnsZ_lzs5opMlq7FArL9RSkwqG3JTJ4WA>
X-Sasl-enc: Lvmp+AwCg0SDT/FhgRMZetZdO/YGby/Bfb4w1BrfJExN 1506402415
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D447E7E430;
 Tue, 26 Sep 2017 01:06:51 -0400 (EDT)
Message-ID: <1506402405.30138.35.camel@aj.id.au>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add Maxim MAX31785
 documentation
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, mark.rutland@arm.com, jdelvare@suse.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
 mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com, 
 openbmc@lists.ozlabs.org
Date: Tue, 26 Sep 2017 14:36:45 +0930
In-Reply-To: <20170918201528.GA27615@roeck-us.net>
References: <20170908043919.6924-1-andrew@aj.id.au>
 <20170908043919.6924-2-andrew@aj.id.au>
 <20170918192638.4xqszyj466lrnpbz@rob-hp-laptop>
 <20170918201528.GA27615@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-KAruN5h0taGOo6R+Ub+B"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2017 05:07:06 -0000


--=-KAruN5h0taGOo6R+Ub+B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-18 at 13:15 -0700, Guenter Roeck wrote:
> On Mon, Sep 18, 2017 at 02:26:38PM -0500, Rob Herring wrote:
> > On Fri, Sep 08, 2017 at 02:39:17PM +1000, Andrew Jeffery wrote:
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > > =C2=A0.../devicetree/bindings/hwmon/pmbus/max31785.txt=C2=A0=C2=A0=C2=
=A0| 158 +++++++++++++++++++++
> >=20
> > I think this needs to be located by what it does (fan control), not wha=
t=C2=A0
> > interface it has (pmbus).
> >=20
> > I'm not all that happy with hwmon either because things here seem to=C2=
=A0
> > just be based on being Linux hwmon devices which is sometimes arbitrary=
.=C2=A0
> >=20
>=20
> The chip also measures temperatures. Other PMBus chips may do fan control=
,
> measure temperatures, measure and/or control voltages, current, power ...
> Strictly speaking pretty much all PMBus chips are multi-function devices.
> I personally don't really care if the documentation is spread across
> several directories, but even here this is already challenging.
>=20
> Only solution I can think of would be to create separate documents for ea=
ch
> functionality, ie here one for the device itself, one for fan control,
> and one for temperature control (if that needs separate bindings). That
> would be similar to mfd. But then we would still have to sort out where
> to store the various bindings. Like iio, in subdirectories ? Like mfd,
> in the matching subsystems ? If so, what to do if there is no matching
> subsystem ?
>=20
> Lots of questions. I'll be happy to spend some time sorting it out,
> but I would need some directions.
>=20

Likewise - I'm keen to discuss and iterate on this so we get something
satisfactory.

At least I could split out the PMBus-specific bindings from the Maxim-
specific bindings in the current document, but there's still the
question of how to arrange it as Guenter has queried above, and also
how much of PMBus to define bindings for. I'm hesitant to take a stab
at describing bindings across the whole spec if I don't have useful
driver implementations to test against. I know that the bindings
describe the hardware and not the driver, but there are probably more
or less clumsy ways to describe devices that could be ironed out with a
corresponding implementation (e.g. the Aspeed PWM/Tacho...).

Thoughts?

Andrew
--=-KAruN5h0taGOo6R+Ub+B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyeBlAAoJEJ0dnzgO5LT5cNsQAJTIlYjvpwz30KYhT5UuocAo
pJ7Pwd4i2eyPAhxcf3Y7COLo0zdxhlRI3si/zxUkJDGx/wTIrQ1jjWrtZ6VlZFIP
VZUTWSsng0qlatB7PppeKxvaQIgI+AWw3AnrXpW3GQF3Ke+RhUdYpEjJ0oNKCOui
Dq4ZhfUELi6pkd+5ZgvTI/OpgjlSBRLwiYc8GHrkdlExxTVRXJIbpE6qqjGBxYrL
M/XbkHqntBq9PVu/uRRJtaSG1uol7rtMG5p4Vn3PTFOHE2s4Ke+9pLQMBFdEjaG9
tQmN38UPZNxb7XHj+kiIqKV+v834DDjN9WkfnDAclIGSojOyTwiidHtlcmvuKdN3
nL1aqjYU55tVe5mMK1VdPNTmeGpD9+QoPeDwb9o4WeOXBLXe45PelV0+LWLD64ha
tkqDH4ilk4YS2sim/2aapqwoELtc6BJxf76oZcGqBAzqEAPoiWpGdn+PcGc3TErX
hqKnMfL3p1/RgxJ6F69neZ6/OAbOYdj8H4nKNpBFVvyRpJBAicV1HkzR2av40p3w
dhDFfazKw8rSPNUC49rZ1ZOuwJ0kIt4kRP4eB3k2ZqiAMpPjv5buT4gApHj6vRCc
aiL4uDoO7M00r70Pm0M4zc4UA//cQ/VB/pvRlGTnEM4sk7IQvw6Vw6APEgswvG64
N5+Xp/JKnOSAdOHvWe2R
=quqO
-----END PGP SIGNATURE-----

--=-KAruN5h0taGOo6R+Ub+B--
