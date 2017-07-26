Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHnTq5lDqzDqs7
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 06:56:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Nh9UZpe2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ciPo+SIv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AFC0B20865;
 Wed, 26 Jul 2017 16:56:45 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 16:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=37CtcEQmwxEpBln1/T3Ci6oiVdTuP
 qKTVjFzooTk5pc=; b=Nh9UZpe24kLyuMRnmZG1zjridNTu0Uyv4wpRRHgXq1nmm
 6B8rMLyKnBzUokfAcwo/cK45ja/9ZWAF52T+ROKxToAnA1bR/26L8pJszV+iyUWh
 EzN+k2eoQ6Byj+u8srK45PvkgWya9Asx52L0NV2lqd6y8Iq2P8AyFHL1b1a4QODE
 IT9Yb7s2tvKgtcMwKYCaMIu+cISgKifnhjsH/2nxZcvME1/jijcNP4xYHaB15M/G
 FlpHV7jboHezrs1oAOEzV8Koka4Kob8Oe74VBCsupbgQrdJIjku2jAP0ke1325gp
 swDWOfANEYVODN5+LyIqkpXi6zQap3INmUxpIiF+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=37CtcE
 QmwxEpBln1/T3Ci6oiVdTuPqKTVjFzooTk5pc=; b=ciPo+SIvNMzIVt6Xr33Ixo
 0w5vBvtficWwcFWozu2Zum3Kx4ByG2RTqQeP7gmt85X+bIB09HvYGw7d1EMNXe+R
 4HIp+lt967a2JfYQkCy7/Db+VQTaD0H69XlIInW2kKyCZppzrU7FKLUSE+5q/vxf
 4Eh09z1uvrzfRnJmIky12lrmNipqCFw2P+TaJXs2V+ZPDbjzSP3lh9l319tqfy5K
 0l4l3j3CZQ87v6wifOoQmzLkdaMD2daqz+ALpjUm+H98+Htc4pbwGlxi/ulj7EtH
 IJ06Wcddw8GfnGWY0pwIe5vDae4TH9ayJTm17H9c5GzEJZa+jt26dBQHWJrVzdIg
 ==
X-ME-Sender: <xms:DQJ5WTyrGhH2cGiRITCdBlCttokzXCFPgN-EJUXSvAoOiW2nz0v4Cg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 92D8894766; Wed, 26 Jul 2017 16:56:45 -0400 (EDT)
Message-Id: <1501102605.2313408.1053700536.59510195@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, joel@jms.id.au
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-c8af44bc
Subject: Re: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: Witherspoon WDT1
 external signal is push-pull
In-Reply-To: <6b056c44-6fc8-95ff-48c9-62911ff4fbd2@linux.vnet.ibm.com>
Date: Thu, 27 Jul 2017 06:26:45 +0930
References: <20170726160831.17867-1-andrew@aj.id.au>
 <20170726160831.17867-5-andrew@aj.id.au>
 <6b056c44-6fc8-95ff-48c9-62911ff4fbd2@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 26 Jul 2017 20:56:48 -0000



On Thu, Jul 27, 2017, at 03:24, Matt Spinler wrote:
> 
> 
> On 7/26/2017 11:08 AM, Andrew Jeffery wrote:
> > Correctly drive the latch asserting the FAULT pin on the MAX31785 when
> > the watchdog bites. This ensures the fan outputs are ramped to 100% PWM
> > duty.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index c28222c17d03..df36b87ba105 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -488,6 +488,7 @@
> >   &wdt1 {
> >   	aspeed,reset-type = "none";
> >   	aspeed,external-signal;
> > +	aspeed,ext-push-pull;
> 
> We need active-high for sure.  It still works without push-pull, but not 
> sure if that is totally electronically ideal or not as the HW designer 
> requested for this to be push-pull.

Right; given Jordan's statement, the wording of the documentation and
your testing the behaviour doesn't entirely make sense to me.

I might try to get it clarified with Aspeed.

Andrew

> 
> >
> >   	pinctrl-names = "default";
> >   	pinctrl-0 = <&pinctrl_wdtrst1_default>;
> 
