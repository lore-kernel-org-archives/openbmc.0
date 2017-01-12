Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzt3g0r5fzDqNk
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 04:26:54 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 64013B55;
 Thu, 12 Jan 2017 17:26:51 +0000 (UTC)
Date: Thu, 12 Jan 2017 18:27:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, devicetree@vger.kernel.org,
 jassisinghbrar@gmail.com, arnd@arndb.de, joel@jms.id.au,
 mark.rutland@arm.com, robh+dt@kernel.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170112172713.GF13342@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
 <1484235315.2492.41.camel@kernel.crashing.org>
 <1484238577.2492.45.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484238577.2492.45.camel@kernel.crashing.org>
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
X-List-Received-Date: Thu, 12 Jan 2017 17:26:55 -0000

On Thu, Jan 12, 2017 at 10:29:37AM -0600, Benjamin Herrenschmidt wrote:
> So I think the best approach here is:
> 
> 	- A pair of ioctls to read and write random registers in the
> LPC bridge for all the "generally configuration gunk". These have a
> filter to ensure that the registers controlling the above mapping
> cannot be accessed that way.
> 
> 	- An ioctl to control the above mapping window. It takes as
> arguments the location in LPC space, the window type (flash vs.
> memory), for memory, maybe an ID (several windows to chose from), and
> the offset& size in the latter. The driver can enforce that the windows
> are one of the specially reserved areas of memory etc...
> 
> 	- An mmap function to map those reserved windows into userspace
> so the daemon can communicate appropriately (only needed for the memory
> windows, the flash space is accessed via the normal /dev/mtd drivers)
> 
> Greg, does that make sense ?

Yes, that makes a lot more sense to me.  Thanks for writing it up,
hopefully it survives into the next driver submission, otherwise I'll
ask the same questions again due to not having a short-term memory at
all :)

thanks,

greg k-h
