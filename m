Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XLeC+VHV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DRDFlyNZ"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQJD66rRzF1s3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:00:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9446821B78;
 Thu, 19 Apr 2018 00:00:42 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 00:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=1eimvYLVuYR1ipwKLZ35Vno3s0LM6
 1+3iLEgZmEEMD4=; b=XLeC+VHVUAc7kbSZq+L/6wbCg7C8zZDLs60qddXm3PTKb
 9zmL51ZiPkwgfc4E/drqAo0dZgEguKvilmDB45UeJ3IvNvqCcGdumWn9DgvrR/A6
 dCP3fs8iWKn+VBkW6vf22lp14Wjquwk/75bGew2K6DY7LDsTGWlCJ1vTP30bs/Se
 6rVp6ysSltyiEk5NnJfbiwK/VI8u+VuVMKk738+qduTMr6fjudYoZ/GYN+vm2faO
 lQ59d2bq4i2JlhQ0PYpOaM5kDdxdlGRXLVPQHdl1CGOncr+2nkIkIQTndrvtZv6V
 lh8hgelOfvo88SBge9fKs91xCp2BYR827BT9aWr5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1eimvY
 LVuYR1ipwKLZ35Vno3s0LM61+3iLEgZmEEMD4=; b=DRDFlyNZ+WygemCZxcXAGx
 uNe4QECjZ1oCeXw9PMfaGYfKAcRVI+puhX93kRfWy/1yry5qBaIPMS+3txQxRn3j
 aimihAhsftDn3QGyXyzQQkjgE7DbAWU8OjiYZ85pKAW2A+2i/tJ2lJD4DVwIqLEP
 XRb3BvR2ZSosGapZlz55NGtxPZHF2am5AAJ09jzzj+VD8VmVQJ4KZKEO/nAf8RpX
 JFsMKV7faUrgU5r0IrkDf4K0TKR/7T9b9m41JJkdGwIOw+xbcPQHAQx3RR7A+npi
 Lqax1TF+1s1T73zG0GIfu4sA7p6iqcQo+Ui8oaLB6jzR5/a4/Sv/Lk6bDWqdsh4w
 ==
X-ME-Sender: <xms:ahTYWnUJg1cTPDTzzeYYNueivVrHSQwOZme73THckSx3Pa-4J5fOSw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 33A034256; Thu, 19 Apr 2018 00:00:42 -0400 (EDT)
Message-Id: <1524110442.2424770.1343182008.51EBEAAA@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Date: Thu, 19 Apr 2018 13:30:42 +0930
Subject: Re: [RFC PATCH linux dev-4.13 2/3] dts: aspeed-g5: Expose VGA scratch
 registers
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-3-andrew@aj.id.au>
 <CACPK8Xfijj9Ym5pLaP8ES_YYsw+VmDj+=16_6DkU44ckq0sZYw@mail.gmail.com>
In-Reply-To: <CACPK8Xfijj9Ym5pLaP8ES_YYsw+VmDj+=16_6DkU44ckq0sZYw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 04:00:45 -0000

On Thu, 19 Apr 2018, at 12:57, Joel Stanley wrote:
> On 12 April 2018 at 13:21, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> > index 1468b4ad22dc..8321df50c593 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -158,6 +158,11 @@
> >
> >                                 };
> >
> > +                               vga_scratch: scratch@50 {
> > +                                       compatible = "aspeed,bmc-misc";
> 
> Convention is to use aspeed,<socname>-<hardware>, so this would be
> aspeed,ast2500-bmc-misc.

Yeah, this partly comes back to the naming problem you mentioned in the other patch. The functionality is generic, and so probably shouldn't mention aspeed at all, let alone the SoC revision.

> 
> 
> > +                                       reg = <0x50 0x20>;
> > +                               };
> > +
> >                                 hwrng@78 {
> >                                         compatible = "timeriomem_rng";
> >                                         reg = <0x78 0x4>;
> > @@ -1425,3 +1430,46 @@
> >                 groups = "WDTRST2";
> >         };
> >  };
> > +
> > +&vga_scratch {
> > +       vga0 {
> 
> Do these names come out in the userspace API?

Yes, though you can override the use of the node name by adding a label property inside the node. That way if someone complains about the node naming we don't have to break userspace.

> 
> > +               offset = <0x50>;
> 
> Would reg <> be more devicetree-y than offset = <>?

There's a mix. I was looking through some other syscon-type stuff and some of those drivers used offset. This approach might avoid militant opinions around the relationship between the unit address and the reg property, as you "can't" have multiple nodes with the same unit address. There's some discussion on this in the PECI threads.

> 
> 
> > +               bit-mask = <0xffffffff>;
> > +               bit-shift = <0>;
> 
> Should we assume this is the default? Or something else? Having a
> default for the common case would be nice.

Whilst the nodes I've added in these examples expose an entire register, I think this would actually be a bit of an unusual case. More likely you'll want to expose a single bit from some register, in which case a default for mask (though maybe 0x1?) or shift isn't going to make any sense.

Cheers,

Andrew
