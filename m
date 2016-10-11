Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sttzC6dN3zDsrM
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 10:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Q1K2Eoia; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id e6so9242454pfk.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xtGBqbthNzl9u3mbF1ljH3SuMFsdRAAl/fOIfRFEATA=;
 b=Q1K2EoiaOOMIrtCFQLE34zXPRV0hdlZWbOouVuMcJPfiwlvUENf9H8gefvYIAsN2Wo
 IbPrgnfJBNV45enibcC7HcaNmV8Sk1L6adY3V1uwzm/sWush/6N8MN5SoTkzyYgTYYfn
 B6Svi5u9/uYI6+NQOLptucFzKKvVdL7NFGKNKBCaBK7Q6cXipwPZv0wu8NApNuSK1NLt
 Ky+Mg7cjczaJfMEZpZDbhz3geWJeTPJGy8vD8sw4d4qc62d//fokziUislz0GHNYecG0
 NerGbJUKFk3VAF0cN/uD6zKIzoPp0ieb56b0AByuIJDs53rpbMMomBUHmaPlqzTbX1T4
 wVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xtGBqbthNzl9u3mbF1ljH3SuMFsdRAAl/fOIfRFEATA=;
 b=CVTr0WYJTox7NlAm7zzV6IARZB29WOIlyEVAXKg5Pae7S5HVKAsKCuqZH+4PjTuCSB
 6TpdaMjrwGNth7Ub9DWcTcls73MRSaVOSL4qX0yU8zM7oFFu7DDHY6uqg3L2rymnkcJT
 hb7aC/8QlFkY9TTkHjjDPUvqAKb445FmKltjAY3q5boHsC4MgDMMDEhnHQp2gM7sOC2V
 kqxpSm1/zJLuKgGGS0SXOKj6gfv1hQ5/mOXzOYOh7tHHkCKITColJiOoX1ynadVkWvJH
 aeCM2VJ6Vl7tkg3kFcInDg37NcZL27mfGCKcN8c2gfruqOG7hNjj+TUiprp/IccWtvMa
 wIKw==
X-Gm-Message-State: AA6/9RlCIu4lDtPayWNyf2iJNyDmyGWGUVLkygaZBg+MtOH2nACo7eY96iJIetNqdBbGMQ==
X-Received: by 10.98.93.210 with SMTP id n79mr816498pfj.69.1476229828768;
 Tue, 11 Oct 2016 16:50:28 -0700 (PDT)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id r84sm6893520pfj.69.2016.10.11.16.50.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Oct 2016 16:50:28 -0700 (PDT)
Message-ID: <1476229824.719.0.camel@gmail.com>
Subject: Re: libflash questions mostly relating to P9 bringup
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 12 Oct 2016 10:50:24 +1100
In-Reply-To: <CACPK8Xcyv2XLfZ1uawt=jcGDvX9cHOOMB9N9pGv5vV9gQ9objw@mail.gmail.com>
References: <CAPH-5w5H-qYmjq+94U+jP=Wf57jdahO-jMZ1m=2gB9b8m8kAtA@mail.gmail.com>
 <CACPK8Xcyv2XLfZ1uawt=jcGDvX9cHOOMB9N9pGv5vV9gQ9objw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 
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
X-List-Received-Date: Tue, 11 Oct 2016 23:50:33 -0000

On Tue, 2016-10-11 at 17:55 +1100, Joel Stanley wrote:
> On Sat, Sep 24, 2016 at 11:41 AM, Xo Wang <xow@google.com> wrote:
> > 
> > Hi folks,
> > 
> > I'm under the impression for P9 bringup we're sticking with BMC-
> > side
> > MMIO to set up host PNOR access (as in what the host is booting
> > from
> > over LPC). I see—and agree—that we're not gonna have MTD working by
> > the time we need to boot early machines:
> > https://github.com/openbmc/openbmc/issues/553
> 
> We have mtd support written and in testing. I plan to land it this
> week.
> 
> I would like us to be able to disable /dev/mem access soon. pflash is
> one area where we almost have the bits in place, so I think we should
> push to go straight to the correct solution.
> 
> > 
> > 
> > What does libflash-based PNOR control look like? I mean the hacky
> > way
> > we're gonna use for the next month. This is how I *think* it works.
> > 
> > booting the host:
> > 1) the SMC SPI flash master auto-detects (?) how to read like the
> > FMC
> > 2) Swiss Army aspeed.c do_x_setup() enables LPC/AHB bridge to the
> > SPI
> > flash window
> > Is that it? Doesn't involve MTD or pflash at all and it just works?
> 
> Yes, I think so.
> 
> > 
> > 
> > updating PNOR from BMC:
> > 1) org.openbmc.control.Flash's update method calls op-flasher
> > 2) org.openbmc.control.Flasher invokes libflash erase and program
> > 3) libflash arch_flash_arm_io.h (?) and friends
> >   a. know how to talk to the flash controller (BMC_DIRECT)
> >   b. map AHB, GPIO, and SMC window from /dev/mem
> >   c. know the size of the host PNOR? (it looks hardcoded)
> 
> I suspect it uses the ffs header to determine the pnor size, but I do
> not know that code well.
> 

The ffs header has sizes but you could of course flash an ffs partition
smaller than the total flash and then the ffs size wouldn't be the
total size. If you mean the size of the flash, there are various
mechanisms, in this case (PNOR from BMC) libflash has a mapping between
flash chip ID and total size which it can report up to tools like
pflash.

Ideally this access method will go away in favour of the BMC kernel
exposing the flash through /dev/mtd

In the case where you would want to know this on the host then it
should be in the device-tree and subsequently exposed by the powernv
flash driver (https://github.com/open-power/linux/blob/master/drivers/m
td/devices/powernv_flash.c) though /proc/mtd

> > 
> > 
> > updating PNOR from host:
> > 1) whatever calls pflash on host
> > 2) host libflash powerpc_io.c and friends poke BMC registers over
> > LPC
> >   a. write whatever LPC stuff that turns on iLPC2AHB, then use that
> > to
> > set GPIO and SMC window to LPC for host access
> >   b. powerpc_io.c also overwrites the LPC/AHB bridge mapping
> > (previous
> > set by BMC kernel) with its own desired config
> 
> Hacky. Not really supported.

Firstly I should apologise, if we're talking about https://github.com/o
pen-power/skiboot/blob/master/external/pflash/powerpc_io.c, we
shouldn't. That code isn't used anymore and I doubt it will work. I'll
send patches to remove it!

Currently updating PNOR from the host, Joel is correct, it isn't really
supported by openbmc. Of course it can be done through /dev/mtd exposed
by host linux (https://github.com/open-power/linux/blob/master/drivers/
mtd/devices/powernv_flash.c) and backed by a driver in skiboot. I
really hope that all pflash binaries around today know how to do this.

> 
> > 
> > 
> > Can somebody review that I got all this right? I saw some
> > conflicting
> > information in https://github.com/openbmc/linux/issues/51
> > 
> > Other questions:
> > - what's the plan for "booting the host" and "updating PNOR from
> > BMC?"
> 
> We plan to expose the contents with an in-memory copy of the
> firmware.
> 
> > 
> > - is it worth extending the current libflash to read BMC & PNOR
> > size,
> > window, etc from device tree?
> > - what does arch_flash_powerpc.c do? It looks like a whole other
> > access method with a host-side MTD device.

Hopefully I've answered that...

> > 
> > thanks
> > xo
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
