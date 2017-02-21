Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS7vL2YrDzDqGc
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:13:50 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v1L5DePa016672;
 Mon, 20 Feb 2017 23:13:41 -0600
Message-ID: <1487654020.23576.190.camel@kernel.crashing.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 Jeremy Kerr <jk@ozlabs.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 21 Feb 2017 16:13:40 +1100
In-Reply-To: <CACPK8XdiK4p_YkQJdroQjDtAgf89uO0dOtnMF8N2g8OspEFacw@mail.gmail.com>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
 <20170216140524.GA5077@heinlein.lan> <1487299721.16373.2.camel@gmail.com>
 <20170221041653.GA21380@heinlein.lan>
 <CACPK8XdiK4p_YkQJdroQjDtAgf89uO0dOtnMF8N2g8OspEFacw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 21 Feb 2017 05:13:51 -0000

On Tue, 2017-02-21 at 15:15 +1030, Joel Stanley wrote:
> > > The reservation of 64MB is because the hardware is capable of using
> > > 64MB, therefore the host can use that region of memory. We're playing
> > > it safe here by ensuring the BMC doesn't use any of it to avoid any
> > > possibility of the host corrupting BMC memory. This is the most generic
> > > dts for the platform so we've gone with stability over performance.
> > 
> > Is there anything the BMC can do to restrict how big of a memory map the
> > host side of the VGA can open up?  If there isn't we're going to have to
> > allocate this much on all systems because we can't trust the host to
> > "behave".
> 
> Ben and Jeremy have been enhancing the host driver to be smarter. Ben,
> what's the state of play?

That's actually an interesting one ... there is a different mem region
for host VGA and BMC graphics ...

The size it can use as FB (and exposes through PCI) can be selected via
a strapping of the chip.

Ideally, when we have a DT aware uBoot, we could have it adjust that
property based on the value of the strap. I think we can also change it
though, thus we could probably make the SCU code in Linux adjust the
value based on the DT and thus have platform specific DTs reducing the
amount of VRAM exposed to the host.

Cheers,
Ben.
