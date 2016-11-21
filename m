Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tN0xV432CzDvsD
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 07:46:06 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id uALKjr62021256;
 Mon, 21 Nov 2016 14:45:55 -0600
Message-ID: <1479761153.10230.49.camel@kernel.crashing.org>
Subject: Re: Restricting HOST flash access on OpenBMC
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Rick Altherr <raltherr@google.com>, Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>, Abhishek Pandit
 <abhishekpandit@google.com>
Date: Tue, 22 Nov 2016 07:45:53 +1100
In-Reply-To: <CAPLgG=nDDGpCMbP3NDDZxmFLMJV53Lc=gfoKpeUz5cFU80=oxA@mail.gmail.com>
References: <1479703856.680.2.camel@gmail.com>
 <CAPLgG=nDDGpCMbP3NDDZxmFLMJV53Lc=gfoKpeUz5cFU80=oxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 21 Nov 2016 20:46:07 -0000

On Mon, 2016-11-21 at 09:47 -0800, Rick Altherr wrote:
> How does this work on non-LPC platforms?

A different mechanism such as IPMI can still be used on these.

This is basically a replacement for the code we have today which
uses a backdoor into the BMC address space to directly manipulate
the flash controller from the host.

That current mechanism is tricky, causes us to have at least 4 copies
of the whole flash controller driver, and relies on a backdoor that
we would like to close.

In the grand scheme of things, you can see this as an "accelerated"
path to the flash for platforms that have an AST BMC on LPC, but you
can still fallback to something like IPMI if that path isn't
available.

Cheers,
Ben.

> On Sun, Nov 20, 2016 at 8:50 PM, Cyril Bur <cyrilbur@gmail.com>
> wrote:
> > Hello,
> > 
> > Apologies, I have been working on this in a bit of a silo and I
> > suspect
> > a lot of people will be interested to know this work is going on.
> > 
> > The aim of my work is to provide a simple interface for the host
> > and
> > the BMC to talk in order for the BMC to give controlled access to
> > the
> > flash.
> > 
> > At the moment, the BMC maps the host LPC bus to point to the PNOR
> > directly. This may be undesirable and presents security concerns.
> > If
> > the host can be taught to request access to the flash then the BMC
> > could map the LPC bus into a region of its RAM and (depending on
> > policy) writes wouldn't get propagated to the actual flash. Policy
> > details are for later.
> > 
> > I developed a simple protocol to allow this exchange of information
> > documented in the README.md file of the userspace test daemon I
> > wrote
> > to proof of concept this: https://github.com/cyrilbur-ibm/mboxbridg
> > e/tr
> > ee/newio I will no doubt move this somewhere more suitable in due
> > course.
> > 
> > I chose to use the MBOX registers on the BMC as they provide a fast
> > method of data transfer and can raise interrupts on both the host
> > and
> > BMC.
> > 
> > The aim of sharing this now is to show that the interface works and
> > that implementation independent things can start to be integrated
> > into
> > skiboot and linux. Having said that, I would appreciate any
> > feedback, I
> > have had my head in this for quite some time please let me know if
> > I've
> > missed something.
> > 
> > The implementation is only a proof of concept, some details still
> > need
> > to be worked out, especially what happens on BMC reboot. I believe
> > the
> > interface is ok in that respect, just my implementation which is
> > lacking.
> > 
> > Do try it out if you want. Of course changes need to be made to the
> > BMC
> > kernel as well as skiboot:
> > https://github.com/cyrilbur-ibm/linux/tree/newio
> > https://github.com/cyrilbur-ibm/skiboot/tree/newio
> > 
> > Thanks,
> > 
> > Cyril
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> > 
> 
