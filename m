Return-Path: <jerry.hoemann@hpe.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=hpe.com
 (client-ip=15.241.32.99; helo=g9t1613g.houston.hpe.com;
 envelope-from=jerry.hoemann@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 532 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Nov 2018 12:40:23 AEDT
Received: from g9t1613g.houston.hpe.com (g9t1613g.houston.hpe.com
 [15.241.32.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 433mgq29SHzDqRM
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 12:40:21 +1100 (AEDT)
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by g9t1613g.houston.hpe.com (Postfix) with ESMTPS id 90E5260AA7
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 01:31:28 +0000 (UTC)
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net
 [16.208.49.245])
 by g9t5008.houston.hpe.com (Postfix) with ESMTP id 2CEAF59;
 Tue, 27 Nov 2018 01:31:19 +0000 (UTC)
Received: from anatevka (anatevka.americas.hpqcorp.net [10.34.81.61])
 by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id EA62C49;
 Tue, 27 Nov 2018 01:31:17 +0000 (UTC)
Date: Mon, 26 Nov 2018 18:31:17 -0700
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: Tao Ren <taoren@fb.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] watchdog: core: suppress "watchdog did not stop" message
Message-ID: <20181127013117.GB11080@anatevka>
Reply-To: Jerry.Hoemann@hpe.com
References: <20181115234413.27009-1-taoren@fb.com>
 <20181116001938.GA16009@roeck-us.net>
 <9a43bb84-f476-d6c8-886a-2120312ee8e7@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a43bb84-f476-d6c8-886a-2120312ee8e7@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 28 Nov 2018 22:35:21 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2018 01:40:23 -0000

On Fri, Nov 16, 2018 at 12:37:28AM +0000, Tao Ren wrote:
> On 11/15/18 4:19 PM, Guenter Roeck wrote:
> > NACK. This message is displayed if/when the watchdog application
> > exits without stopping the watchdog and/or without closing properly.
> > This _is_ critical since it will reboot the system after the next
> > timeout period.
> > 
> > If userspace triggers this message on purpose (eg by the mentioned
> > script, which does not exit properly), userspace is at fault,
> > not the kernel.
> > 
> > Guenter
> 
> Thank you for the quick response, Guenter. I see the log each time when I reboot my system, and when I searched the message in google, I also found posts asking why the message is printed at reboot, and that's why I feel it's confusing.
> 
> Anyways, please ignore the patch since it's necessary.

Tao,

If you're on a system running systemd, the default behavior is to
enable the watchdog during shutdown.  This guards against shutdown hanging.
So this message will be routinely printed out during orderly shutdown.


See file: /etc/systemd/system.conf
----------------------------------
...
# Entries in this file show the compile time defaults.
...

#ShutdownWatchdogSec=10min




-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
