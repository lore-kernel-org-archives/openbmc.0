Return-Path: <SRS0=QhAl=QC=linuxfoundation.org=gregkh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=qhal=qc=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="OWLBbMs3"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43mpwV2KFPzDqCp
 for <openbmc@lists.ozlabs.org>; Sat, 26 Jan 2019 19:29:45 +1100 (AEDT)
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90CB6218A6;
 Sat, 26 Jan 2019 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548491382;
 bh=GmsVfRiBcyAXMEvSxXK/0mVWz+dr6TuWSo7cIssEFKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OWLBbMs3fjgZ8oeEGpFT14LaOR1XF7jdBHpI3gxP+IzHtjpXXHrw6sNLm9is6cml9
 LGyJHXJVsQV3pDYEM9KUbppge5YNiLGMNhBs7/jtiLOQu1HuzOcO5RdnYPTz0MS/ed
 QysIWgSr7zJw6Wcv9NSzpKCrzwB674eJ9MtGlKq4=
Date: Sat, 26 Jan 2019 09:29:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Gavin Schenk <g.schenk@eckelmann.de>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
 Alan Cox <alan@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Julia Cartwright <juliac@eso.teric.us>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v10 03/12] peci: Add support for PECI bus driver core
Message-ID: <20190126082937.GB9005@kroah.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
 <20190122132047.GA12357@kroah.com>
 <0826ef5c-c919-cdd7-5e2a-fc056d41756e@linux.intel.com>
 <20190124065714.GA28194@kroah.com>
 <c583da6e-341d-80ee-04a9-8988203a65bb@linux.intel.com>
 <20190125071823.GC11891@kroah.com>
 <22d2e334-b792-1047-87fb-abce2ea87e2a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22d2e334-b792-1047-87fb-abce2ea87e2a@linux.intel.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-Mailman-Approved-At: Tue, 29 Jan 2019 14:11:08 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2019 08:29:47 -0000

On Fri, Jan 25, 2019 at 10:51:54AM -0800, Jae Hyun Yoo wrote:
> Hi Greg,
> 
> On 1/24/2019 11:18 PM, Greg Kroah-Hartman wrote:
> > On Thu, Jan 24, 2019 at 02:01:10PM -0800, Jae Hyun Yoo wrote:
> > > On 1/23/2019 10:57 PM, Greg Kroah-Hartman wrote:
> > > > On Wed, Jan 23, 2019 at 01:38:24PM -0800, Jae Hyun Yoo wrote:
> > > > > > What about the un-initialized fields in this structure?  Can you
> > > > > > properly handle that, and also, is this ok to be on the stack?
> > > > > 
> > > > > It's fully initialized at here because the peci_ping_msg struct has only
> > > > > one member:
> > > > > 
> > > > > struct peci_ping_msg {
> > > > > 	__u8 addr;
> > > > > };
> > > > 
> > > > Ok.  But my question about "can you do this off the stack" remains.
> > > 
> > > I'll add 3 bytes of dummy padding into this structure. Also, I'll check
> > > again u32 boundary alignment for all struct defines in peci_ioctl.h.
> > > Would it be okay to be on stack then?
> > 
> > The issue of being on the stack has nothing to do with alignment, and
> > everything to do with, "can your controller handle data from the stack".
> > Lots of busses and controllers can not (i.e. all USB devices), so you
> > have to properly allocate all memory that is used for data transfers
> > from areas that are able to do DMA properly (i.e. by using kmalloc).
> > 
> > That is why I asked here about that, if this is a USB driver, having the
> > data you wish to send from a stack variable is not allowed.  I don't
> > know how your hardware works, which is why I was asking this.
> > 
> > Note, some architectures (like x86), hide this fact as their stack
> > memory is able to be DMA, so you do not run into any errors.  Other
> > arches that Linux supports are not like that, which is why we have those
> > types of restrictions.
> 
> Thanks for your detailed explanation.
> 
> In this core driver, all PECI command messages will be translated into
> the raw PECI message structure (peci_xfer_msg) and it is the actual
> data which will be delivered to an adapter driver through
> adapter->xfer().
> 
> I'll fix the translation logic to use heap instead of stack for handling
> the peci_xfer_msg structure.

Great!  You might want to add the checks that we have in the USB core
for this type of thing to catch users who don't remember not to send
stack-data.  Look at usb_hcd_map_urb_for_dma() for specifics.

thanks,

greg k-h
