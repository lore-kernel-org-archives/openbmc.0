Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzrjM63SRzDqCm
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 03:25:59 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 45844959;
 Thu, 12 Jan 2017 16:25:57 +0000 (UTC)
Date: Thu, 12 Jan 2017 17:26:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, devicetree@vger.kernel.org,
 jassisinghbrar@gmail.com, arnd@arndb.de, joel@jms.id.au,
 mark.rutland@arm.com, robh+dt@kernel.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170112162619.GB10283@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
 <20170112103038.GA19239@kroah.com>
 <1484234867.2492.39.camel@kernel.crashing.org>
 <20170112160051.GB8095@kroah.com>
 <1484237253.2492.43.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1484237253.2492.43.camel@kernel.crashing.org>
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
X-List-Received-Date: Thu, 12 Jan 2017 16:26:00 -0000

On Thu, Jan 12, 2017 at 10:07:33AM -0600, Benjamin Herrenschmidt wrote:
> On Thu, 2017-01-12 at 17:00 +0100, Greg KH wrote:
> > > How so ? I mean, access_ok followed by __get/__put_user is still a
> > > classic, what's wrong with it ?
> > 
> > No "normal" driver should do that, just call copy_to/from_user and be
> > done with it.  That way all of the proper locking and validation checks
> > like this are done correctly for you.  Why would a driver ever call the
> > "raw" __get/__put_user functions?
> 
> I supposed historically it was considered faster for some things :-)
> 
> Not a huge deal, and yes it's probably cleaner, I was just wondering
> what was "racy" about access_ok() that I might have missed...

I think, you can change things after access_ok() happens, there used to
be bugs in that area a few years ago.  I think we fixed them by moving
the offending drivers to use copy_*() instead.

thanks,

greg k-h
