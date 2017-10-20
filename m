Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GG5oaoyF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CT6ntPpY"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJS8J2g7jzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 00:59:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 60ACC20370;
 Fri, 20 Oct 2017 09:59:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 09:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8KdXGtYVQ25QjeQUMo6msmTbmTQT0MoUtZfBhC97h8s=; b=GG5oaoyF
 Ueg2LbLJm8FS/Jww953LXgrgOYEl+r7yP98o3euR0uT3zhi0JMbkzU4DYseYGglN
 AXRQu9Iw0agRy1KCxkMoQz/lfHMNPU2r/Ke4KJjkelH7wm+8Zw/rj7wWCXhoSjDO
 szduAAq/zOwxKBcHEv/OiTDv38Cl3SnQNbQnUJ0/Ph2oj5Nl6492nVoOhwgdIaa9
 iNkVjXpGOIrc6s8cjQ1gWP8jMN+tnwOaHitXhk9QbQ5N/yv3EfluOJTvtDdlmI2H
 MYKR2AL7JW9RKagcSzPgKYGfDgQmsXBl4sx9OP8mgJK0xDH410DZRsVWps6EGnmB
 Rw3Zatu3tRo3og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=8KdXGtYVQ25QjeQUMo6msmTbmTQT0
 MoUtZfBhC97h8s=; b=CT6ntPpYH1AbjTEK5ObtG4aOdPKw/SoE40ROVxDvvYtRc
 fjqXrCfOIzgFr2JmmmfYIhmcaw7gGKmdyaQMyL5/j5+cLgboM1LiTnyjZL5cBw6r
 0NnWeUESbhOV5HxZS96L64Iw6KogA4aiqADX1PPxLDn00sGaeij2CsPmg8a55GM5
 JiyDrrCpyfWKttgeEEhIWaFstlLEvnah1Dgxbl7FKGbyvF8P0XQBtEfvGEJecxo/
 esuNCNciXvFr9IMJirc1i9f18HKrG+dVZUBUbweVS8wTbjaCJ6E226tYq3Ofpl/m
 8uiYLB2Gg6PaTGqqmla4zFf2r0puD1kufxS/P4+Cw==
X-ME-Sender: <xms:LgHqWcfgwPaqsPXqx3a5Lqci5OlJIpDtxCJjkRXq8WjnCc4Y5-dVYA>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id E37F1247DC;
 Fri, 20 Oct 2017 09:59:08 -0400 (EDT)
Message-ID: <1508507945.24322.56.camel@aj.id.au>
Subject: Re: [PATCH u-boot] aspeed/timer: move static variables under
 arch_global_data
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Sat, 21 Oct 2017 00:29:05 +1030
In-Reply-To: <20171010130925.19345-1-clg@kaod.org>
References: <20171010130925.19345-1-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+yiy73YkIzF6n0WJdtYI"
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
X-List-Received-Date: Fri, 20 Oct 2017 13:59:13 -0000


--=-+yiy73YkIzF6n0WJdtYI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-10 at 15:09 +0200, C=C3=A9dric Le Goater wrote:
> The timestamp and lastdec variables are under BSS which is a problem
> as the timer_init() routine is called in the early init phase. Move
> them under arch_global_data.
>=C2=A0
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Applied to v2016.07-aspeed-openbmc.

Cheers,

Andrew

> ---
>=C2=A0
> =C2=A0Tested on AST2500 EVB
>=C2=A0
> =C2=A0arch/arm/mach-aspeed/timer.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-aspeed/timer.c
> index 626f992429b6..d4a85116e80b 100644
> --- a/arch/arm/mach-aspeed/timer.c
> +++ b/arch/arm/mach-aspeed/timer.c
> @@ -31,8 +31,10 @@
> =C2=A0#define READ_CLK (*(volatile ulong *)(AST_TIMER_BASE + 0))
> =C2=A0#define READ_TIMER (READ_CLK / CLK_PER_HZ)
> =C2=A0
> -static ulong timestamp;
> -static ulong lastdec;
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +#define timestamp gd->arch.tbl
> +#define lastdec gd->arch.lastinc
> =C2=A0
> =C2=A0int timer_init (void)
> =C2=A0{
--=-+yiy73YkIzF6n0WJdtYI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6gEpAAoJEJ0dnzgO5LT5puEP/1eseKUF3ExA1g09PjNIcxcU
jm8SXzvPgxk7ApBU27BEB499bJMrIUdg183lLgPe/izpt+TnfBZfJvsTM4I1L9qX
JtzS4eDWBfk+w8dCvpmgMpKUHyCS2wjEFA+2KQ1paCTAg8OJY8xZqxIL+hrdJbkN
HgYhGSMFElR9IjKaPnz9EtaazEqBjQ7W9NkNW1XrvbomeFm/9k5EbvaAMusd/zQB
K8mgIjoUx24oRkW0At8Ic772oFY7USM4iN6rPGtNv1oVLgH6p/AADHIYciG5Fpf1
WYt5b/u54ZPcLJSMyLcPVJ6djIb06Yw8F3C/pDxiih7Jvz5K6F3jAcsVrxuMuu3o
mO2pmoMnFvnCk8XGGPcbi79rw0d2bTNThYG6nHJ6Btmjwdwj2x8xrF9qnuHcNZxl
4YaI9yCIPVWOMsaSwfWVQ9OA9zw9KBoOUnLJLiQP/m0Z/Txmsa8mEk9aYr48r3j8
kh5SVejVSOoWQQczZ1Fz7PCblMb8YRJdboKPTXGNA8F5LOAdsZlkkDTYsemem3DL
E1gykqwjGjrUIuE1C+QFyzqXt3NP6htKsnz/enPba9FvhxXbZLzszV/m7yZwVfOq
aY0W3fGebZhIeW4nSVfzB6qwxAcVHXmu4LHJKCdbzFTmxvdYxxmZmCv1dX3JzyaW
/nuVvkEVFkT4nG5yC1lw
=Y3im
-----END PGP SIGNATURE-----

--=-+yiy73YkIzF6n0WJdtYI--
