Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Z0tPMMsx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ITMpZxv0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wT1Z1R4lzDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 08:29:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC73421B6D;
 Tue, 29 May 2018 18:29:51 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Tue, 29 May 2018 18:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=x+qmqw/ClD48Yypg9wZIIu9suI5+y
 FG2GJJaB3jdE2Q=; b=Z0tPMMsxlAucLKkNVAh9FZmecwyE2GNZ0CoYxELd987zx
 ep+0fWLAyTjDES7mWW7stvnqEmjwntcznL6ytONgRNCfm3uTiLvYXIP6PaWjCUWm
 2PBFtrcczmrQxhpDZoG4gA4/Isyapjge9yVHhoMXLPH0e1tOub9dRRDSmNxfhbRc
 vPeXi+NQlMRztht46W30bd33Zjd8kVEnQgD/DBBzqqBH5+QFpijpgJhX3Y45Wb9b
 FzduU7v66XOJZwaFGnv063m5udU2iP0mBPeBFxqV+0iM6ADSrjuCsIeQt8oQzAnV
 dCMN7+SDtgfB9c/U2a9529qL1r4LC1rj/Oo6PJ8jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x+qmqw
 /ClD48Yypg9wZIIu9suI5+yFG2GJJaB3jdE2Q=; b=ITMpZxv0WuOcpDUCBA4TyG
 mvI3vJnXRu4wBCCyIdaKI1SOAn5QJzqxY4cUsavbTTzPogKKmgYy1+z8GRh39mMA
 Rraho23m+Zau7mOfgPqqV0m9HHArhBicLm39tytewxCufjx4n1P/q4hQAJTb/oes
 k6t2dWgRTVhFEeNKTqtkmmkSRRiJkaD+QHvsFczCa7f2ppRl4VPDxbUo8YHcpXYb
 gTsPWzW/J0Ls2o2vUD5f37t5D0WhqSSCxBeTVvYkNBZf5STJje/cDY9w0g/hMVxZ
 9rPC3bkyEI8ed9GJJ0fYj2R/Tw7Fkp930dQry+6OiLSw7Fud8mTnQOoCOno8KLWQ
 ==
X-ME-Proxy: <xmx:X9QNWyNCFiSFvgzd5iNtfLQzXXbOahinUyQ4l8g3n36f8KSG-K8OgQ>
X-ME-Proxy: <xmx:X9QNW3GfWErFi3F-2mNEsv8Cc1HBoD2s2qPoJEcMrXoIFgjgYm5vGQ>
X-ME-Proxy: <xmx:X9QNW-0Q4-t9WIy35uqqxsaYzwFrw5UC5wRr1kQzAq_BRZtUQvTAew>
X-ME-Proxy: <xmx:X9QNW2HAhNfneUG60oSaTLh2Ag0B6uAUh5qyMcitD2UlVhue0nI4IQ>
X-ME-Proxy: <xmx:X9QNW3zWNZtMBrEXQTSwcKJtPraUAsGQVYgGUJIB4aGfAbosyhfO4A>
X-ME-Proxy: <xmx:X9QNWwLQ6vB2CGyq3E3aUBRlJhIj6WFAaWSAgtK_JPk2TBLwPHLR1w>
X-ME-Sender: <xms:X9QNWxzuEar7SyNwXF2s_sfxv3DfSf5dwdN9W-p15a2B0TGdNRfE5Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8CB4D410C; Tue, 29 May 2018 18:29:51 -0400 (EDT)
Message-Id: <1527632991.3398719.1389731000.5B812F18@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Khem Raj <raj.khem@gmail.com>
Cc: openbmc@lists.ozlabs.org,
 "openembeded-devel" <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
 <1527631428.3392595.1389703584.53FF3C93@webmail.messagingengine.com>
 <CAMKF1srL5ovf3FfNsk-S83djSY63gG4UyBmqGohvgEfJsW4qGA@mail.gmail.com>
In-Reply-To: <CAMKF1srL5ovf3FfNsk-S83djSY63gG4UyBmqGohvgEfJsW4qGA@mail.gmail.com>
Date: Wed, 30 May 2018 07:59:51 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 22:29:54 -0000

On Wed, 30 May 2018, at 07:53, Khem Raj wrote:
> On Tue, May 29, 2018 at 3:03 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >
> >
> > On Wed, 30 May 2018, at 02:34, Khem Raj wrote:
> > > On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wro=
te:
> > > > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> > > >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > >
> > > > Ping - is there anything I need to revise for this patch or the
> > following two?
> > > >
> > >
> > > There was a review comment for you to adress, see
> > >
> > > https://patchwork.openembedded.org/patch/150467/
> > >
> > > if you have addressed that please send a v3 for whole series.
> >
> > That comment is on v1 of the series. This is v2, and I have reworked the
> > recipe to simply clone the git repo instead of grab the tarball to avoid
> > the issue that was pointed out.
> >
>=20
> Ok thanks I think the v2 seems to be missing in patchwork that=E2=80=99s =
the reason
> it will go missed i wonder if you resend than patchwork will catch it

Someone has archived the patches. Here they are:

https://patchwork.openembedded.org/project/oe/patches/?submitter=3D12303&st=
ate=3D*&q=3Dv2&archive=3Dboth&delegate=3D

Cheers,

Andrew
