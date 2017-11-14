Return-Path: <linux+openbmc=lists.ozlabs.org@armlinux.org.uk>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:3201:214:fdff:fe10:1be6;
 helo=pandora.armlinux.org.uk;
 envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="NAyiwiPA"; dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yblQn5t19zDr17
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 22:19:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2014; 
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=yBPz9xn2lzfXR2cO+4Y7uPMYnm4i/68BkLsYK11DmeM=; 
 b=NAyiwiPACQeCUrPqnYT3YDhuep298tgLrJ61Wgi1vJlsiwigP/NZne992mfuyJNJ3FFOiDzPD2a8qNQB/jlWb61GPJWNoSPl87BlNcySbMP16k5/aLG2WlCB45apmH3rVdcpJdPR2yTUlKf4dROQBtkthAJkLtygp55WXuIV+9A=;
Received: from n2100.armlinux.org.uk
 ([fd8f:7570:feb6:1:214:fdff:fe10:4f86]:52161)
 by pandora.armlinux.org.uk with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <linux@armlinux.org.uk>)
 id 1eEZFS-0002LF-F1; Tue, 14 Nov 2017 11:19:22 +0000
Received: from linux by n2100.armlinux.org.uk with local (Exim 4.76)
 (envelope-from <linux@n2100.armlinux.org.uk>)
 id 1eEZFN-0007px-JV; Tue, 14 Nov 2017 11:19:17 +0000
Date: Tue, 14 Nov 2017 11:19:16 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 'Chip Bilbrey' <chip@bilbrey.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, 
 "mec@shout.net" <mec@shout.net>, Jiri Pirko <jiri@mellanox.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [v11,1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20171114111916.GO12318@n2100.armlinux.org.uk>
References: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
 <8760aoz78q.fsf@bilbrey.org>
 <DB6PR0501MB219753AC43515148F39CC2D0B1280@DB6PR0501MB2197.eurprd05.prod.outlook.com>
 <20171114111046.GA23820@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171114111046.GA23820@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 11:19:47 -0000

On Tue, Nov 14, 2017 at 12:10:46PM +0100, gregkh@linuxfoundation.org wrote:
> On Tue, Nov 14, 2017 at 10:34:49AM +0000, Oleksandr Shamray wrote:
> > Greg, what you can suggest about it. May be better to add again single-open()-per-device lock with right locking way like:
> > 
> > >if (mutex_lock_interruptible(&jtag->open_lock)) {
> 
> You would stall an open?  Why not just return saying you can't do that?

Greg, I think you need to look at the code again.

From the snippet in the email, this lock is not held while the device is
open, as you apparently think it is.  It's a short-term lock that is
held to ensure atomic access to the jtag->opened member, so that two
concurrent opens are unable to operate lock-step, resulting in
jtag->opened becoming 2.

The open function snippet in the email drops the lock as soon as it has
incremented jtag->opened, or encounters an error.

It seems entirely sensible, rather than using an atomic_t counter, as
it means that other openers are held off until the current opener has
either succeeded in opening the device or failed to open it.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
