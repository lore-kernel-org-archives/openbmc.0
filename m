Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXHs22vW3zDr1y
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 15:26:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H63c59dW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Fr9qqK4B"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B8C4B20D83;
 Wed, 16 Aug 2017 01:26:42 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 16 Aug 2017 01:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=VaHFeZ9jXhEUVaHqHuvJQrCYwF/gZvodzbUOSdEl4
 z4=; b=H63c59dWOpdwBOjkX0NDoes1lYCJBmqPbln+N5zIvwhFItsB8UW45upEk
 9aEF7+Djt/eUrojcge6FfqOSZabTQfjyH2fD6COl4hVGVGR9D3wEqUD4iiU65wYC
 V4bDjNq6IVcNEcl3EmNcUFHz//oNHVCcESy9NmXFb6BR8wWahtko/zFCEagEIZrO
 iE4yuoHTVfOhv7l6XbL9PU4OJ8bTBsd064HCuRs7NbwGQVlYsAQPv+6M9iZB/yKw
 MoJKYlNFtN35tkZwn00XJI9LVhd5z8AryXPGo1IvQxTzijmjQaMWG7C5c47Bmb1H
 u+tgdAWaF/FCeO2Jn4cotHtQg47/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=VaHFeZ9jXhEUVaHqHu
 vJQrCYwF/gZvodzbUOSdEl4z4=; b=Fr9qqK4B/DcgLbvMcOu6qfzE4ZYfUH8qGf
 Wm90JXTwlYVrakKdWeeCyRQmFFu+8HHdvvCWt8sr0zTDnE8uzk76STx1da0M6jdX
 uQrTLLUcXl3VemngHZcl57V4TWHENNVfAzfo+5k1MtO3+yyo7ynqKHCj5M9YGwqo
 Q9sk0z3AU7zata/oAbu328YMxHRwp+574MNt0v5l2/weBUvV44qkRNXRWbFx65aG
 B9A5ruSp/sBDOQSv54paW/L6+MQGCzkMZVoDvjBzTnxK8yDQDlTTULX7Q05Ek+hr
 SdTzaQEAdC+mDXimIB6hXBmvK4gmybrPqOgkXrux06i/lCz7iHAQ==
X-ME-Sender: <xms:kteTWX2mxuxQ2ZbNcpbg4H_51XfYplcAp9MXpIrUiCK-oCZa08IEuQ>
X-Sasl-enc: qYOrz0dp/jNBRdQOxGnlW+rz+8kM0maP59hQY0jeOP/c 1502861201
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D7487F9A8;
 Wed, 16 Aug 2017 01:26:40 -0400 (EDT)
Message-ID: <1502861193.14932.26.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 1/4] dt-bindings: i2c: Document the
 IBM CCF power supply version 1
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Wed, 16 Aug 2017 14:56:33 +0930
In-Reply-To: <86d0c243-b6d6-0b24-388f-a3f3ade04164@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474205-1557-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1502696018.14932.20.camel@aj.id.au>
 <86d0c243-b6d6-0b24-388f-a3f3ade04164@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BHaICjizNvkmc2jWjni2"
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
X-List-Received-Date: Wed, 16 Aug 2017 05:26:48 -0000


--=-BHaICjizNvkmc2jWjni2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-14 at 10:09 -0500, Eddie James wrote:
>=C2=A0
> On 08/14/2017 02:33 AM, Andrew Jeffery wrote:
> > On Fri, 2017-08-11 at 12:56 -0500, Eddie James wrote:
> > > From: "Edward A. James" <eajames@us.ibm.com>
> > >=C2=A0
> > > =C2=A0=C2=A0
> > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > >=C2=A0
> > > ---
> > > =C2=A0 .../devicetree/bindings/i2c/ibm,cffps1.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 21
> >=C2=A0
> > +++++++++++++++++++++
> > > =C2=A0 1 file changed, 21 insertions(+)
> > > =C2=A0 create mode 100644
> >=C2=A0
> > Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> > > =C2=A0=C2=A0
> > > diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> >=C2=A0
> > b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> > > new file mode 100644
> > > index 0000000..f68a0a6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> > > @@ -0,0 +1,21 @@
> > > +Device-tree bindings for IBM Common Form Factor Power Supply Version
> >=C2=A0
> > 1
> > > +------------------------------------------------------------------
> >=C2=A0
> > ----
> > > +
> > > +Required properties:
> > > + - compatible =3D "ibm,cffps1";
> > > + - reg =3D < I2C bus address >;		: Address of the
> >=C2=A0
> > power supply on the
> > > +					=C2=A0=C2=A0I2C bus.
> >=C2=A0
> > Should we define properties for these registers?
> >=C2=A0
> > * OPERATION
> > * ON_OFF_CONFIG
> > * SYS_CONFIG
>=C2=A0
> We could I suppose. I don't see why though; is it normal to document=C2=
=A0
> specific registers on devices?

It's not normal to document specific registers, no. However, it is normal t=
o
expose the device's configuration fields as properties. Reading back I chos=
e my
words poorly, but my query was about the properties of the device that can =
be
configured through these registers, not really about the registers themselv=
es.

> And why just those ones?

Because from a quick scan of the datasheet, these seem to be the remaining
registers that contained fields that could be configured.

> The driver=C2=A0doesn't use them. Presumably someone who wants to use the=
m can
> look at=C2=A0the spec.

Upstream's stance is that the bindings describe the hardware, and the
strong preferences is that the description is complete at the time of
submission.

Though maybe if there are optional properties it's not so significant.

Cheers,

Andrew

>=C2=A0
> Thanks for the review!
> Eddie
>=C2=A0
> >=C2=A0
> > Cheers,
> >=C2=A0
> > Andrew
> >=C2=A0
> > > +
> > > +Example:
> > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c-bus@100 {
> > >=C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#address-cells =3D <=
1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <0>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#interrupt-cells =3D=
 <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0< more properties >
> > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0power-supply@68 {
> > >=C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0compatible =3D "ibm,cffps1";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0reg =3D <0x68>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +=C2=A0=C2=A0=C2=A0=C2=A0};
>=C2=A0
>=C2=A0
--=-BHaICjizNvkmc2jWjni2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZk9eKAAoJEJ0dnzgO5LT5TtkP/jx/SM0Gm3BDgSHiErtrrrSX
3rM5+5qlE82zPZ4gGtf3vV7NVC/sHnxFrzwMCWy/Eb4nZDAdmOYgOtc2rQHcqE/v
JADVqgrK58R4a+M0bHXxK61dNz0V5rrfv4axfUDIUgPl+uwxzR25YOsiuWzo6aJi
3hjYEDI/0DmQvBIKmqSQFdij6Bt6qhxaJOLM160KrLVR+VfyDifPc9Ss5EWNiMG0
+b3EDoyr2pK7GRT6k4AYHvflPjUgN+QDaIEdowH1j7pVYczMV+af6dJeQB003Ltf
zTxNlNSxuYlbsuI7k68AxSK2WWzCdVyM7f1vpeS76KZlhop30cNlwiVBb8/TgJun
227RIZB+P3d/j9SpKyHzsuYi6Wnsy5ZR0lktqAhQIlRVx0y6nrT2Yw8/0eOxuztz
bDoSNcsWB4sXwfTenFEfGRquBv8gTZNLpdd7taofl7ayBRCqPWiift7rJhGgRJSC
sUvyKw0YyBcpZvC+qwtcmjh+W6hF1SZT3Iq9TaTQpao+2OOoPw86dWTpr3dKeyT8
+wWu1/E6dSMR6ZRlTEef6ULmTLjCyH4O/gaLG8R6APgtGZ94z4zK/uyh8ESLfeYP
8HPI3NvSHwi4vAZYejeI94nZGTX6LQwJUtaK1dZDL5w+XvZ6Z7J4XIQRquA30V7Y
zsnOc89fXmi1tpUUeNw6
=cfhJ
-----END PGP SIGNATURE-----

--=-BHaICjizNvkmc2jWjni2--
