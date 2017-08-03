Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNn0p4bG8zDqG5
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 09:52:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PGEiVIRr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Dz7xnAxq"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65C2820B96;
 Thu,  3 Aug 2017 19:52:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 03 Aug 2017 19:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=5UNupc0TWBt6UDa8Sx2Mu5/xOtpIVLKxIEtvAGXYf
 jQ=; b=PGEiVIRrVzcl8RuU7bzOLucB95GN+qrgiQH2NuQByG4xcFdJYeEhLHJ2K
 kTSnQh0w0rarIf3TDZ6/DoftaX6vm5SP1qTS54kYnXuS0xLCl7EraEJ28bWBemlt
 PFiDPN+rSLk/eVMFBTYrl53f8FlY9I+BNh/VshENUC2QfGqA0KMQvhwsg39cXhSt
 /DrXIMHizPUOAqpjGJSyCqeg2Zqzw/jP0+e1BOUv7A3lI7GW4y4onRaNZrlwT0Br
 lt6t8UkSkqkE+KbYnl51ZB+l3VZHD11aHYnlrXrFEutQZ8iMLBrm8oSbuw4+HnkN
 4/XqobE1f7Mr705OvgS7f2JpZ3uCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=5UNupc0TWBt6UDa8Sx
 2Mu5/xOtpIVLKxIEtvAGXYfjQ=; b=Dz7xnAxqRI5zKEqCcHuwJ9edrjd0P7tyxo
 xKFfAV86Wk8gjoUA4Dz2jYyHOlnwcCpKf/Otzpam7ViXiMKYrDC21MTEPD7yXwvL
 i2psnMGUVayPCBUgG19taPFn3MpzuphYY73vGPinIQywUzH69UgRuSw0lnQbhb3C
 jM/ie4LQXiduznogTtHdO5vdrfXBsK/yaa+OCdVS3kl0o48bGPLZK7QFNIbLEVcs
 lah4Q79ifxZnTka3c4kmtg7CGCbSfD3e4YQX3Azkyn2lU2USahcb8v8Y8vn9kVby
 YFs8ob92gEwa2rEtsx6bD1EioLbbgGgdNa58eEWteUQv0hM32HOg==
X-ME-Sender: <xms:N7eDWYy6iVc9lm8JGghlf4iV2oyoADi5FkSiFjCgLGrpuGtA6Cgxng>
X-Sasl-enc: XoyumIF4yvj+bEyoI4cdzlxntDFsYL+j4/d5bFw/H+L/ 1501804342
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D65C24515;
 Thu,  3 Aug 2017 19:52:20 -0400 (EDT)
Message-ID: <1501804334.29409.9.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 4/5] Documentation: ABI: Add IBM power
 supply sysfs documentation
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, Eddie James
 <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org, 
 cbostic@linux.vnet.ibm.com
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Fri, 04 Aug 2017 09:22:14 +0930
In-Reply-To: <bbd91224-bece-095b-440a-beb24236455a@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-5-git-send-email-eajames@linux.vnet.ibm.com>
 <bbd91224-bece-095b-440a-beb24236455a@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jkbyvUyk5ELUNRkiYM/p"
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
X-List-Received-Date: Thu, 03 Aug 2017 23:52:28 -0000


--=-jkbyvUyk5ELUNRkiYM/p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-08-03 at 10:42 -0500, Matt Spinler wrote:
>=20
> On 8/2/2017 3:25 PM, Eddie James wrote:
> > > > From: "Edward A. James" <eajames@us.ibm.com>
> >=20
> > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > ---
> > =C2=A0 Documentation/ABI/testing/sysfs-driver-ibmps | 49 ++++++++++++++=
++++++++++++++
> > =C2=A0 1 file changed, 49 insertions(+)
> > =C2=A0 create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-driver-ibmps b/Documentati=
on/ABI/testing/sysfs-driver-ibmps
> > new file mode 100644
> > index 0000000..1645685
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-driver-ibmps
> > @@ -0,0 +1,49 @@
> > > > +What:		/sys/bus/i2c/devices/<dev>/clear_faults
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Clears pmbus faults for this power supply.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_word
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > +Description:	Displays the STATUS_WORD register.
>=20
> Hey Chris,=C2=A0=C2=A0I think you did some research and found that upstre=
am=C2=A0
> wouldn't allow capturing full registers like this?=C2=A0=C2=A0Was that th=
e case?=C2=A0=C2=A0
> Or does it not matter as long as it isn't in hwmon?

This is a PMBus device, so it should be implemented in terms of the
PMBus subsystem. I expect this approach will be shot down by the
hwmon/pmbus maintainer.

Given the STATUS_BYTE/STATUS_WORD registers are the root of a fault
tree, another approach is to ignore the tree and focus on the leaves,
which is the PMBus subsystem's approach:

https://github.com/openbmc/linux/blob/dev-4.10/drivers/hwmon/pmbus/pmbus_co=
re.c#L1245

This continues down to line 1700.

Now, for several of the bits STATUS_WORD is the leaf node. Using
STATUS_WORD as a reference, as STATUS_BYTE is STATUS_WORD's lower byte,
STATUS_WORD is a leaf for the following bits:

* Bit 0: None of the above
* Bit 6: Unit is off
* Bit 7: Unit was busy
* Bit 8: Unknown fault or warning
* Bit 11: Power Good negated

Currently none of these bits are exposed by pmbus core, so that would
need to be rectified, but in-line with the approach used above. I
recommend getting in touch with Guenter on his preferred approach.

>=20
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_vout
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_VOUT register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_iout
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_IOUT register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_input
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_INPUT register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_temp
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_TEMPERATURE register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_cml
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_CML register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_other
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_OTHER register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_mfr
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > > > +Description:	Displays the STATUS_MFR_SPECIFIC register.
> > +
> > > > +What:		/sys/bus/i2c/devices/<dev>/status_fan
> > > > +KernelVersion:	4.13
> > +Contact:	eajames@us.ibm.com
> > +Description:	Displays the STATUS_FAN register.

See my comment above. This will get a prickly response if sent
upstream.

Andrew

>=20
>=20
--=-jkbyvUyk5ELUNRkiYM/p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZg7cuAAoJEJ0dnzgO5LT5Bz0QAIDQvlo6wd7rlyjQg2dHvJBu
rHNG6WcGFCBaIMvtON7Qrd52wzrXMTYbSa5rq5iAI2d10h46QJN4VO3xm2gPGn6z
Fp7w1bCc2qd6DJz2NQCw4iIs0a7AFScfW5WSFJOQ4r/sAtyucuWZWbRPGnshF2Dm
iqxv5v6bABvVcoE8A1XdeUSIHKTIGO3q/GYXrXZHe4k3a/970CKXDbulUh2xVy2/
mMr/0QjOCuZUdw7xuNmE6mYfYsquOf0eesYp/yFnAKCP5zY4Q/FO0UlDFj+ug5X+
l87nk8+v9q7l+Ze+tNCifzesBNypUuLxrYZyQM/7CLdAaZlLun2qKUMdmO5fGrCX
2QtGeglXvYJtECP/QDJ1b2+i+s/IRLK21BXtwbXfFZA55T0WrsNVWdnxoL24JfRL
n1V4WfCt8BboLUUHp/d5aH+XDAu7VxP/wrQztWlJz/uGsFWde3GWFFNirPooxA51
DhLOELyYeMmGiZ77jtq/Ipf5gbsD3bZARz5MiiskYweClllyLiJCLb9beeSbbP/E
GUTYL0KdpfZvgRz53BIM37JRLN1zYJeh1MN6SivMtNwucZDPF4g79mjkAfnhQzzP
6W60zdUnl2b/O6xu7KOxkgNlZDZbRh5q33yNCbIi/MEhCOIXghy5GMRaVL3l9sM2
OuAgMKcDZ0wJgOrr8VbP
=U54B
-----END PGP SIGNATURE-----

--=-jkbyvUyk5ELUNRkiYM/p--
