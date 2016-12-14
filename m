Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tf2cj5vFCzDt1Y
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 03:50:12 +1100 (AEDT)
Received: from localhost (unknown [104.132.0.97])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 5791C5AC;
 Wed, 14 Dec 2016 16:50:09 +0000 (UTC)
Date: Wed, 14 Dec 2016 08:50:19 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 mark.rutland@arm.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 arnd@arndb.de, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Message-ID: <20161214165019.GC14275@kroah.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214134530.2bd54a4e@free-electrons.com>
 <20161214125641.GA5379@kroah.com>
 <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Wed, 14 Dec 2016 16:50:14 -0000

On Wed, Dec 14, 2016 at 02:12:41PM +0100, Neil Armstrong wrote:
> On 12/14/2016 01:56 PM, Greg KH wrote:
> > On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
> >> Hello,
> >>
> >> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
> >> Natarajan wrote:
> >>
> >>> Documentation for the binding which provides an interface for adding clock,
> >>> data and clear signal GPIO lines to control seven segment display.
> >>>
> >>> The platform device driver provides an API for displaying on two 7-segment
> >>> displays, and implements the required bit-banging. The hardware assumed is
> >>> 74HC164 wired to two 7-segment displays.
> >>>
> >>> The character device driver implements the user-space API for letting a user
> >>> write to two 7-segment displays including any conversion methods necessary
> >>> to map the user input to two 7-segment displays.
> >>>
> >>> Adding clock, data and clear signal GPIO lines in the devicetree to control
> >>> seven segment display on zaius platform.
> >>>
> >>> The platform driver matches on the device tree node; the platform driver also
> >>> initializes the character device.
> >>>
> >>> Tested that the seven segment display works properly by writing to the
> >>> character device file on a EVB AST2500 board which also has 74HC164 wired
> >>> to two 7-segment displays.
> >>
> >> FWIW, I proposed a driver for seven segment displays back in 2013:
> >>
> >>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html
> >>
> >> And the feedback from Greg KH was: we don't need a driver for that, do
> >> it from userspace. See:
> >>
> >>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html
> >>
> >> So: good luck :-)
> > 
> > Did anyone ever write a library for this type of thing?
> > 
> > Again, I don't want to see one-off drivers for random devices like this
> > that should be able to all be controlled from userspace in a common
> > manner.  Much like we did for fingerprint readers a long long time
> > ago...
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> Actually, it's more than a random interface, a lot of SoCs and boards actually have such displays
> and it's a pity to use UIO, sysfs gpio bitbanging and all sort of ugly stuff to only print a few
> characters a simple and clean driver could achieve.

Great, then let's make an API that all devices of this type could use,
and not just take individual drivers that all have a custom char or
sysfs interface which requires custom userspace code to be able to drive
all of the different devices in a common way (i.e. a library would have
to be written anyways...)

thanks,

greg k-h
