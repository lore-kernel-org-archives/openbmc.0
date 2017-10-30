Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lD/OkMPl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OeGoOMkh"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQrzD6MjKzDqwS
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 10:58:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CAB052083A;
 Mon, 30 Oct 2017 19:58:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 30 Oct 2017 19:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aEzkrm+szCldeulxG/vM1gNWraeTQj+B00fRgkPf6d4=; b=lD/OkMPl
 4ZL35dOOv/ZNBkONWYQYqUi1TdpiKZt6RqlWV4ZLIOw1EKa66Em9r6FW/6rAdcxE
 G7gLaYiQIV7u5asV3xaMqAHzdHCySOhVchiXruznCyPckNoxK+KVBEDYlVrhlODA
 VAVEzUcUibaW4BdCQk8cNV3gkDVWgyL0kK6M5+kCqYZOo/2fpu7YwonuBTIO6e9L
 r/n3eA2fJuD88o8M5/x4YWcAie2vLGEsIv5MQdueRGaasl1CgQb+6NS/3noKmDsC
 1dHn2mtsVBB30w9jzkHHwrD9j3cOTBplIumDsLX0D2QWw9IxlCv8Qj5bkjpH0K1P
 MHiVgzgTRuB6pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=aEzkrm+szCldeulxG/vM1gNWraeTQ
 j+B00fRgkPf6d4=; b=OeGoOMkhgXcaGyQPz1tRWeohdnfqbnJWz1RDXdpmf4XhB
 0Gq92cTAjbuubmbhNPx/KJtcDPa4Mi7AoOxDPPdx4nRAJDg3P7d/3OnBwZHE4Xyp
 ggCxEtYof6fR3jmRTo6epu9BkQLu+HFfl4Jy1tE6HLXkDHLxd8qAxvrySBmVat8r
 CU2j9fA9MDSdsSUcpLHlPg53m2nenqu33j58EgRVNqFDv03l5GgixsmabHnDwFQv
 k9XgvcIItFwahM8EPhShHsyUlyaiD/FhMrS+wV/g6qdbOyyE+ncBRJ2umSEMhx2/
 VA8QL9dqQi5W6sb2hRUddh8Tp5xK/ycl3NweE3YWg==
X-ME-Sender: <xms:orz3WdolvIPJdk9Z6jfWlut9-jDaDkRLKmw858-cyvrUa4oBIQCNWg>
Received: from keelia (unknown [45.124.203.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id 640BF240B2;
 Mon, 30 Oct 2017 19:58:25 -0400 (EDT)
Message-ID: <1509407892.13477.27.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: romulus: Add reset
 tolerance for power GPIOs
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 31 Oct 2017 10:28:12 +1030
In-Reply-To: <1509355215-28727-1-git-send-email-mine260309@gmail.com>
References: <1509355215-28727-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2kWVIWuFxwg1TATPq8AE"
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
X-List-Received-Date: Mon, 30 Oct 2017 23:58:35 -0000


--=-2kWVIWuFxwg1TATPq8AE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 17:20 +0800, Lei YU wrote:
> This is a similar change as Witherspoon, that enables the host to stay
> up across BMC reboots.
>=C2=A0
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=C2=A0
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index c84c871..5965bbf 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -196,7 +196,17 @@ static void __init do_witherspoon_setup(void)
> =C2=A0
> =C2=A0static void __init do_romulus_setup(void)
> =C2=A0{
> +	unsigned long reg;
> +
> =C2=A0	do_common_setup();
> +
> +	/* Reset tolerance for BMC_POWER_UP (GPIOD1) */
> +	reg =3D readl(AST_IO(AST_BASE_GPIO | 0x01c));
> +	writel(reg | BIT(25), AST_IO(AST_BASE_GPIO | 0x01c));
> +
> +	/* Reset tolerance for SOFTWARE_PGOOD (GPIOR1) and SEQ_CONT (GPIOS7) */

What is SEQ_CONT? I'd guess at "power sequence continue". GPIOS7 doesn't ha=
ve
an associated net name in the schematic I have for Romulus, though it's pul=
led
up to 3.3V. Maybe my schematic is out of date?

Cheers,

Andrew
--=-2kWVIWuFxwg1TATPq8AE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ97yUAAoJEJ0dnzgO5LT54uwP/AwRoKhBXPmJXVE6JO/6A5JB
oxWPiilcUn7D/LX+aGo7RpC+yWgDxoYglE05n2wGLZ2MOi0JjMVL90gKSAMsw+Qf
3NYMu/zCqmIJId+lWI0LDvWaYJMlLWvYrM+A0f/l9RjPbPYW5mR624zS7kCfZ34S
cHO/Yv6sAq2wWIEi3RrEa5t/yOKt8Q4HvVVL5vWYrce8gUwXOv9tcYUWFiPYnAjw
+iial0+ezuH0U5Nr3RPGRrsP8GexKsWnj3HJst1cC5uxu61TBNKncOQqE3dRg1lH
vzscEh/Nw7MBAze3XApnjrO+s2N6YS6sYbKs4mTLVHwiy5Db6L572PpRUAG1PJm/
nFCEZaFPIqdp/7DZCkeE5bnfkLIbJkl0AGhM88Kyn+zgbitNRDyzl3osofRpsa+4
L/KalVJgY/cJL52rqHHnhaPGb2ohCyhfBcLniadvF8CeQBtnriVATa5WYWf3u9fP
jXnIP/I3HZuwzmvP2C32+6QoInwiTY+PU2UEVPD85sx6UrbSprVRAmGsrOSBQcJH
jOO6Jv8U1/pwGXQRsZ010QyokTotzjNspNOCucw3c1s5VuLaTsHktpz1H9966efz
LUh3W9tYiR/dTW3mG9k1JEVngJ8VhEfFE/wgw3ey29OJlirE4KJoUC4dz8NDhuMw
54qxDk/gU+0tDCMrbDUA
=1S4h
-----END PGP SIGNATURE-----

--=-2kWVIWuFxwg1TATPq8AE--
