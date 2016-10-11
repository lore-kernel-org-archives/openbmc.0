Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x22d.google.com (mail-pa0-x22d.google.com
 [IPv6:2607:f8b0:400e:c03::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stTZ60htNzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 18:45:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZJmcazYv; 
 dkim-atps=neutral
Received: by mail-pa0-x22d.google.com with SMTP id vu5so10806172pab.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sxCXSBu1WtkqbHJ+FO8m7Fpw452lx/smIHbzQ96tE8w=;
 b=ZJmcazYv8C8YSlOHfw9VvcyH3BPzrL5gPefRrh39irADpUL5t042q5qzknlQDfNwgr
 Rzl1TC/b2/gEjLgYHtoYW3Y9LrCds1j6Ub8J99rfjlcLfwptnVJG+tVZOBkuZZGvSubE
 xc/ezhCOlGNhJ9M8yJQHbipG5voUBgNvRzM3SOcZ/zDkh0AnF7sGRiziR3++fNZXOLh7
 umKw78/eFeyMnu4ev8QeQ9EIbe2Go2wU7klqc5ooSHtxhgYG7ZiXR2WyxJk+5afYP4TV
 /N5nr88G+tl9EaPYEDplCWauplyBAmXN7NyobslpleW7VMIryGR31SzV7Y89Ounc7iXQ
 w4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sxCXSBu1WtkqbHJ+FO8m7Fpw452lx/smIHbzQ96tE8w=;
 b=mm58koZmB6zmIxPEEHYw8VN8cA48t+PJWjS7PLs75EtPgPpEMXP2uJ1W8cqUa58qAs
 s6pZt/r9Y3moklezb0KN8P+hr8R3YyjKJEPOd+I6vDghexKDga9LKSptd8/W4v4JkMYd
 xq1F8DnYdY09BVheWRJYHaJwgvZnJGnUtvWnIQkVgYd7DDaD1s9GzOfpwFzLFrPN3XYL
 FqWyyQd4U47b1HmxKM2DJ16Zu2PECzznTrfBdfMK3a6buXx55Fr2ueCCvdR6G3N6/1hx
 BvhJGCbx3f0t/xZq1bWwm/vOfO/0m5xfqyrZuGwyTl3VhxLrb9lw8uC5IOQpSsS+yQh2
 2Qaw==
X-Gm-Message-State: AA6/9RkLhH//U5BGAoKVIg+hhStXPdpbe7+NNihqMj25yhka+Hi874G5Tg1Yk3SR12oDiA==
X-Received: by 10.66.178.78 with SMTP id cw14mr4690796pac.206.1476171948313;
 Tue, 11 Oct 2016 00:45:48 -0700 (PDT)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id vo3sm2536654pab.26.2016.10.11.00.45.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Oct 2016 00:45:47 -0700 (PDT)
Message-ID: <1476171942.720.16.camel@gmail.com>
Subject: Re: libflash questions mostly relating to P9 bringup
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 11 Oct 2016 18:45:42 +1100
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
X-List-Received-Date: Tue, 11 Oct 2016 07:45:50 -0000

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

I should apologise, if we're talking about https://github.com/open-powe
r/skiboot/blob/master/external/pflash/powerpc_io.c, we shouldn't. That
code isn't used anymore and I doubt it will work. I'll send patches to
remove it!

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
