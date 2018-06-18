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
 by lists.ozlabs.org (Postfix) with ESMTPS id 418JTm3s0FzF0l6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 14:46:52 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5I4kYJs011416;
 Sun, 17 Jun 2018 23:46:35 -0500
Message-ID: <33924c2e545b2dfabf2849d9c485f165c339323f.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 5/5] fsi/scom: Major overhaul
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alistair Popple <alistair@popple.id.au>, openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Date: Mon, 18 Jun 2018 14:46:33 +1000
In-Reply-To: <1908243.hVhg7auBNd@new-mexico>
References: <20180612051911.20690-1-benh@kernel.crashing.org>
 <f2421fad1ea210b32a6813454832c0ed66770bf5.camel@kernel.crashing.org>
 <aff7b975390119239bfcb5bdef869bdfd28e712a.camel@kernel.crashing.org>
 <1908243.hVhg7auBNd@new-mexico>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
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
X-List-Received-Date: Mon, 18 Jun 2018 04:46:53 -0000

On Mon, 2018-06-18 at 14:09 +1000, Alistair Popple wrote:
> On Sunday, 17 June 2018 11:22:11 AM AEST Benjamin Herrenschmidt wrote:
> > On Sun, 2018-06-17 at 11:17 +1000, Benjamin Herrenschmidt wrote:
> > > 
> > > We have everything that cronus needs and more than pdbg needs afaik :-)
> 
> Yep, has what we need and more (such as put scom under mask and indirect scom).
> Only other useful thing would be repeated getsom/putscom operations (eg. read
> the same scom address n times) as they would help with ADU access which can do
> autoincrement or scanscom (although we should just use the scan engine directly
> for that so not a big issue).
> 
> > +	for (retries = 0; retries < SCOM_MAX_RETRIES; retries++) {
> > +		rc = raw_get_scom(scom, value, addr, &status);
> > +		if (rc) {
> > +			/* Try resetting the bridge if FSI fails */
> > +			if (rc != -ENODEV && retries == 0) {
> > +				fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG,
> > +						 &dummy, sizeof(uint32_t));
> > +				rc = -EBUSY;
> > +			} else
> > +				return rc;
> > +		} else
> > +			rc = handle_fsi2pib_status(scom, status);
> > +		if (rc && rc != -EBUSY)
> > +			break;
> > +		if (rc == 0) {
> > +			rc = handle_pib_status(scom,
> > +					       (status & SCOM_STATUS_PIB_RESP_MASK)
> > +					       >> SCOM_STATUS_PIB_RESP_SHIFT);
> > +			if (rc && rc != -EBUSY)
> > +				break;
> > +		}
> > +		if (rc == 0)
> > +			break;
> > +		msleep(1);
> > +	}
> 
> The rc handling above took me a little while to grok but I didn't come up with a
> cleaner alternative and I think it's correct.

Ack-by or Reviewed-by tag pls ? :-)

Cheers,
Ben.

> - Alistair
> 
> > > 
> > > That said, cronus does a bunch of other stupid things that I'm still
> > > trying to figure out how to fix.
> > > 
> > > We might need to create a /dev/cfam rather than going through that
> > > magic sysfs "raw" file, and I wouldn't mind using a single IDA so that
> > > all the devices below a given FSI slace (cfam itself, sbefifo, occ,
> > > ...) have the same "number".
> > 
> > Also while we're at reworking how all this is exposed to our broken
> > userspace, I wouldn't mind putting all these dev entries under a
> > directory, if I can figure out how to do that (I haven't really looked
> > yet).
> > 
> > /dev/fsi/{cfamN,sbefifoN,occN, ...} and possibly similar by-id and by-
> > path that other subsystems use, so we have something more deterministic
> > than the "random number" crap we do now.
> > 
> > We can always keep hacks to do symlinks in our kernel tree until we
> > have converted all our userspace users.
> > 
> > We currently control the only userspace users of this, so now is a good
> > time to cleanup how we expose things. This won't always be the case.
> > 
> > Cheers,
> > Ben.
> > 
> > 
> 
> 
