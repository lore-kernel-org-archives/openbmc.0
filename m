Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 16DB21A00A5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 13:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=RsKN2SW/; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 60E0E6E06C;
 Sun, 28 Feb 2016 18:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=lffaHgnSaKNj1RZJ+Lk2o
 ZcHJR8=; b=RsKN2SW/UZKS5I8RGknx1y8TceHJ3FgzddcSww8Shlzgvw4HZrHbz
 +EIFZ1XrvYI9txUTjn0nr+UeTJ6b67IBhRON44E7HpA2kAW/9HTzCePP4rkL8niI
 BJh/uRZTPVdtH3Lk7lCocWelgvc2Se4ywBoZAZg5kqyPbAXLToZ/xk=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id F3FD26E06A;
 Sun, 28 Feb 2016 18:10:16 -0800 (PST)
Message-ID: <1456711808.32556.6.camel@aj.id.au>
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/timer: Add ASPEED AST2400 timer
 device model
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org,
 qemu-arm <qemu-arm@nongnu.org>
Date: Mon, 29 Feb 2016 12:40:08 +1030
In-Reply-To: <CAFEAcA8vH6vOMi88DLOxe8Z8XC+dECytsVth2zsToBd_9MH3SQ@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-2-git-send-email-andrew@aj.id.au>
 <CAFEAcA9MJtKbNR+XvqgU_c6SJc0QWg7VGMknWmrr3qiDL6aeng@mail.gmail.com>
 <1456456460.27420.147.camel@aj.id.au>
 <CAFEAcA8vH6vOMi88DLOxe8Z8XC+dECytsVth2zsToBd_9MH3SQ@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NDkJXN32mqSTuDUxU4G9"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 02:10:22 -0000


--=-NDkJXN32mqSTuDUxU4G9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-02-26 at 10:20 +0000, Peter Maydell wrote:
> On 26 February 2016 at 03:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Hi Peter,
> >=20
> > On Thu, 2016-02-25 at 16:11 +0000, Peter Maydell wrote:
> > >=20
> > > On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >=20
> > > > Implement basic AST2400 timer functionality: Timers can be configur=
ed,
> > > > enabled, reset and disabled.
> > > >=20
> > > > A number of hardware features are not implemented:
> > > >=20
> > > > * Timer Overflow interrupts
> > > > * Clock value matching
> > > > * Pulse generation
> > > >=20
> > > > The implementation is enough to boot the Linux kernel configured wi=
th
> > > > aspeed_defconfig.
> > > Thanks; this mostly looks in reasonable shape; I have some comments b=
elow.
> > >=20
> > > Do we have a datasheet for this chip ?
> > Unfortunately I don't know of a publicly available datasheet. What's
> > the best way to proceed in this case?
> We have devices in the tree that are either based on non-public datasheet=
s
> or occasionally reverse engineered from Linux kernel drivers. That's OK,
> but it's nice to be clear in a comment at the top what the source is,
> so people maintaining it later know how much to trust the current code
> and (if possible) where to look for clarification.

No worries, I'll add notes in the header comments for each of the new
files.

>=20
> >=20
> > >=20
> > > All source files need to #include "qemu/osdep.h" as their first
> > > include. That then means you don't need to include assert.h or
> > > stdio.h yourself.
> > >=20
> > > What do we need from qemu/main-loop.h?
> > I'm using it for qemu_bh_new() which is required by ptimer, who registe=
rs
> > the aspeed_timer_tick() callback into the main loop timer handling.
> OK, no problem.
>=20
> >=20
> > >=20
> > > >=20
> > > > +static void aspeed_timer_irq_update(AspeedTimer *t)
> > > > +{
> > > > +    qemu_set_irq(t->irq, t->enabled);
> > > Surely the timer doesn't assert its IRQ line all
> > > the time it's enabled? This doesn't look like the right condition.
> > So I think this is correct despite how it looks. There's some cruft
> > from modelling the implementation off of another timer that's probably
> > obscuring things, which should be fixed. aspeed_timer_irq_update()
> > is only called from aspeed_timer_tick(), so I'll just merge the two.
> > Then by renaming aspeed_timer_tick() to aspeed_timer_expire() as
> > mentioned above, this won't look so strange? I've read through the
> > timer handling code (the processing loop in timerlist_run_timers())
> > and my understanding is it has the behaviour we want - callback on
> > expiry, not on ticks - which is not how it reads as above.
> Usually functions in QEMU called thingy_irq_update() are the ones
> that do "look at current state of device and assert IRQ as
> necessary"; often this is "mask irq raw state against some
> irq-masking bit". Merging this into the timer expire function will
> probably help. (Is there no register bit that the guest can query
> that indicates "timer expired" or "raw interrupt state" ?)

It doesn't appear so - overflow interrupts can be enabled or disabled,
but it doesn't appear that there's a way to poll whether the timer has
expired. It doesn't look like it can be inferred either as the counter
status register doesn't stick at zero, rather resets back to the reload
register value (and my interpretation is it continues to count down if
the enabled bit remains set). Further, the interrupt on overflow bit
doesn't appear to be set by the kernel driver, but the two match
registers are initialised to zero which ensures an interrupt will be
fired. Non-zero match registers aren't currently supported by the
device model. I'll try to make this all clearer in the code.

>=20
> >=20
> > >=20
> > > You should implement a VMState struct for device migration,
> > > and wire it up here via dc->vmsd.
> > I'll look into it. I started experimenting with a VMState struct
> > early on in the implementation but threw it away as it wasn't my
> > primary focus at the time.
> We insist on vmstate structs for all new devices, because
> they're fairly easy to implement, and if the original
> submitter doesn't implement one then the device becomes
> a landmine for any user trying migration or vmstate snapshots,
> because it will silently misbehave.

Yeah, no worries, v3 of the series will have VMState structs for all
devices.

Cheers,

Andrew

>=20
> thanks
> -- PMM

--=-NDkJXN32mqSTuDUxU4G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW06iAAAoJEJ0dnzgO5LT5JZYP/252mAz3ecxmsBU7z3rC+xXi
r6+KGuTqTrwPNA3HaEINFPnbj8vCTPzTt3lCG8KRU3HfYCLo8RHMHz6orevTQyj0
N2e1H5tivu61FW3Z6REKowDapXw3LeQXh47mYZngO+Y3aucpJyTI8Yod6NuFLypq
5jZ5Ho9M1Ypon3DFHE9NNEZMhfalV0T2J2puXrWocw4ZeF2xb6SbWaYgVF/+0CIV
fZQ9cNPCJ89u09O8r7wO25ZqXsyWU1uUgO6O5EtWi8Gwk7h1CP1RwZIUQlPkkZp0
B3FrLK/o5kC/6StsS/8NtAA1x3goX/Sp7nCU0iYwISIWN+bdvRp355ysCIrt5wU2
tHoxfJ2MgCeOuZ/N+gQ8pmdYsCuiHTFQGYFnpfGuslf8NYvO8yN6wg/AJHiDVMZr
ctgLkD3gDlWBilUbV1qlF/aX6U78DDTLCD2rBbPOM1Fkev5xQ/pXbWxXRBTi0HyN
AwjKrUQplH37y4uvQPefkgsa0oIjYR70VnXuvUquH9QI4vrqrACRYeEgYS7g6qs3
FEIjol6kI0yvWMPznAp1WZX+93RcXJMMU5uohQYY1GTTXmWQQyn5D6c6TMmrmnao
Vrz1IEU8+sf4TMlyXxxrqsRODIppnHraHxvObk1TgvtoG62UjmdxFkovX4FobIbF
I9AAGPwGIbGSXQrgmwo2
=mjus
-----END PGP SIGNATURE-----

--=-NDkJXN32mqSTuDUxU4G9--
