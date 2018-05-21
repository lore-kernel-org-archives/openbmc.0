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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qM9W6WfvzF15Z
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 00:49:03 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4LEmUfF005097;
 Mon, 21 May 2018 09:48:41 -0500
Message-ID: <05ebcf5940e45a9083a65f6cc35eda367b44f9fc.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Eddie James
 <eajames@linux.vnet.ibm.com>
Date: Tue, 22 May 2018 00:48:30 +1000
In-Reply-To: <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-2-benh@kernel.crashing.org>
 <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
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
X-List-Received-Date: Mon, 21 May 2018 14:49:04 -0000

On Mon, 2018-05-21 at 14:56 +0930, Andrew Jeffery wrote:
> On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
> > Similarily to the new retry on SBE fifo errors, this adds
> > retries if the data we obtain from the OCC has a bad checksum.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >  drivers/fsi/fsi-occ.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> > index f4b2df7a3084..7a5afa78fb6b 100644
> > --- a/drivers/fsi/fsi-occ.c
> > +++ b/drivers/fsi/fsi-occ.c
> > @@ -652,7 +652,7 @@ static void occ_worker(struct work_struct *work)
> >  	struct occ_client *client;
> >  	struct occ *occ = container_of(work, struct occ, work);
> >  	struct device *sbefifo = occ->sbefifo;
> > -
> > +	int retries = 0;
> >  again:
> >  	if (occ->cancel)
> >  		return;
> > @@ -720,7 +720,10 @@ static void occ_worker(struct work_struct *work)
> >  	xfr->resp_data_length = resp_data_length + 7;
> >  
> >  	rc = occ_verify_checksum(resp, resp_data_length);
> > -
> > +	if (rc) {
> > +		if (retries++ < OCC_COMMAND_RETRIES)
> > +			goto again;
> > +	}
> 
> How should this interact with the OCC error handling mentioned in my
> reply on the previous patch? I feel like a checksum error is a bit of
> a grey area - probably caused by the transport, but possibly due to
> OCC firmware bugs as well?

Would it hurt to retry in any case ?

>  If it's the former then retrying independent of the OCC error
> handling protocol is probably okay, but if we're trying to catch the
> latter then maybe we should let this be handled as part of the OCC
> error handling code?
>
> Eddie?
> 
> Ben: Did you actually hit cases where this path was triggered? There
> was the corruption issue with simultaneous LPC cycles that turned out
> to be issues around level-shifters and synchronisers, was that it?

Yes, and I had cases where the CRC4 didn't "catch" the errors. The
retry fixed it. Now with the FSI layer being much more reliable, it
might be that all that retry stuff I added is no longer necessary, so I
won't be fighting for it, though I did find the upper layer error
handling to be somewhat lacking in efficacy...

I plan to do a deep dive on the rest of the OCC driver this week
regardless. I don't like a few things about it, such as the 2 layers
between fsi-occ and sbe_p9, that should be just one (sadly this change
will break the userspace binding code...).

I'll see if I can figure out how that error hanlding works.

Cheers,
Ben.

> >  done:
> >  	mutex_unlock(&occ->occ_lock);
> >  
> > @@ -732,6 +735,7 @@ static void occ_worker(struct work_struct *work)
> >  	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
> >  	list_del(&xfr->link);
> >  	empty = list_empty(&occ->xfrs);
> > +	retries = 0;
> >  
> >  	spin_unlock_irqrestore(&occ->list_lock, flags);
> >  
> > -- 
> > 2.17.0
> > 
