Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t93qz1MRrzDvM2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 12:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="g5SLDkWR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Rb14h4Xu"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DD2720694;
 Thu,  3 Nov 2016 21:18:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 21:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Wpa0t9LT+kOCMZnCf4AnDWN9dRQ=; b=g5SLDk
 WRx6TB1Kq4t3tOEc1O2+B+qr+V7XqDSY6WXcdLjSStc94ZifSWI+A5RYQ1nMQSNb
 6qxOPr0cHj2Se+tNonxbAl7mrbEGao1ZWgCnfSVpYtxME5KkAJBsro3zvfeF7MaS
 C6wjrzVL1M3vTR8AEbPCIZtuA81ntyBNR4WKc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Wpa0t9LT+kOCMZ
 nCf4AnDWN9dRQ=; b=Rb14h4XuDv2Q1moA1MdA3Lr2RBp9u4sgRJQIhxbHRawUuu
 1QS7+qrd7w2OTLh6q1tHSchslSU51q2FJXrvHhtSwmkIKzwdrvAB/yRn4mfA5Ggy
 zeZ8BuEEqTpm0ryIcD37xxcx5IqGU9CgQAM5WKocPnDzOPf3xJTRhzBYsrCZA=
X-ME-Sender: <xms:3eEbWAsunTS7CZu7KWPxKnLnJb8wk6WfLI4liaWZcM3I89Ts1c_WvQ>
X-Sasl-enc: +1U6cNu/zBISvcSQIFC4H0R5k2Mv8nlcCG1bqVPS+oBv 1478222300
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EEA7F29CC;
 Thu,  3 Nov 2016 21:18:18 -0400 (EDT)
Message-ID: <1478222294.27396.44.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v1 1/1] pinctrl: aspeed: Enable ASPEED
 pinctrl driver to modify SPI1 strap bits
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>
Cc: Kun Yi <kunyi@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Joel Stanley <joel@jms.id.au>
Date: Fri, 04 Nov 2016 11:48:14 +1030
In-Reply-To: <CAPH-5w5utE=U7mP1YhQybKQq8+1AsupnUmA1Mek03VYUh87z+w@mail.gmail.com>
References: <1478126380-3189-1-git-send-email-kunyi@google.com>
 <1478126380-3189-2-git-send-email-kunyi@google.com>
 <1478136791.27396.19.camel@aj.id.au>
 <CAGMNF6U=uky88Cooop+jPso2PANgD=8nOr3ZW+3iK+GZ1pJFjQ@mail.gmail.com>
 <1478146015.27396.23.camel@aj.id.au>
 <CAPH-5w5utE=U7mP1YhQybKQq8+1AsupnUmA1Mek03VYUh87z+w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-OqFlVup5DYt5xP/6ZhBL"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Fri, 04 Nov 2016 01:18:23 -0000


--=-OqFlVup5DYt5xP/6ZhBL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-11-03 at 13:54 -0700, Xo Wang wrote:
> On Wed, Nov 2, 2016 at 9:06 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Wed, 2016-11-02 at 20:47 -0700, Kun Yi wrote:
> > >=20
> > > Thanks for reviewing, Andrew!
> > No worries!
> >=20
> > >=20
> > >=20
> > > On Wed, Nov 2, 2016 at 6:33 PM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
> > > >=20
> > > >=20
> > > > Hi Kun,
> > > >=20
> > > > On Wed, 2016-11-02 at 15:39 -0700, Kun Yi wrote:
> > > > >=20
> > > > >=20
> > > > > Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only=
. Changing
> > > > > SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1, a=
nd keep
> > > > > other strap bits as read-only.
> > > > >=20
> > > > > Note: with this change devicetree default pinctrl settings for sp=
i1 will
> > > > > effectively override any previous mode set by physical strapping =
or
> > > > > aspeed.c when Aspeed smc driver is probed.
> > > > >=20
> > > > > Signed-off-by: Kun Yi <kunyi@google.com>
> > > > > ---
> > > > > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++=
++++++--
> > > > > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A02 +-
> > > > > =C2=A02 files changed, 21 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pi=
nctrl/aspeed/pinctrl-aspeed.c
> > > > > index 21ef195..c647503 100644
> > > > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > > > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > > > > @@ -16,6 +16,8 @@
> > > > >=20
> > > > > =C2=A0const char *const aspeed_pinmux_ips[] =3D { "SCU", "SIO", "=
GFX", "LPC" };
> > > > >=20
> > > > > +#define SPI1_REG_MASK=C2=A0=C2=A0=C2=A00x3000
> > > > > +
> > > > > =C2=A0int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pct=
ldev)
> > > > > =C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_pinctrl_data *p=
data =3D pinctrl_dev_get_drvdata(pctldev);
> > > > > @@ -178,6 +180,7 @@ static bool aspeed_sig_expr_eval(const struct=
 aspeed_sig_expr *expr,
> > > > > =C2=A0 *
> > > > > =C2=A0 * @return true if the expression is configured as requeste=
d, false otherwise
> > > > > =C2=A0 */
> > > > > +
> > > > > =C2=A0static bool aspeed_sig_expr_set(const struct aspeed_sig_exp=
r *expr,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool enable, struct regmap *map)
> > > > > =C2=A0{
> > > > > @@ -197,15 +200,30 @@ static bool aspeed_sig_expr_set(const struc=
t aspeed_sig_expr *expr,
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/*
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* Strap registers are configured in hardware or =
by early-boot
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* firmware. Treat them as read-only despite that we ca=
n write
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* firmware. With the exception of SPI1 interface bits,=
 treat
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* them as read-only despite that we can write
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* them. This may mean that certain functions can=
not be
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* deconfigured and is the reason we re-evaluate =
after writing
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* all descriptor bits.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0if (is_scu && (offset =3D=3D HW_STRAP1 || offset =3D=3D HW_S=
TRAP2))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0if (is_scu && (offset =3D=3D HW_STRAP2 ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0offset =3D=
=3D HW_STRAP1 && desc->mask !=3D SPI1_REG_MASK))
> > > > Maybe the mask comparison would be safer by rewriting as:
> > > >=20
> > > >=20
> > > > >=20
> > > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0if (is_scu && (offset =3D=3D HW_STRAP2 ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0offset =3D=
=3D HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
> > > > That way if (for whatever reason) we change the approach used in th=
e
> > > > -g4 and -g5 implementations we still get the expected outcome.
> > > >=20
> > > >=20
> > > Good point. I will change this and the next mask comparisons in case
> > > only one of strap bit 12/13 is used as desc->mask.
> > >=20
> > > >=20
> > > >=20
> > > > >=20
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0contin=
ue;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/*
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* HW_STRAP1 bits can only be set to 0 by writing 1 int=
o
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* bits of same offset in SCU7C. To configure different=
 SPI1
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* modes, we write 1 to SCU7C[13:12] to clear SPI1 mask=
 to make
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* sure later write to strap register can take effect.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0*/
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0if (is_scu && offset =3D=3D HW_STRAP1 &&
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0desc->mask =3D=3D SPI1_REG_MASK) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D regm=
ap_write(map, HW_STRAP1_RESET, desc->mask);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0};
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0/*
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* Sometimes we need help from IP outside the SCU=
 to activate a
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0* mux request. Report that we need its cooperati=
on.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > > > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pi=
nctrl/aspeed/pinctrl-aspeed.h
> > > > > index 68315a8..46ba16d 100644
> > > > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > > > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > > > > @@ -268,6 +268,7 @@
> > > > > =C2=A0#define HW_STRAP2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
0xD0 /* Strapping */
> > > > >=20
> > > > > =C2=A0#define SIORD30=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_TO_REG(ASPEED_IP_SIO, 0x=
30)
> > > > > +#define HW_STRAP1_RESET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_D=
ESC_TO_REG(ASPEED_IP_SCU, 0x7C)
> > > > Maybe HW_STRAP1_CLEAR would be ... clearer? Also in this case the
> > > > SIG_DESC_TO_REG() macro is not entirely necessary as we're talking
> > > > about the SCU, but being explicit is good. As a note the macro(s) h=
ave
> > > > gone away in the v2 of the series I've recently sent upstream due t=
o
> > > > feedback from the maintainer:
> > > >=20
> > > > https://www.spinics.net/lists/arm-kernel/msg540082.html
> > > >=20
> > > > Otherwise this looks good to me. Thanks for looking at the problem!
> > > >=20
> > > > Andrew
> > > >=20
> > > HW_STRAP1_CLEAR does sound better, will rename in v2.
> > > Since SIG_DESC_TO_REG() is removed in your v2 patch, should I directl=
y
> > > define it as this?
> > >=20
> > > #define HW_STRAP1_CLEAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x7C
> > Yes, that would then work in either case (with or without being applied
> > atop v2).
> >=20
> > Thanks,
> >=20
> > Andrew
> >=20
> > >=20
> > >=20
> > > >=20
> > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > =C2=A0 /**
> > > > > =C2=A0=C2=A0=C2=A0* A signal descriptor, which describes the regi=
ster, bits and the
> > > > > @@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl=
_dev *pctldev,
> > > > > =C2=A0int aspeed_pinctrl_probe(struct platform_device *pdev,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0struct pinctrl_desc *pdesc,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0struct aspeed_pinctrl_data *pdata);
> > > > > -
> > > > > =C2=A0#endif /* PINCTRL_ASPEED */
> > >=20
> Since the SPI1 strap bits will be mutable by the pinctrl driver,
> should we take the hard-coding out of the mach-aspeed AST2500 fixup?
>=20
> xo

Yep, I've replied as such to Joel's patch[1].

Cheers,

Andrew

[1]=C2=A0https://lists.ozlabs.org/pipermail/openbmc/2016-November/005419.ht=
m
l
--=-OqFlVup5DYt5xP/6ZhBL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG+HWAAoJEJ0dnzgO5LT5hm0P/jGbcyU5F8NZqPVBmFb6gyOK
N3DrmcpA7uQJ9+6SzX7coMrcqtFhIj/xYunCBYZM3cl89RmToRJzuTa5/tmjTrtW
CHzKGw5gHLZI31omCtC+TYm76eXL+px8JFVKg9VcSAjLucfplI64T/sxNgbIZB0K
Q1BjROBxonfILudKoGsy1mHVqJff2rzOo04IxlZQ/4WqQkmFSA1km0/oOlGwiP17
CRBtVQya9lev/WIgww5iFt2YRmi96jtdxXvQRP04Bf6UBRThxLy2GFWLPM6AhA2o
rFDIG/2Fal0zt47LkgAvvhNJSDIj3a8UlU+N77BtigzPh8ioIeqSkpi4SfJa3eQe
ivhiQAGrTDjtcRHoni19PcWHkUEknlzv15Fo7aEcJ4ukUY0W/BQT8e9ihTSSm637
7RBYBH3De+c0wMAp+CGNbTMjoB/GkeIpcjXNp+x/ACP2lR3QL9fjSVcfwIaKs4LG
cjnknhVoWZNKcp4m/QBzTCw5//FfztnjJk9h4DnhjFGsDxBjNjlG4Vwohs/12LI8
vzIqzQyjMTXyti9ZKLk3/PN/2f+gbWsdNuSXpggUSPFcRnMcPQ7E0cP39vtSAb2U
TRoKT90G+xZI6Lx7u6hjSuRZjdq3CfZekuwki+RJLuIhsoHfxkaPo1e0GSdlc3Qt
6l1zAHb2RVkT3sn1iLOo
=z4/3
-----END PGP SIGNATURE-----

--=-OqFlVup5DYt5xP/6ZhBL--
