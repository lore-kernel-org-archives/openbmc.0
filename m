Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzrJS2VbVzDqVR
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 03:07:52 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0CG7R1W020917;
 Thu, 12 Jan 2017 10:07:28 -0600
Message-ID: <1484237253.2492.43.camel@kernel.crashing.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, devicetree@vger.kernel.org,
 jassisinghbrar@gmail.com, arnd@arndb.de, joel@jms.id.au,
 mark.rutland@arm.com, robh+dt@kernel.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Date: Thu, 12 Jan 2017 10:07:33 -0600
In-Reply-To: <20170112160051.GB8095@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com> <1484216163.11416.8.camel@gmail.com>
 <20170112103038.GA19239@kroah.com>
 <1484234867.2492.39.camel@kernel.crashing.org>
 <20170112160051.GB8095@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 12 Jan 2017 16:07:53 -0000

On Thu, 2017-01-12 at 17:00 +0100, Greg KH wrote:
> > How so ? I mean, access_ok followed by __get/__put_user is still a
> > classic, what's wrong with it ?
> 
> No "normal" driver should do that, just call copy_to/from_user and be
> done with it.  That way all of the proper locking and validation checks
> like this are done correctly for you.  Why would a driver ever call the
> "raw" __get/__put_user functions?

I supposed historically it was considered faster for some things :-)

Not a huge deal, and yes it's probably cleaner, I was just wondering
what was "racy" about access_ok() that I might have missed...

Cheers,
Ben.
