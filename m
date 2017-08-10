Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSkSw27c1zDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 20:12:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bex4lmK7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rLqkt3mO"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F019521D69;
 Thu, 10 Aug 2017 06:11:57 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 10 Aug 2017 06:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=FXaiOaNj82+3l/mgUCVCpQlxnzzPTl+JdvRNl2/j1
 ho=; b=bex4lmK7dqEYA8V3Hzw5DVCZPkSZQ2iIxO82pz9Un5cmFecFB6/pdHbxL
 Wd0KgOjM55DpeHH6H0NoRkOeRloPVn3jiH/6Wr1ChvKO0DG0iBpmyrve698dX3qJ
 VfTtzKIQrwxfXTMrkKH6T3eSqz8WkLlkNRFgIbrDDZ0s0uq3MceD2JnQZPol/VOO
 QDb0UuAjjwKCx1tKJVNUhsdD/5qXQwHgDIM1IIWl6fBsZN9/KgC9VrIsCr8cDdry
 4CgJHbP1+qGdJ2k2njvxg0F3RJoADMn/Lro4xmmfzgKuiDweSgaqcTB7BI/isZt4
 lhUvz6D4o8lZtBuX/HtEOCUIFRAtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=FXaiOaNj82+3l/mgUC
 VCpQlxnzzPTl+JdvRNl2/j1ho=; b=rLqkt3mO2Et/aueyCkyXiRYbhFbCSUWyoo
 O7YYpkkocSbPac6JwOWNUxGthRKPa892MV14VHan+FQzNTBnQvfAb4BfDezXngPy
 a80uN66g2P+vMvHg1CLDMngJHRLlVDrzr5d6vcGmfRHM1LDhXSGD3Jx+uTtN+fxC
 cMqxeWeJSyKu8XifVG0HrByXmNWwc3yZUILdOkQulVnG8HCBnbU0RTdlu8AzaYIz
 Lzpm2b2gk/khzzYqMVXlyeN27Ijp31QynElnVnf8Ec9WdsWf8VDc4N2dy7R+2Kt8
 NPReGPjCF58MrfaSPf1c25neqlsmpfcBEQIoX2fsvWNjJr9Wnz0A==
X-ME-Sender: <xms:bTGMWWvccPR_P_bE3gTxmcpTcZZ78Fkyey2cXzQbZ8_sHig8V_kIBA>
X-Sasl-enc: ZM037XBCPDZhgYD5ZkvUSKxx6zKl8WxcZtPT2z0+XUqD 1502359917
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D6D124813;
 Thu, 10 Aug 2017 06:11:56 -0400 (EDT)
Message-ID: <1502359910.7946.17.camel@aj.id.au>
Subject: Re: AST SOC gpio pass-through support
From: Andrew Jeffery <andrew@aj.id.au>
To: Yong Li <sdliyong@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 10 Aug 2017 19:41:50 +0930
In-Reply-To: <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
 <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-G0Ed8tSTu0GSpHJf5lGi"
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
X-List-Received-Date: Thu, 10 Aug 2017 10:12:02 -0000


--=-G0Ed8tSTu0GSpHJf5lGi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-08-10 at 17:01 +0800, Yong Li wrote:
> thanks for your quick response Andrew!=20

No worries!

> i will read these info deeply. just a quick question, is it possible=20
> to enable/disable the pass through dynamically after kernel boots?=C2=A0=
=C2=A0how?

So there is the concept of runtime pinmuxing[1]: It's possible for a
device to have several pinmux states that can be configured/selected
from process context. Alternatively, a naive approach might be just
unbinding the driver for the device you used to select the pass-through=20
mux function(s) - this would free up the pins to be requested as
regular GPIOs. However, you'd need to request the mux on a device node
other than the pinctrl node, as unbinding that would have undesirable
consequences :)

Hope that helps.

Andrew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/driver-api/pinctl.rst#n1385

>=20
> > > > =E5=9C=A8 2017=E5=B9=B48=E6=9C=8810=E6=97=A5=EF=BC=8C16:28=EF=BC=8C=
Andrew Jeffery <andrew@aj.id.au> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > Hi Yong,
> >=20
> > > On Thu, 2017-08-10 at 15:50 +0800, Yong Li wrote:
> > > Hi all,
> >=20
> > Welcome to the list!
> >=20
> > >=20
> > > AST SOC supports GPIOE pass-through function, I would like to know if
> > > the kernel provides such API/interface to enable/disable pass-through=
?
> >=20
> > Yes, the kernel's pinmux drivers can configure GPIO passthrough for
> > you. In general, all the functions are documented in the pinctrl
> > devicetree bindings:
> >=20
> > =C2=A0=C2=A0=C2=A0https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed=
.txt?h=3Dv4.12
> >=20
> > Specifically, you are after functions/groups GPIE{0,2,4,6}. We already
> > have these defined in the Aspeed DTSIs, so to configure them you can
> > add something like the following snippet in your devicetree:
> >=20
> > =C2=A0=C2=A0=C2=A0&pinctrl {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinct=
rl-names =3D "default";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinct=
rl-0 =3D <&pinctrl_gpie0_default
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpie2_default
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpie4_default
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpie6_default>;
> > =C2=A0=C2=A0=C2=A0}
> >=20
> > Specifying the mux configuration in the pinctrl node is probably as
> > good a place as any, though if you have somewhere more relevant you
> > should probably use that. Naturally you can remove any of these
> > phandles to only select the specific pass-through configurations you
> > need.
> >=20
> > If you want to pass-through the whole bank you can also set the board
> > strapping to make it the case right from power-on. The strapping
> > register *is* writeable, however the kernel's pinctrl driver treats it
> > as read-only, as really, the system designer ought configure it either
> > via pull-ups or in the boot firmware.
> >=20
> > The passthrough capability is a bit of an odd case - despite being GPIO
> > I chose to represent it as a pinctrl function. Hope it makes sense to
> > you.
> >=20
> > Cheers,
> >=20
> > Andrew
--=-G0Ed8tSTu0GSpHJf5lGi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZjDFmAAoJEJ0dnzgO5LT5KNMP/jQVPxXluYSiIzx9hdTpF8nX
Cc3OE2hAjUYo7lR52uw/XOteMVW5E/sR6lAcKLfaxA5erlchcpwSYeDNdjSMUxm3
MD0Tzyr9Qgk+KvAkmfOceyvwlzPVaalBoG095Q48a3oKmCnQOr3TmN7NBeu0QtjN
nwEwMnBtHle2TATJ08ffYlePTjFF79iq2JjlERMAnfxsM6oJzcd5VHyBL5hOG6pL
65CHhbGwPy43WQf8FdQ+YJRVgkUZ4TQAtd74x8QaJT3RRl/8areEpneyOpWyOuK1
Ht95Q4rMsfvmRpzFUj1qAWsKo1DkYl9k8jF+48dH24U5HYLrhoJNpbTEDREhm24I
LwujuS6HNS3jRHzxj5yiqwXNUKZOjXMaHx18SysKrr5bwOuBvoGex4R9Fqpif2oO
/uv7Gb/Dnka/INtAomnDUrz/Yl5bD4/wsbDVXpahGuuA0AETHiqqORGppg4PsE3U
RoRQReNPXk9KhPGL6R8YUsUr3AUw88tZALT6OvSB9hXnwjfVoSx+HyjdzVWQNkGk
f80X9wXnG5vsT1dFk/EtuiW6cYtzjOT8y17auNv2uDf8q8rMItMHKnRXtrkBgKi9
NlCVLCqivNe0z/29MBG55nj9vl7GKrZ7lH7S0JizuI2qWb/7qwCvDkrrdJhursUt
JfPBoQ0cppOxzIGnq5F/
=YCmz
-----END PGP SIGNATURE-----

--=-G0Ed8tSTu0GSpHJf5lGi--
