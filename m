Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wFSMH5Ww4zDqBJ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 20:57:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OZG9GMul"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PU7koyQa"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 91686208A0;
 Sat, 29 Apr 2017 06:57:42 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sat, 29 Apr 2017 06:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=3Btz4lxAQ+68c2XG1+gzZcF0nQxlw
 TZ3snBkKmzxfOU=; b=OZG9GMulk1YBU/t9wmehWF+Jod18FUvVLBcDPkVh/PEdU
 f+xdP3Fv+nr2boMGU1RZEbtFPbOSbz+NfWh+gsUFKPPyaDxhwwuWR0R5CK4hekvk
 mzkN/FlIiFPIRZC2Mc06HLLyT2Hh3ecK0miPMhL8IhL5BdylIkugvrVKi04XM1D5
 IuFMiBNBtpqbBafqQIJRxJ5qVegcqnT764hi9AJdy8kL9fwkLLCTp3dX8jSxyHys
 2hnezN4zIt6m8/VenLt7HhM57KFEUUuqlrfKKmgxiGcUXmLP897HOG3SpTqknzR1
 w0rkUa7ej9QN1DEiEzrDaJShXaadsjrqpt7eMVI5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3Btz4l
 xAQ+68c2XG1+gzZcF0nQxlwTZ3snBkKmzxfOU=; b=PU7koyQaUOJpQ6DhQe6Ak5
 twfDzRf1MHJy6z41aG8k/B8AIdht7zz04XXzR45bQ5W3bOLlfK7I6smEW8MeluT4
 s44yGhBSRfcA8TLQrKBA+qwxUWqvOxVWRACHfvVXgsFcy4aXG2BbKKS/XukYsjo6
 6y2az4yHoBuHoBt8ehkOD8hy6E1wVl0EavbBLmpCJIuupFbH4CyPdZBvKjMhW4wy
 u8onC6TOMdcLSRrTWcLDM6zG270yiyTEpcW9PcdRK8zu09AGlDC/7aX6aDrX8iOv
 WhGwQVglrVHI7uM7MxfbSx2/P5Qvp61PLniwk8BJWjmZxUEDAJixxlyPdSQKyr6Q
 ==
X-ME-Sender: <xms:pnEEWUOd3sbvaiZ9TK1Z9r5UyTgEXTn31z7CJXAPRmAb1vphrdtWvQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 5E54EBAB6F; Sat, 29 Apr 2017 06:57:42 -0400 (EDT)
Message-Id: <1493463462.232472.960218944.25DF2EF7@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mine <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-88a795dc
In-Reply-To: <CAPH-5w5Ykq=7WFukmtrp7_Z+ZzAbYMU1bQZhJ26K9BqJWA1zTA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 11/11] aspeed: zaius: Disable GPIO bias
 via devicetree pinconf requests
Date: Sat, 29 Apr 2017 20:27:42 +0930
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-12-andrew@aj.id.au>
 <CAPH-5w5Ykq=7WFukmtrp7_Z+ZzAbYMU1bQZhJ26K9BqJWA1zTA@mail.gmail.com>
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
X-List-Received-Date: Sat, 29 Apr 2017 10:57:52 -0000



On Sat, Apr 29, 2017, at 06:03, Xo Wang wrote:
> On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 16 ++++++++++++----
> >  arch/arm/mach-aspeed/aspeed.c              |  4 ----
> >  2 files changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > index acf7cc8d0e6d..b5c4c0fb2986 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > @@ -333,7 +333,19 @@
> >          */
> >  };
> >
> > +&pinctrl {
> > +       aspeed,external-nodes = <&gfx &lhc>;
> > +
> > +       pinctrl_gpioh_unbiased: gpioi_unbiased {
> > +               pins = "A8", "C7", "B7", "A7", "D7", "B6", "A6", "E7";
> 
> Out of curiosity, do you need to specify all eight pins affected by
> the "unbiased" register bit, or only the ones that you need for some
> functionality? In this case, only the first four pins are required for
> the 1-wire interfaces, but the whole port's pull-downs are controlled
> by one bit.

Yeah it's somewhat arbitrary. Any of these options will work. A downside
to specifying multiple pins is redundant writes (though they happen
once, at boot). The downside of specifying one pin is a broken
abstraction. Maybe your suggestion is best, that we only specify the
pins Zaius needs to configure, even if the result is all of bank H has
the bias disabled. Should I send a v3?

Andrew
