Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh6rv01DbzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:08:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="sJbipIAk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QOvhdnfD"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 338A020A23;
 Mon,  5 Jun 2017 04:08:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 05 Jun 2017 04:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=CC5KGzjuZGfm/0wlaNIR2j89LYGy4ANwozWOjIZiL
 jc=; b=sJbipIAkJRddp3lVIQ9pI8SypXnYl4dkBZpmmGLrJ9rTMIMwm5goM7sow
 NpLh656lxY4Q3YI+5tFSCZjOk66u/SksR/0myTd20e+QCL7o8Sr8TsDzGO0ktxTO
 TJZdMs8m1dsEOzBvCcLflQMX9YD0GF03/+QDytxaj0RZduFH+PDn36T+/q/F4Juv
 hZfWOMayBsKTHYbFcZxJSCuOusVwRPUwf74vhpORMCOxZVBW1iwGhhnAyCWGhIax
 HQe2QMz6CLCTwplePZ+xyh3aZo0GVXSMWdyI4nTL3vQDKWvBLDDYOVD7ANqwaqjm
 p8cEY0TxbviSmKSdOs6lM3bSKL8vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=CC5KGzjuZGfm/0wlaN
 IR2j89LYGy4ANwozWOjIZiLjc=; b=QOvhdnfDK7pBSTiWtQU2NyNIiibulIgCta
 WjAtnLkMkjyFU/NAsZtNJR7D6l+7ncz6FS0T//RxuOPngNb1UBN6Hli3Zv91kYE0
 ljWr6648wmWdmR7ILz6qkwUPh20M258ZV4iTNQokJNCQ0LzCYqB86jsbdGbvqJE9
 eLKFQ+LHmKMZHvk7X2Os+eenORRD47zeY8AhkEfCkwiYqrGwRi02NmLO80HpiR7O
 zHSeAgw+iVPgU5pGoqhhCkJdVKGbb3tt/nMqLQhgCRBEI935T5X+cw6u84rzqI8j
 LhHzO8aCr08JFWvB2AsRtoac4/DC1ab3EUvV9HjBK48fSSCw+l7A==
X-ME-Sender: <xms:fBE1WT5yvOTZ1lSxmG_zIiQoJ0JmsygFFXOo6GMLoTfcDzOOivPIlA>
X-Sasl-enc: PL7+sdRqLr/Py6npEwv+ORMub+E4dZfSkR92MaT8QRfr 1496650107
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A9962475E;
 Mon,  5 Jun 2017 04:08:25 -0400 (EDT)
Message-ID: <1496650102.8159.24.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/3] mfd: dt: Add Aspeed Low Pin Count
 Controller bindings
From: Andrew Jeffery <andrew@aj.id.au>
To: Lee Jones <lee.jones@linaro.org>
Cc: joel@jms.id.au, anoo@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Date: Mon, 05 Jun 2017 17:38:22 +0930
In-Reply-To: <20170605080519.3yvpsmw2gnjjth4k@dell>
References: <20170602082844.7370-1-andrew@aj.id.au>
 <20170602082844.7370-2-andrew@aj.id.au>
 <20170605080519.3yvpsmw2gnjjth4k@dell>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Xg7yC7Wu8Swf5F90o0cM"
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
X-List-Received-Date: Mon, 05 Jun 2017 08:08:32 -0000


--=-Xg7yC7Wu8Swf5F90o0cM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-06-05 at 09:05 +0100, Lee Jones wrote:
> On Fri, 02 Jun 2017, Andrew Jeffery wrote:
>=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > > Acked-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > (cherry picked from commit 3bca0e552f693a7d815d24d8fda1196f2c668074)
>=20
> What is this patch for?=C2=A0=C2=A0What's the intention?

I failed at git send-email. Joel maintains our OpenBMC distro kernel,
and I was backporting the patch for completeness. I should've added --
suppress-cc=3Dbody when sending but forgot.

Sorry for the noise.

andrew

>=20
> > ---
> > =C2=A0.../devicetree/bindings/mfd/aspeed-lpc.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 111 +++++++++++++++++++++
> > =C2=A01 file changed, 111 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-l=
pc.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Doc=
umentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > new file mode 100644
> > index 000000000000..a97131aba446
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > @@ -0,0 +1,111 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Device tree bindings for the Aspeed Low Pin Count (LPC) Bus Controller
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The LPC bus is a means to bridge a host CPU to a number of low-bandwid=
th
> > +peripheral devices, replacing the use of the ISA bus in the age of PCI=
[0]. The
> > +primary use case of the Aspeed LPC controller is as a slave on the bus
> > +(typically in a Baseboard Management Controller SoC), but under certai=
n
> > +conditions it can also take the role of bus master.
> > +
> > +The LPC controller is represented as a multi-function device to accoun=
t for the
> > +mix of functionality it provides. The principle split is between the r=
egister
> > +layout at the start of the I/O space which is, to quote the Aspeed dat=
asheet,
> > +"basically compatible with the [LPC registers from the] popular BMC co=
ntroller
> > +H8S/2168[1]", and everything else, where everything else is an eclecti=
c
> > +collection of functions with a esoteric register layout. "Everything e=
lse",
> > +here labeled the "host" portion of the controller, includes, but is no=
t limited
> > +to:
> > +
> > +* An IPMI Block Transfer[2] Controller
> > +
> > +* An LPC Host Controller: Manages LPC functions such as host vs slave =
mode, the
> > +=C2=A0=C2=A0physical properties of some LPC pins, configuration of ser=
ial IRQs, and
> > +=C2=A0=C2=A0APB-to-LPC bridging amonst other functions.
> > +
> > +* An LPC Host Interface Controller: Manages functions exposed to the h=
ost such
> > +=C2=A0=C2=A0as LPC firmware hub cycles, configuration of the LPC-to-AH=
B mapping, UART
> > +=C2=A0=C2=A0management and bus snoop configuration.
> > +
> > +* A set of SuperIO[3] scratch registers: Enables implementation of e.g=
. custom
> > +=C2=A0=C2=A0hardware management protocols for handover between the hos=
t and baseboard
> > +=C2=A0=C2=A0management controller.
> > +
> > +Additionally the state of the LPC controller influences the pinmux
> > +configuration, therefore the host portion of the controller is exposed=
 as a
> > +syscon as a means to arbitrate access.
> > +
> > +[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
> > +[1] https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h=
8s2168.pdf?key=3D7c88837454702128622bee53acbda8f4
> > +[2] http://www.intel.com/content/dam/www/public/us/en/documents/produc=
t-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
> > +[3] https://en.wikipedia.org/wiki/Super_I/O
> > +
> > +Required properties
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > > > +- compatible:	One of:
> > > > +		"aspeed,ast2400-lpc", "simple-mfd"
> > > > +		"aspeed,ast2500-lpc", "simple-mfd"
> > +
> > > > +- reg:		contains the physical address and length values of the Asp=
eed
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0LPC memory region.
> > +
> > +- #address-cells: <1>
> > > > +- #size-cells:	<1>
> > > > +- ranges:=C2=A0	Maps 0 to the physical address and length of the L=
PC memory
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0region
> > +
> > +Required LPC Child nodes
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +BMC Node
> > +--------
> > +
> > > > +- compatible:	One of:
> > > > +		"aspeed,ast2400-lpc-bmc"
> > > > +		"aspeed,ast2500-lpc-bmc"
> > +
> > > > +- reg:		contains the physical address and length values of the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0H8S/2168-compatible LPC controller memory region
> > +
> > +Host Node
> > +---------
> > +
> > +- compatible:=C2=A0=C2=A0=C2=A0One of:
> > > > +		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> > > > +		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> > +
> > > > +- reg:		contains the address and length values of the host-related
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0register space for the Aspeed LPC controller
> > +
> > +- #address-cells: <1>
> > > > +- #size-cells:	<1>
> > > > +- ranges:=C2=A0	Maps 0 to the address and length of the host-relat=
ed LPC memory
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0region
> > +
> > +Example:
> > +
> > > > +lpc: lpc@1e789000 {
> > > > +	compatible =3D "aspeed,ast2500-lpc", "simple-mfd";
> > > > +	reg =3D <0x1e789000 0x1000>;
> > +
> > > > +	#address-cells =3D <1>;
> > > > +	#size-cells =3D <1>;
> > > > +	ranges =3D <0x0 0x1e789000 0x1000>;
> > +
> > > > > > +	lpc_bmc: lpc-bmc@0 {
> > > > +		compatible =3D "aspeed,ast2500-lpc-bmc";
> > > > +		reg =3D <0x0 0x80>;
> > > > +	};
> > +
> > > > > > +	lpc_host: lpc-host@80 {
> > > > +		compatible =3D "aspeed,ast2500-lpc-host", "simple-mfd", "syscon"=
;
> > > > +		reg =3D <0x80 0x1e0>;
> > > > +		reg-io-width =3D <4>;
> > +
> > > > +		#address-cells =3D <1>;
> > > > +		#size-cells =3D <1>;
> > > > +		ranges =3D <0x0 0x80 0x1e0>;
> > > > +	};
> > +};
> > +
>=20
>=20
--=-Xg7yC7Wu8Swf5F90o0cM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZNRF2AAoJEJ0dnzgO5LT5vzAQAJPLucB/G8RytfhiputlquYv
M6lmGMXvmuqAWMaotcshdzKTVwWRTjTLwe5BNonFLNjSlQbQg0/x87sJSuxEAf4g
z4PQcTqqvsV4Ki+Kk4GQe6KQWXqLkeLjHIZ35ObNqnXBR/TE1R15TpX/Pjb4l1Ps
Xt5KZ3292HHKv2IRHI8vXgbxZUgeJ3KK72G9AcMdC0+c+i+ugAhfnX9FkmL4z2B7
qXD9iT04yxQAk/pd9RrMtDNY/qLuSDYMUJ6v1LuXCVnOby/Qs+zTL3qaydQ+Guxq
ACwtU8ADm/awBAJ1PwHJLBXkf7qFmkjOE4R7aEJQ2A/FxA4JfHPcoIGR0NMlC/gs
pZTPcIoXGLCOYQjaSkmpl9pgY/vESSXtG1ngOAfNjnQ5LN1F4I8GA0zSsSNJeLob
H9HTixntGuhFZc7ZMWLrqZJCbyvk1AChcC8KWRnc2mhZwqw1v1XHDEXX0NIy4liE
kv2qCVEUfLd31Rpf4YPBdGf10lZnOYNBKL59T7jQmEUuM29Y5CrrUJ6V7JZCc9X8
oN80i4R8uhfpqvxYzFATZv0nTm3RynfUw72HqHDBZ8y8+5Wp1Ds+CXgaMI71gp2s
SaZoIphylYzTWr/8IBifVRxUBuAUz8V9atwQBqRI6Lj0vCOdsYYvetlfYZgROvIU
JruCj3pnlS/yEkk/RxPg
=XutA
-----END PGP SIGNATURE-----

--=-Xg7yC7Wu8Swf5F90o0cM--
