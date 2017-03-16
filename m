Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkLhP3TnDzDqZ7
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 19:08:37 +1100 (AEDT)
Received: from localhost (unknown [183.98.136.252])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 86D718A6;
 Thu, 16 Mar 2017 08:08:34 +0000 (UTC)
Date: Thu, 16 Mar 2017 17:08:21 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, linux-kernel@vger.kernel.org,
 mikey@neuling.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v6] drivers/misc: Add Aspeed LPC control driver
Message-ID: <20170316080821.GA32044@kroah.com>
References: <20170217032849.23994-1-cyrilbur@gmail.com>
 <1487313897.23576.122.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1487313897.23576.122.camel@kernel.crashing.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
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
X-List-Received-Date: Thu, 16 Mar 2017 08:08:37 -0000

On Fri, Feb 17, 2017 at 05:44:57PM +1100, Benjamin Herrenschmidt wrote:
> On Fri, 2017-02-17 at 14:28 +1100, Cyril Bur wrote:
> > In order to manage server systems, there is typically another
> > processor
> > known as a BMC (Baseboard Management Controller) which is responsible
> > for powering the server and other various elements, sometimes fans,
> > often the system flash.
> 
>  .../...
> 
> > It is important to note that due to the way the Aspeed chip lets the
> > kernel configure the mapping between host LPC addresses and BMC ram
> > addresses the offset within the window must be a multiple of size.
> > Not doing so will fragment the accessible space rather than simply
> > moving 'zero' upwards. This is caused by the nature of HICR8 being a
> > mask and the way host LPC addresses are translated.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> 
> Reviewed-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Greg, quick Q for you:
> 
> We will need to also add a mechanism to poke at a few registers
> in the same LPC controllers from userspace.
> 
> Mostly those are "scratch" registers that the BMC is supposed to set to
> specific values to indicates features it supports etc... (or to enable 
> the host BIOS to run in some kind of verbose debug mode).
> 
> Think of it as a communication channel between the BMC and the BIOS
> running on the host.
> 
> The BMC userspace needs to set them to various platform specific
> values as appropriate for a given vendor/system (userspace policy
> from the BMC perspective) during boot and/or change them as the result
> of some user actions (enable debug mode) etc...
> 
> The question here is read/write or sysfs files attached to the
> sysfs node ?
> 
> The former means userspace needs to "seek" to the right magic
> offset to write to one of them which is non-trivial to do from
> simple shell scripts but is a more natural interface.
> 
> It also means the owner/permissions of the /dev entry as set
> by uboot apply which can be nice.
> 
> The latter can expose each register by its name which provides
> a nice way to echo in/out of them from a shell script.
> 
> The drawback is that pretty much restricts access to root.
> 
> What do you recommend ?

That wasn't a quick question :)

I really have no idea, sorry, try some things out and see what seems to
work.

greg k-h
