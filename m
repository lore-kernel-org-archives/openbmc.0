Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="biAB1exQ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41W69M5Fs8zF35L
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 05:07:51 +1000 (AEST)
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
 [209.85.223.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EFE420864
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1531940869;
 bh=y1tMQlwlBl2NKACtOQcj/0QE6EkhO4X8N4GANq0OXys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=biAB1exQsgvuf9JHnO7GBLEW4sO+a2eDWAqbZ2A0sChfAC/CFRobWkxY7Hy8fXkgf
 WBbto35e3snf8wNBZkIjvoWEBY/bOKwC7aiyD2a4jgCRnRjcoN6mT8vHp8b6jL0BHp
 Zn1Dgqq9cexP8SIWuUmBDFeM6hKZf7xTVzYdm8Hs=
Received: by mail-io0-f172.google.com with SMTP id v26-v6so5000441iog.5
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 12:07:49 -0700 (PDT)
X-Gm-Message-State: AOUpUlE2x3WPJk+lPA0NWMhxRnqA+WETrtiRHSgL4d+TshWlAf3niJBz
 oqInE7et8mlyx5DeQwN/aUr6emDkXBBAKRW34w==
X-Google-Smtp-Source: AA+uWPzEzZfHxX7vW+mkLp1vFNAcsWfuwihlKVeH8QhI1uMmSVeZYRegC/h7FgAvmbAZRawxGvUUHCNi3vfhzir2NVk=
X-Received: by 2002:a5e:c90e:: with SMTP id
 z14-v6mr6305101iol.268.1531940868777; 
 Wed, 18 Jul 2018 12:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <CAL_JsqLZo-=7UkuvvUFYdCR4asBBiWyC=Q1ryH=-HLU6vzf9tA@mail.gmail.com>
 <ece91112ecfdc7218184c4c4519e455cf9397e11.camel@kernel.crashing.org>
 <1531870098.3337969.1444201888.2476205D@webmail.messagingengine.com>
In-Reply-To: <1531870098.3337969.1444201888.2476205D@webmail.messagingengine.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jul 2018 13:07:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+YdcBe+VYBAZPvK-X9gwJyhzP4m6hAx59+2Nz0JzsKug@mail.gmail.com>
Message-ID: <CAL_Jsq+YdcBe+VYBAZPvK-X9gwJyhzP4m6hAx59+2Nz0JzsKug@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Eugene.Cho@dell.com, a.amelkin@yadro.com, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, stewart@linux.ibm.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 19:07:52 -0000

On Tue, Jul 17, 2018 at 5:28 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Tue, 17 Jul 2018, at 14:26, Benjamin Herrenschmidt wrote:
> > On Mon, 2018-07-16 at 07:55 -0600, Rob Herring wrote:
> > > If that data is one set per SoC, then i'm not that concerned having
> > > platform-specific data in the driver. That doesn't mean the driver is
> > > not "generic". It's still not clear to me in this thread, how much of
> > > this is board specific, but given that you've placed all the data in
> > > an SoC dtsi file it seems to be all per SoC.
> >
> > So Rob, I think that's precisely where the disconnect is.
> >
> > I think we all (well hopefully) agree that those few tunables don't fit
> > in any existing subystem and aren't likely to ever do (famous last
> > words...).
> >
> > Where we disagree is we want to make this parametrized via the DT, and
> > you want us to hard wire the list in some kind of SoC driver for a
> > given SoC family/version.
> >
> > The reason I think hard wiring the list in the driver is not a great
> > solution is that that list in itself is prone to variations, possibly
> > fairly often, between boards, vendors, versions of boards, etc...
> >
> > We can't know for sure every SoC tunable (out of the gazillions in
> > those chips) are going to be needed for a given system. We know which
> > ones we do use for ours, and that's a couple of handfuls, but it could
> > be that Dell need a slightly different set, and so might Yadro, or so
> > might our next board revision for that matter.
> >
> > Now, updating the device-tree in the board flash with whatever vendor
> > specific information is needed is a LOT easier than getting the kernel
> > driver constantly updated. The device-tree after all is there to
> > reflect among other things system specific ways in which the SoC is
> > wired and configured. This is rather close...
>
> Not sure this helps, but I feel that the proposal pretty closely matches =
what's described in Documentation/devicetree/bindings/mfd/mfd.txt. It's int=
ended that nodes using the bindings I'm proposing are children of a 'compat=
ible =3D "syscon", "simple-mfd"' node (this is the case with the features w=
e're hoping to describe for our SoC). I should explicitly call that out.

IMO, any binding that has only those compatibles is not correct and a
specific compatible is needed. We should be able identify a specific
h/w block.

> But to go on, "simple-mfd" is effectively an alias of "simple-bus", which=
 means its intended to match child node compatibles to drivers provided by =
the kernel. If we shouldn't be describing minor features of a SoC in the de=
vicetree, doesn't this invalidate the case for simple-mfd? What is the *cor=
rect* use of simple-mfd? When is it not used to expose minor features in se=
t of "miscellaneous system registers"? Why doesn't this proposed case fit?

I'm no fan of simple-mfd either. I think it is abused and often a sign
of bad binding design. The general problem with MFD bindings is people
define child nodes based on what drivers they happen to have for some
OS. DT is not the only way to instantiate drivers. Child nodes are
really only needed when you have resources per child that need to be
defined. For example, if the MFD has an interrupt controller and
interrupts to sub-blocks or sub-blocks have their own clocks.
"simple-mfd" was for when the parent node has no driver or the child
nodes have no dependency on the parent.

Rob
