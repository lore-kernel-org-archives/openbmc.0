Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yblhX5F74zDsTv
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 22:31:40 +1100 (AEDT)
Received: from localhost (LFbn-1-12253-150.w90-92.abo.wanadoo.fr
 [90.92.67.150])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 6CF69C05;
 Tue, 14 Nov 2017 11:31:38 +0000 (UTC)
Date: Tue, 14 Nov 2017 12:31:44 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
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
Message-ID: <20171114113144.GA25234@kroah.com>
References: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
 <8760aoz78q.fsf@bilbrey.org>
 <DB6PR0501MB219753AC43515148F39CC2D0B1280@DB6PR0501MB2197.eurprd05.prod.outlook.com>
 <20171114111046.GA23820@kroah.com>
 <20171114111916.GO12318@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171114111916.GO12318@n2100.armlinux.org.uk>
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
X-List-Received-Date: Tue, 14 Nov 2017 11:31:40 -0000

On Tue, Nov 14, 2017 at 11:19:16AM +0000, Russell King - ARM Linux wrote:
> On Tue, Nov 14, 2017 at 12:10:46PM +0100, gregkh@linuxfoundation.org wrote:
> > On Tue, Nov 14, 2017 at 10:34:49AM +0000, Oleksandr Shamray wrote:
> > > Greg, what you can suggest about it. May be better to add again single-open()-per-device lock with right locking way like:
> > > 
> > > >if (mutex_lock_interruptible(&jtag->open_lock)) {
> > 
> > You would stall an open?  Why not just return saying you can't do that?
> 
> Greg, I think you need to look at the code again.

Heh, sorry, I probably got it wrong.  I'll be glad to review it in a
real patch when needed, but not in the middle of the merge window :)

thanks,

greg k-h
