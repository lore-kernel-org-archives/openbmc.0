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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qYz15qwczDqG0
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 08:55:41 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4LMt6Qq013119;
 Mon, 21 May 2018 17:55:14 -0500
Message-ID: <f7352b03ad6942da5cd19ddbf074630de096f8f9.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
 <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 May 2018 08:55:06 +1000
In-Reply-To: <db3ce0ae-9aba-c764-5e79-0140e095330e@linux.vnet.ibm.com>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-2-benh@kernel.crashing.org>
 <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
 <05ebcf5940e45a9083a65f6cc35eda367b44f9fc.camel@kernel.crashing.org>
 <db3ce0ae-9aba-c764-5e79-0140e095330e@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 21 May 2018 22:55:42 -0000

On Mon, 2018-05-21 at 13:58 -0500, Eddie James wrote:
> 
> The checksum is part of the OCC response, so it's not a transport thing. 
> If we've gotten to checking the checksum then we've got a full response 
> that looks valid so far (reasonable length, etc).

I have had cases of transport errors causing a bad checksum, CRC4 is a
bit weak at the FSI transport level.

> If we're trying to adhere to the OCC spec, then I'm of the opinion that 
> we shouldn't do any retries except for those handled in the occ-hwmon 
> driver.
> 
> > > 
> > > Ben: Did you actually hit cases where this path was triggered? There
> > > was the corruption issue with simultaneous LPC cycles that turned out
> > > to be issues around level-shifters and synchronisers, was that it?
> > 
> > Yes, and I had cases where the CRC4 didn't "catch" the errors. The
> > retry fixed it. Now with the FSI layer being much more reliable, it
> > might be that all that retry stuff I added is no longer necessary, so I
> > won't be fighting for it, though I did find the upper layer error
> > handling to be somewhat lacking in efficacy...
> > 
> > I plan to do a deep dive on the rest of the OCC driver this week
> > regardless. I don't like a few things about it, such as the 2 layers
> > between fsi-occ and sbe_p9, that should be just one (sadly this change
> > will break the userspace binding code...).
> 
> What do you mean two layers? fsi-occ and occ-hwmon? I fear that the 
> hwmon maintainer won't like having so much transport stuff (and a 
> chardev) in the hwmon driver.

The transport stuff in fsi-occ can be brought down to almost nothing,
most of the code in there is ... not particularily useful.

As for the chardev, other drivers in hwmon do that too, but I suppose I
can handle the discussion with Guenter.

Cheers,
Ben.

> > 
> > I'll see if I can figure out how that error hanlding works.
> > 
> > Cheers,
> > Ben.
> > 
> > > >   done:
> > > >   	mutex_unlock(&occ->occ_lock);
> > > >   
> > > > @@ -732,6 +735,7 @@ static void occ_worker(struct work_struct *work)
> > > >   	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
> > > >   	list_del(&xfr->link);
> > > >   	empty = list_empty(&occ->xfrs);
> > > > +	retries = 0;
> > > >   
> > > >   	spin_unlock_irqrestore(&occ->list_lock, flags);
> > > >   
> > > > -- 
> > > > 2.17.0
> > > > 
