Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 417c0J3BLHzF0XQ
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 11:22:24 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5H1MCDi016000;
 Sat, 16 Jun 2018 20:22:13 -0500
Message-ID: <aff7b975390119239bfcb5bdef869bdfd28e712a.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 5/5] fsi/scom: Major overhaul
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 17 Jun 2018 11:22:11 +1000
In-Reply-To: <f2421fad1ea210b32a6813454832c0ed66770bf5.camel@kernel.crashing.org>
References: <20180612051911.20690-1-benh@kernel.crashing.org>
 <20180612051911.20690-6-benh@kernel.crashing.org>
 <CACPK8Xcp4gEVOrNdcZhbDx9LU1K6d=tV0vmJ9nLut4Fjwp0Xpg@mail.gmail.com>
 <f2421fad1ea210b32a6813454832c0ed66770bf5.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jun 2018 01:22:25 -0000

On Sun, 2018-06-17 at 11:17 +1000, Benjamin Herrenschmidt wrote:
> 
> We have everything that cronus needs and more than pdbg needs afaik :-)
> 
> That said, cronus does a bunch of other stupid things that I'm still
> trying to figure out how to fix.
> 
> We might need to create a /dev/cfam rather than going through that
> magic sysfs "raw" file, and I wouldn't mind using a single IDA so that
> all the devices below a given FSI slace (cfam itself, sbefifo, occ,
> ...) have the same "number".

Also while we're at reworking how all this is exposed to our broken
userspace, I wouldn't mind putting all these dev entries under a
directory, if I can figure out how to do that (I haven't really looked
yet).

/dev/fsi/{cfamN,sbefifoN,occN, ...} and possibly similar by-id and by-
path that other subsystems use, so we have something more deterministic
than the "random number" crap we do now.

We can always keep hacks to do symlinks in our kernel tree until we
have converted all our userspace users.

We currently control the only userspace users of this, so now is a good
time to cleanup how we expose things. This won't always be the case.

Cheers,
Ben.
