Return-Path: <thomas.petazzoni@free-electrons.com>
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
 by lists.ozlabs.org (Postfix) with ESMTP id 3tdxBd6RsqzDvk5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 23:45:45 +1100 (AEDT)
Received: by mail.free-electrons.com (Postfix, from userid 110)
 id 2F88C20C1C; Wed, 14 Dec 2016 13:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
 URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr
 [90.63.216.87])
 by mail.free-electrons.com (Postfix) with ESMTPSA id D6C5220780;
 Wed, 14 Dec 2016 13:45:30 +0100 (CET)
Date: Wed, 14 Dec 2016 13:45:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org,
 joel@jms.id.au, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Message-ID: <20161214134530.2bd54a4e@free-electrons.com>
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
Organization: Free Electrons
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 14 Dec 2016 12:45:46 -0000

Hello,

On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
Natarajan wrote:

> Documentation for the binding which provides an interface for adding clock,
> data and clear signal GPIO lines to control seven segment display.
> 
> The platform device driver provides an API for displaying on two 7-segment
> displays, and implements the required bit-banging. The hardware assumed is
> 74HC164 wired to two 7-segment displays.
> 
> The character device driver implements the user-space API for letting a user
> write to two 7-segment displays including any conversion methods necessary
> to map the user input to two 7-segment displays.
> 
> Adding clock, data and clear signal GPIO lines in the devicetree to control
> seven segment display on zaius platform.
> 
> The platform driver matches on the device tree node; the platform driver also
> initializes the character device.
> 
> Tested that the seven segment display works properly by writing to the
> character device file on a EVB AST2500 board which also has 74HC164 wired
> to two 7-segment displays.

FWIW, I proposed a driver for seven segment displays back in 2013:

   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html

And the feedback from Greg KH was: we don't need a driver for that, do
it from userspace. See:

   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html

So: good luck :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
