Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QGRyHJIM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cZ7XhmzJ"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCxBT5D6TzDrBt
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 16:30:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 515CF20D25;
 Fri, 13 Oct 2017 01:30:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 01:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bCt0BbKdxuAjs4e/IZmV8saPzL33dH9KRODfP/fQMys=; b=QGRyHJIM
 BItYH0AE4EYLsixPtvKzle3ZmYe9CsImULZmvNoxhPirQFrW7PBGFtMvk1/TgDUP
 rjwI5b8FjKpEpliWnlDD8fExMcVoImjK1gDXXqTmWxCSAcA8Cn1SPpCcFTJbw3og
 eS4SPu4I4blbHRY4HFOLs2mVVGneHWj4FXDaX+Vr5JXxvnU+rAtQvuTo882hW8JJ
 9vk4x9O2ODaWA3a4RXJnkaSfTYSW58zLmphN2exeW65kx11qeso5OHiSMJr9W1gJ
 eGFk8Sf0oWWbjfjWGC6v+zdxdvAZB6TBw6fe39XKRuGv1iCc1n1yH+ysmA/mCpfb
 OVTfvurzvmcmTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=bCt0BbKdxuAjs4e/IZmV8saPzL33d
 H9KRODfP/fQMys=; b=cZ7XhmzJLZOWZr4e6OT8RWKxde2dPMcn5RoIU/81Yu0Kr
 Q9jvHTMU/HC+BG5k1YcknCno/hsx88Z+adK1GFbdAghY8l+t7C4fZfTZGU2C/wLI
 ELD6ByAFAh/Gl49ocNg8ZaguNBmD45DEkQUE4lxXiHG9pm64fQ3h3Qlyyu+HY+OA
 mYT/4gxgkN3HuSV6qcqFA5j4LmWhZhPXRUAsJA6w1lND1CGGPG2HLwMNK86U8CTn
 k7xuQVAAhqwe8RVCApaS6oxCXVpU2jb1pBUJyjFRd59qbNJo3RYX+BoPspgPfAMi
 fC5X0QUrb47Tv+6XKWC1bcTPljrGVXA2gPbRe3bpA==
X-ME-Sender: <xms:b0_gWQqrEXpY_Cd4tZpFfbOOpHbDidOHoIic8cTVh2qLBN6v6BcJdA>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id A713724141;
 Fri, 13 Oct 2017 01:30:21 -0400 (EDT)
Message-ID: <1507872618.5452.201.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] aspeed: firestone: Set SIO to bypass
 UART in hostboot
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Fri, 13 Oct 2017 16:00:18 +1030
In-Reply-To: <1507707680-19898-1-git-send-email-mine260309@gmail.com>
References: <1507707680-19898-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-poJjLBvcodd+RczySlJJ"
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
X-List-Received-Date: Fri, 13 Oct 2017 05:30:26 -0000


--=-poJjLBvcodd+RczySlJJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-11 at 15:41 +0800, Lei YU wrote:
> OpenBMC fails to boot host on Firestone.
> The cause is that Firestone's hostboot hangs after disables
> SUART/VUART.
>=C2=A0
> The workaround is to make hostboot run into default SUART init
> without disabling VUART, by setting 0x170 SIO register to 0.
>=C2=A0
> With this workaround, Firestone boots OK.
>=C2=A0
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10.

We really should start to think again about how best to do this from usersp=
ace.

Andrew

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=C2=A0
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index a9e91d9..c84c871 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -104,6 +104,10 @@ static void __init do_firestone_setup(void)
> =C2=A0
> =C2=A0	/* Override serial destination to use the dedicated serial port */
> =C2=A0	writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
> +
> +	/* Workaround to make hostboot run into default SUART init */
> +	/* Otherwise it fails to boot */
> +	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x170));
> =C2=A0}
> =C2=A0
> =C2=A0static void __init do_garrison_setup(void)
--=-poJjLBvcodd+RczySlJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4E9qAAoJEJ0dnzgO5LT56K4QAKKLmJ+uUhhoniDlisOmABXs
Ndm+uV5BGP+5wbqgGTJFk88m74GjbSmpdTamIiLvA+W0Xe+xb7oSu8c7CJPmjA5Q
CqY+8/yuIUXAhVg5fKXAR1cj50cEmi2KPlQz//42jX8bwZRmymSaZ+M9ztzMtcSa
/4/9zWN8rG/tb/0J/rkq+sVa3ocEfjn5FOMXxWJle12hq9Jh+I7Rz9z7XRRoYbeI
8SwIKAg+4BojehG9dB8tAEp1TddvHgKhpqJcv42pauPL3sLgSLPdhd13SsWTa+BW
5e4UZIyp8pac8NbZFLddILbWZHMBeyWDn9fKVXw4+9vt7RrKlQzHwrkwI2x3iUIl
pt7j7KXozurB1Ej6s6VIDsTd3bmF5Qs0VtUyowQmmjN/+ofRJgGQIHmJsHAq3LVS
Zm20jYWdh+0jh4zPiMkiQZQqrUAkqzw7xHqRgrcAsZYe8DBmzwyTngUBXzyQ5W0O
jqaK0Ek+ZYWK0t9v95zotvRoBGzc2qSmRMSGGEDTSumdH6Ir8b9SUAKg3IPwqZ67
uYyjBvJk/pQPs6xp6g9w9whDMZtVpplH3hq7AwkH1h4/ScqDydnwsagw11x5sjkt
wnG6IDTmQvkHh7wh+OjXdaVCqu/ehQnda0j/Nz1ET8Uab6pn+bqtXqbhYHegLP46
0UCrYvH+8OXaNKuzWJAj
=R7KB
-----END PGP SIGNATURE-----

--=-poJjLBvcodd+RczySlJJ--
