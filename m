Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nbhlsfPF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JgBbpqJ+"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411Ssq3xnvzDrnp
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jun 2018 11:40:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57F8721E3D;
 Wed,  6 Jun 2018 21:40:29 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 06 Jun 2018 21:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=V43yFNLoB+TENG3sNgN/Hqgfic83t
 C4Pm5jDzyXu3Ss=; b=nbhlsfPFM4I5m9SuBdAyx6fpqW9VdNoN/rKK3/O8AlByb
 lR4JQ4Y3B4llrzSFBJQE572ePiyTKI9GGEhxhUGDklBC3Eqe1mmsbX0Z7cZOsnMt
 Zv43aRIce6WBBaTWXRFHbPG65+HJoQgnfRqyf3mflZBZ2DNmsPhgEbC2lpH/YGfY
 wLFuT6Wz/VTtRNeuyQk8I4Gg2rcjX7TvOzh2Bg1WLA8909I41JpYrrLBjcDUr0Yh
 a6C0m98v08cknyVz722LXraDKpFxXDVA89yxWqK6EIAjyWgFqiY02z6l/8ir4KWN
 b9q7gZjeKay17Sx+roXC9GCWZB0ciKqI6xc86ypxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=V43yFN
 LoB+TENG3sNgN/Hqgfic83tC4Pm5jDzyXu3Ss=; b=JgBbpqJ+lZ7dkiBGKPqe7v
 7F/spDW5SccrOCCguyvEofTqyBjE01EdHdjLfPPCwpz4+gzhs6z2KcrYTBYRHYj3
 mmPkigbfiKmbtRkEw28RPPCfr8PlGxkV2iAJJQWVcOM7RSRBbOJzxZYo81uiXgEo
 ozyCOCLVQEc/UwdipGUfSUsxWUqI4G636MWY8KoZxtJGGu/oEDfBuWNjgFWd2T0G
 IgVGE5eBwQ+l1tTHtHkjt2bi9go+ySFl1Q4u2tv6pNgXv6UCvLXLpUTjdMcfASLJ
 t6bnYuZLbnh1833n1B/sXCNDA1aA7Pw9XQhZtT+XOyQo8jSyqbCYbIf0aY7QAaXg
 ==
X-ME-Proxy: <xmx:DY0YW9wjW-akDYSFe_sW7xOZrBPAoHYPLjJOb7iFwyBGjbGDypbM8Q>
X-ME-Proxy: <xmx:DY0YW7mQHSruh8XwbUpYBA9JEyR8P-iF91TRGkFUZyz-1CdeD_mGdg>
X-ME-Proxy: <xmx:DY0YW9nWzi0HTVWZGAJRfLShaJs6JViS3jd-YzO3ngZuhHHcv-YLUA>
X-ME-Proxy: <xmx:DY0YWz0pdwT3WrfN0ZX1F-DYhSpYqZscNWRl2gkGvgpCovjfsiR2xw>
X-ME-Proxy: <xmx:DY0YW4HyyOHVR3Hs0qb6oFbOLkPnbFvAT9cXdLMy6h4fx5gYSukA5g>
X-ME-Proxy: <xmx:DY0YW9Xj6TY9qEWfC3jeS94aIJyLcOiSv8WKO7a8qs-b_fpYomvQZQ>
X-ME-Sender: <xms:DY0YW9A6-i5MVawDfZV-tzWggsWEwaJzOEgWM7YzzvvrrtTLavWM5g>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 1747CBA50D; Wed,  6 Jun 2018 21:40:29 -0400 (EDT)
Message-Id: <1528335629.1579388.1399184600.1F352630@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Henbin Chang <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fb4a77ea
References: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
 <1528252585.1372887.1397896680.27123F8A@webmail.messagingengine.com>
 <CAG9c7cD0NLPVeoBzX3hVO226=EwBM-vypz5FJkUrteCabG-kSQ@mail.gmail.com>
 <CACPK8Xc5Zdd9LM+Ao-3Ly4c3_WDz76K-S6Xq0fky5T8m3zFyBA@mail.gmail.com>
In-Reply-To: <CACPK8Xc5Zdd9LM+Ao-3Ly4c3_WDz76K-S6Xq0fky5T8m3zFyBA@mail.gmail.com>
Subject: Re: How to configure Clock Stop Control Register
Date: Thu, 07 Jun 2018 11:10:29 +0930
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
X-List-Received-Date: Thu, 07 Jun 2018 01:40:32 -0000

On Wed, 6 Jun 2018, at 18:31, Joel Stanley wrote:
> Hello Henbin,
> 
> tldr: you need to ensure mboxd has run so the aspeed-lpc-ctrl ioctl
> has been performed.
> 
> See below for my explanation.
> 
> On 6 June 2018 at 14:32, Henbin Chang <henbinchang@gmail.com> wrote:
> >> What kernel tree are you building/booting? Can you provide a link?
> >> Currently we've tied the LCLK to enabling LPC2AHB bridge:
> >>
> >> https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts/aspeed-g5.dtsi#L302
> >> You may need to add the following to your dts if you've developed your
> >> own:
> >> ```
> >> &lpc_ctrl {
> >>         status = "okay";
> >> };
> >
> > I use dev-4.13 branch (the last commit is
> > aca92be80c008bceeb6fb62fd1d450b5be5d0a4f).
> >
> > The aspeed-g5.dtsi I use is the same with the one in your link.
> >
> > I follow your suggestion and add the following to my dts but the SCU0C[8] is
> > still 1b'.
> >
> > &lpc_ctrl {
> >         status = "okay";
> > };
> >
> > Even I directly change the status of lpc_ctrl to 'okay'  in the
> > aspeed-g5.dtsi,  the SCU0C[8] is still 1b'.
> > lpc_ctrl: lpc-ctrl@0 {
> >      compatible = "aspeed,ast2500-lpc-ctrl";
> >      reg = <0x0 0x80>;
> >      clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> >      status = "okay";
> >  };
> 
> Doing these two are equivalent. But it never hurts to try when things
> aren't working :)
> 
> >
> > devmem 0x1e6e200c 32
> > 0xFFCDBF8B
> 
> If you take a look a the driver, you will see this snippet:
> 
> drivers/misc/aspeed-lpc-ctrl.c
> 
> static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
>                 unsigned long param)
> {
>                 /*
>                  * Enable LPC FHW cycles. This is required for the host to
>                  * access the regions specified.
>                  */
>                 return regmap_update_bits(lpc_ctrl->regmap, HICR5,
>                                 HICR5_ENFWH | HICR5_ENL2H,
>                                 HICR5_ENFWH | HICR5_ENL2H);
> 
> 
> The driver is designed to only enable the bridge (ENL2H) when the
> configuration registers have been programmed by an ioctl() from
> userspace.
> 
> This is to ensure the window is pointing at an area of memory that has
> been chosen by the system integrator, and not accidentally exposing
> some BMC RAM to the host. So the ioctl for programming the window will
> automatically enable the FWH and L2H bits (bits 10 and 8).
> 
> On OpenPower systems, the tool that performs the ioctl is 'mboxd'. If
> you are using an OpenPower system, where the host firmware talks the
> mbox protocol (hostboot and skiboot do this), then you should run
> mboxd.
> 
> If you're running on another platform, you could write a small utility
> to do this ioctl from userspace. I wrote one in Rust a few months ago,
> but you probably want to use C instead.

Thanks for catching this additional requirement Joel, I think I was asleep at the wheel at the time.

Andrew
