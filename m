Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wF7Mq4wP5zDqC2
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 08:12:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Rbo6nDwt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iOPTXALg"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 325AF20BFD;
 Fri, 28 Apr 2017 18:12:05 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Fri, 28 Apr 2017 18:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=7pFzZ6K6jsR6gvelW7p09u5Sj2WGg
 yAUBhAjW3FsYPI=; b=Rbo6nDwtANEg75uljSye4X92g6o4mk1oBadE/SXeVg1DZ
 RBC2k7rhvy2CpGUgsqsxER87Zdq0rBMvPkvxN2TUKict2sR6uU/HaUau5qtAXPep
 ksiEKfiRjTRhwO0xPMOKqPZ9bwWKlfqDVNW80LpyoeuqQT2ZJblXeKTK2YUzJZxg
 Ef98mQK4xJ3ITCzy8oEwV2uT5L/aN8SEwR+6rhjf4bxnjZOH6rqPm1l5EMSh1RU/
 RfRSK61F3JE/Y7uDlUpJARCT4LwyTWxwzxUGdfcJYgPstnCvaKwG5s2dx3a+GbKY
 ln72CsYs1BR71HwY3Ec2um2td7fWhnI3+eyAzWY4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7pFzZ6
 K6jsR6gvelW7p09u5Sj2WGgyAUBhAjW3FsYPI=; b=iOPTXALgngWDGSsh69xCeW
 mm+h1qcqItDRM3LHIDxmGHU8f2D3J5e4PYfJKGjy28oP/8B7PNlrx9S380qEv7K8
 AFt1TPWaj1B7mubW7BuqfA8poW13VLEyTbbg2B2gnw1ipPvkIIw58rHEYToYW02h
 HHu00oT9R1NQtM/GhbnnTHGkEU+w1WuYn4Yui+akDX71oXvU8u2WhP7xiIvh1b3u
 u7hBJPcfCGHwf6nFvaEl/1oqsELWvWaWchkbN5lF1ffQhfPSf2cgzjP23bJgYNu+
 Gel9nl9iOn0mYGtTrl0Xmr1og9G/s5hqA+EUjuOOThCFSH8RFOxt9jmGalLhPTbQ
 ==
X-ME-Sender: <xms:Nb4DWZgAhx38ny2XPPNPTqHvyiZLVeHMb1wnsXahmucomC04yky4VQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EFED4BAB6F; Fri, 28 Apr 2017 18:12:04 -0400 (EDT)
Message-Id: <1493417524.77601.959872576.42A9BAE9@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mine <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-88a795dc
Subject: Re: [PATCH linux dev-4.10 v2 03/11] aspeed: dt: Add clocks property to
 GPIO node
In-Reply-To: <CAPH-5w4UOPOLhwduFByg0JcFJyKYoY04TRd5dMACdpg7OFy5fQ@mail.gmail.com>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-4-andrew@aj.id.au>
 <CAPH-5w4UOPOLhwduFByg0JcFJyKYoY04TRd5dMACdpg7OFy5fQ@mail.gmail.com>
Date: Sat, 29 Apr 2017 07:42:04 +0930
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
X-List-Received-Date: Fri, 28 Apr 2017 22:12:09 -0000



On Sat, Apr 29, 2017, at 06:00, Xo Wang wrote:
> On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > This enables debouncing of GPIOs as requested by drivers.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> > index 9c844fa240e0..d8827d522dfe 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -143,6 +143,7 @@
> >                                 interrupts = <20>;
> >                                 interrupt-controller;
> >                                 gpio-ranges = <&pinctrl 0 0 220>;
> > +                               clocks = <&clk_hpll>;
> >                         };
> >
> >                         timer: timer@1e782000 {
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> > index 613b899b07bd..992242d3b22e 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -263,6 +263,7 @@
> >                                 interrupts = <20>;
> >                                 interrupt-controller;
> >                                 gpio-ranges = <&pinctrl 0 0 232>;
> > +                               clocks = <&clk_hpll>;
> >                         };
> >
> >                         timer: timer@1e782000 {
> > --
> > 2.9.3
> >
> 
> +OpenBMC list

Thanks, that was a clear accident on my part :)

> 
> Does this fix any particular bug?

No, no bug,  it's a new optional property for the controller so the
driver can derive debounce values, which are specified to the hardware
in hpll clock cycles.

> 
> Reviewed-by: Xo Wang <xow@google.com>

Cheers,

Andrew
