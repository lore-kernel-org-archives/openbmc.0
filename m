Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v297M2gNzzDqPM
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 21:53:03 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 252AAB5A;
 Mon, 16 Jan 2017 10:53:01 +0000 (UTC)
Date: Mon, 16 Jan 2017 11:53:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: jk@ozlabs.org, benh@kernel.crashing.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH v3] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170116105316.GA30394@kroah.com>
References: <20170115230922.28249-1-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170115230922.28249-1-cyrilbur@gmail.com>
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
X-List-Received-Date: Mon, 16 Jan 2017 10:53:04 -0000

On Mon, Jan 16, 2017 at 10:09:22AM +1100, Cyril Bur wrote:
> In order to manage server systems, there is typically another processor
> known as a BMC (Baseboard Management Controller) which is responsible
> for powering the server and other various elements, sometimes fans,
> often the system flash.
> 
> The Aspeed BMC family which is what is used on OpenPOWER machines and a
> number of x86 as well is typically connected to the host via an LPC
> (Low Pin Count) bus (among others).
> 
> The LPC bus is an ISA bus on steroids. It's generally used by the
> BMC chip to provide the host with access to the system flash (via MEM/FW
> cycles) that contains the BIOS or other host firmware along with a
> number of SuperIO-style IOs (via IO space) such as UARTs, IPMI
> controllers.
> 
> On the BMC chip side, this is all configured via a bunch of registers
> whose content is related to a given policy of what devices are exposed
> at a per system level, which is system/vendor specific, so we don't want
> to bolt that into the BMC kernel. This started with a need to provide
> something nicer than /dev/mem for user space to configure these things.
> 
> One important aspect of the configuration is how the MEM/FW space is
> exposed to the host (ie, the x86 or POWER). Some registers in that
> bridge can define a window remapping all or portion of the LPC MEM/FW
> space to a portion of the BMC internal bus, with no specific limits
> imposed in HW.
> 
> I think it makes sense to ensure that this window is configured by a
> kernel driver that can apply some serious sanity checks on what it is
> configured to map.
> 
> In practice, user space wants to control this by flipping the mapping
> between essentially two types of portions of the BMC address space:
> 
>    - The flash space. This is a region of the BMC MMIO space that
> more/less directly maps the system flash (at least for reads, writes
> are somewhat more complicated).
> 
>    - One (or more) reserved area(s) of the BMC physical memory.
> 
> The latter is needed for a number of things, such as avoiding letting
> the host manipulate the innards of the BMC flash controller via some
> evil backdoor, we want to do flash updates by routing the window to a
> portion of memory (under control of a mailbox protocol via some
> separate set of registers) which the host can use to write new data in
> bulk and then request the BMC to flash it. There are other uses, such
> as allowing the host to boot from an in-memory flash image rather than
> the one in flash (very handy for continuous integration and test, the
> BMC can just download new images).
> 
> It is important to note that due to the way the ASpeed chip lets the
> kernel configure the mapping between host LPC addresses and BMC ram
> addresses the offset within the window must be a multiple of size.
> Not doing so will fragment the accessible space rather than simply
> moving 'zero' upwards. This is caused by the nature of HICR8 being a
> mask and the way host LPC addresses are translated.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> v2:
> 	Removed unused functions
> 	Removed use of access_ok()
> 	All input is evil
> 	Reworked the interface as per Benjamin Herrenschmidts vision
> V3:
> 	Removed 'default y' from Kconfig
> 	Reordered ioctl() struct fields
> 	Reworeded some comments
> 
>  drivers/misc/Kconfig                 |   8 ++
>  drivers/misc/Makefile                |   1 +
>  drivers/misc/aspeed-lpc-ctrl.c       | 264 +++++++++++++++++++++++++++++++++++
>  include/uapi/linux/aspeed-lpc-ctrl.h |  35 +++++
>  4 files changed, 308 insertions(+)
>  create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
>  create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

I'd like to get some acks or reviewed-by from some PPC people on this
before accepting it, to let me know that they are ok with this driver
as-is.

thanks,

greg k-h
