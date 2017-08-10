Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSh7N3mbzzDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:26:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dJDWbDgu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SZTfvHSU"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E0F520D60;
 Thu, 10 Aug 2017 04:26:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 10 Aug 2017 04:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=IRoCxU4ZXX/Rm+6FjJsh/rRtcuSqqu41wb+UnzH5e
 5s=; b=dJDWbDguGe8q8j1pw/zZNTVtuFy4UJEgJejQoy2rgJjYttB7/T3PTKh3M
 04FhNFq5vIvjmQAQB0vkCmBCZZatfDW9xdhRdsURJcpMfSNPv/wZpnR+aF/7c4XI
 OdEgcnNreZBTCHNEKdhrvDB1W2cjgDJGCMQiGpEy4Q5h95YI8NBm3AcyLUMGQ2g0
 BNjmtQEBi/NSC0A6dxBFrj0N+lqEjsA76jIoDk4+mxt4QOfkfoZuqtESKyKcELk4
 WseBTxosbzB1FmI4HwEX4Yjt8g5g5FlWxVL+F8vIeZTbIGyWtPOfuMF0w27dX0Ti
 siIqzKKxsTp2I2hbUYbtqcRUIX06w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=IRoCxU4ZXX/Rm+6FjJ
 sh/rRtcuSqqu41wb+UnzH5e5s=; b=SZTfvHSUTZ/Z6DWi+WQz+vdPfxqAxu2VHU
 0cHE2p7q32ullzPyLWp/C+jiGGH0HJ7v1cCxAnB8H2cwCn/doy/4rg1ODRYwkqkg
 MTvkAFf3UCIMvGMr4s7rXVYnHySete34tkXvJrru5MuEg3qtTeBNjth8k1XqgO1P
 0tl32rWm+Ta5e1hS5hR0Hpnjhzc6s3gfOkU3LTsCt3ep/mph7DUxh+2Lyg9lUZa5
 ylN71H2vWkXPImw2KE4d/MPlFm4MMVFnEzGpWtMogpA3q/Iz1nw9viwjIk+2TUqT
 LB8kw7mR0fQf4ivFg3yiHjwcuxTlVxA5hRkWmnVaXpVriiJ1P0zA==
X-ME-Sender: <xms:vhiMWSkJf-3Y7IHKk_rEobsmQD2gqaay3BBG1rCI-5CmypslQc9grw>
X-Sasl-enc: Oao8Fz/l/PKLldAozXErezQouJ2VhWOl9JTSpZlN0W19 1502353597
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24B5E7E300;
 Thu, 10 Aug 2017 04:26:36 -0400 (EDT)
Message-ID: <1502353590.7946.15.camel@aj.id.au>
Subject: Re: AST SOC gpio pass-through support
From: Andrew Jeffery <andrew@aj.id.au>
To: Yong Li <sdliyong@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 10 Aug 2017 17:56:30 +0930
In-Reply-To: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2EhMZSnne5c4OJaB2cc8"
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
X-List-Received-Date: Thu, 10 Aug 2017 08:26:42 -0000


--=-2EhMZSnne5c4OJaB2cc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yong,

On Thu, 2017-08-10 at 15:50 +0800, Yong Li wrote:
> Hi all,

Welcome to the list!

>=20
> AST SOC supports GPIOE pass-through function, I would like to know if
> the kernel provides such API/interface to enable/disable pass-through?

Yes, the kernel's pinmux drivers can configure GPIO passthrough for
you. In general, all the functions are documented in the pinctrl
devicetree bindings:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt?h=3Dv4.12

Specifically, you are after functions/groups GPIE{0,2,4,6}. We already
have these defined in the Aspeed DTSIs, so to configure them you can
add something like the following snippet in your devicetree:

    &pinctrl {
    	    pinctrl-names =3D "default";
    	    pinctrl-0 =3D <&pinctrl_gpie0_default
    			    &pinctrl_gpie2_default
    			    &pinctrl_gpie4_default
    			    &pinctrl_gpie6_default>;
    }

Specifying the mux configuration in the pinctrl node is probably as
good a place as any, though if you have somewhere more relevant you
should probably use that. Naturally you can remove any of these
phandles to only select the specific pass-through configurations you
need.

If you want to pass-through the whole bank you can also set the board
strapping to make it the case right from power-on. The strapping
register *is* writeable, however the kernel's pinctrl driver treats it
as read-only, as really, the system designer ought configure it either
via pull-ups or in the boot firmware.

The passthrough capability is a bit of an odd case - despite being GPIO
I chose to represent it as a pinctrl function. Hope it makes sense to
you.

Cheers,

Andrew
--=-2EhMZSnne5c4OJaB2cc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZjBi3AAoJEJ0dnzgO5LT5d9gP/iNc0X2Mnzilto0rDv6INHh5
SeaMrkSaKi9HnEt6wutfCNOFZ5MdWAKTpPdLv+bCdCBpLvyIYQB14AlT/1aRQjO5
JKb6qqhNfjtEAoYbWbCNUIkqqi4/m2tixQms+42uqVfZWG1dpEakUCn1BgkJRi6s
Y9epZ6nhzOLvNurKzDOoQq3fq9l82i3ExRJ8rEMo6DDwsCG79qIjDVK2gk8X/Jmi
lSe1Yigo0YorIJZdGD0nMZ8H8LRX1cfKV4Hpl+m4JqIfVhDOVYw+wQ6vchaP+CtI
ZbyjbH1hEI6Q4k5t7lz//no1Lx8hq6qqTQETPSoysXWmYh6GDGUvfj9tr7nhKuY+
aq/OqJrd/lJFYKieg0XoD3haKFeu0fay7tBWjKW+NP0ZFXFOF/rXcRogAI0h+CbB
PYe0TP1Z6JG6BTlOV8qjvnOOQJuQLPKOV5jUnsMiPylE0TCLY+VDztAs9T6DBSca
uvZdOFnPFJhCzqpJD5ZZZXz0kAj1Df3fmACWU1DzcqqGoHil9+3K6rO8vGXKVhV7
uZJWriJ4860PcDhyw7vWKXNBETfZDvDiDjmNcMQJ0upWmZeWYVgOxUFjtX4SwdBy
4aB2ORizPNRjzZ01j4H2U0YFnKEtaCX+Fppb7tymJpFARWxkckZ9A/3JFJe1DKzx
H3cLTSUV+ZKdvbLYAeeH
=S9oZ
-----END PGP SIGNATURE-----

--=-2EhMZSnne5c4OJaB2cc8--
