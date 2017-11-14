Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yblDM1qJYzDqpF
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 22:10:43 +1100 (AEDT)
Received: from localhost (LFbn-1-12253-150.w90-92.abo.wanadoo.fr
 [90.92.67.150])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 9EDA3BD8;
 Tue, 14 Nov 2017 11:10:40 +0000 (UTC)
Date: Tue, 14 Nov 2017 12:10:46 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: 'Chip Bilbrey' <chip@bilbrey.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "jiri@resnulli.us" <jiri@resnulli.us>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "mec@shout.net" <mec@shout.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [v11,1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20171114111046.GA23820@kroah.com>
References: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
 <8760aoz78q.fsf@bilbrey.org>
 <DB6PR0501MB219753AC43515148F39CC2D0B1280@DB6PR0501MB2197.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB219753AC43515148F39CC2D0B1280@DB6PR0501MB2197.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Tue, 14 Nov 2017 11:10:43 -0000

On Tue, Nov 14, 2017 at 10:34:49AM +0000, Oleksandr Shamray wrote:
> > -----Original Message-----
> > From: Chip Bilbrey [mailto:chip@bilbrey.org]
> > Sent: Monday, November 6, 2017 12:33 AM
> > To: Oleksandr Shamray <oleksandrs@mellanox.com>
> > Cc: gregkh@linuxfoundation.org; arnd@arndb.de; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; joel@jms.id.au;
> > jiri@resnulli.us; tklauser@distanz.ch; linux-serial@vger.kernel.org;
> > mec@shout.net; Vadim Pasternak <vadimp@mellanox.com>; system-sw-low-
> > level <system-sw-low-level@mellanox.com>; robh+dt@kernel.org; openocd-
> > devel-owner@lists.sourceforge.net; linux-api@vger.kernel.org;
> > davem@davemloft.net; mchehab@kernel.org; Jiri Pirko <jiri@mellanox.com>
> > Subject: Re: [v11,1/4] drivers: jtag: Add JTAG core driver
> > 
> > 
> > Oleksandr Shamray writes:
> 
> [..]
> 
> > I notice the single-open()-per-device lock was dropped by request in an earlier
> > revision of your patches, but multiple processes trying to drive a single JTAG
> > master could wreak serious havoc if transactions get interleaved. Would
> > something like an added JTAG_LOCKCHAIN/UNLOCKCHAIN
> > ioctl() for exclusive client access be reasonable to prevent this?
> > 
> 
> Yes, it dropped by recommendation of Greg KH <gregkh@linuxfoundation.org>. 

I asked to drop it as you didn't even implement it to work correctly :)

> Greg, what you can suggest about it. May be better to add again single-open()-per-device lock with right locking way like:
> 
> >if (mutex_lock_interruptible(&jtag->open_lock)) {

You would stall an open?  Why not just return saying you can't do that?

Anyway, if you want to only have one access to the device at a time,
great, but do it in a way that works properly.

thanks,

greg k-h
