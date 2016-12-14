Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdxR546ZvzDvk6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 23:56:32 +1100 (AEDT)
Received: from localhost (unknown [209.136.236.94])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id CD224B1E;
 Wed, 14 Dec 2016 12:56:30 +0000 (UTC)
Date: Wed, 14 Dec 2016 04:56:41 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, arnd@arndb.de, joel@jms.id.au,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Message-ID: <20161214125641.GA5379@kroah.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214134530.2bd54a4e@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161214134530.2bd54a4e@free-electrons.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Mailman-Approved-At: Thu, 15 Dec 2016 00:37:18 +1100
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
X-List-Received-Date: Wed, 14 Dec 2016 12:56:33 -0000

On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
> Natarajan wrote:
> 
> > Documentation for the binding which provides an interface for adding clock,
> > data and clear signal GPIO lines to control seven segment display.
> > 
> > The platform device driver provides an API for displaying on two 7-segment
> > displays, and implements the required bit-banging. The hardware assumed is
> > 74HC164 wired to two 7-segment displays.
> > 
> > The character device driver implements the user-space API for letting a user
> > write to two 7-segment displays including any conversion methods necessary
> > to map the user input to two 7-segment displays.
> > 
> > Adding clock, data and clear signal GPIO lines in the devicetree to control
> > seven segment display on zaius platform.
> > 
> > The platform driver matches on the device tree node; the platform driver also
> > initializes the character device.
> > 
> > Tested that the seven segment display works properly by writing to the
> > character device file on a EVB AST2500 board which also has 74HC164 wired
> > to two 7-segment displays.
> 
> FWIW, I proposed a driver for seven segment displays back in 2013:
> 
>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html
> 
> And the feedback from Greg KH was: we don't need a driver for that, do
> it from userspace. See:
> 
>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html
> 
> So: good luck :-)

Did anyone ever write a library for this type of thing?

Again, I don't want to see one-off drivers for random devices like this
that should be able to all be controlled from userspace in a common
manner.  Much like we did for fingerprint readers a long long time
ago...

thanks,

greg k-h
