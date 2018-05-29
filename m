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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wGnV1x2kzDr6B
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 00:48:45 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4TEmQEO027834;
 Tue, 29 May 2018 09:48:27 -0500
Message-ID: <611f74ee2921b41d85449c91e60e07e3afa9ae55.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 2/3] hwmon: occ: Avoid displaying an
 error when host is down
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 May 2018 00:48:26 +1000
In-Reply-To: <CACPK8Xco8zzbyTZT45ER=b6i+p1_7a+Cm2WTdqP5bYRe3H2YMg@mail.gmail.com>
References: <20180529042833.11158-1-benh@kernel.crashing.org>
 <20180529042833.11158-2-benh@kernel.crashing.org>
 <CACPK8Xco8zzbyTZT45ER=b6i+p1_7a+Cm2WTdqP5bYRe3H2YMg@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 May 2018 14:48:47 -0000

On Tue, 2018-05-29 at 14:12 +0930, Joel Stanley wrote:
> On 29 May 2018 at 13:58, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > Instead display a much less scary informational message as
> > this can happen in normal circumstances.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >  drivers/hwmon/occ/common.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> > index 365bf207cf0d..0673af00a99b 100644
> > --- a/drivers/hwmon/occ/common.c
> > +++ b/drivers/hwmon/occ/common.c
> > @@ -1359,7 +1359,10 @@ int occ_setup(struct occ *occ, const char *name)
> > 
> >         /* no need to lock */
> >         rc = occ_poll(occ);
> > -       if (rc < 0) {
> > +       if (rc == -ESHUTDOWN) {
> > +               dev_info(occ->bus_dev, "Host is not ready\n");
> 
> Given this is normal, should we make this dev_dbg?
> 
> Otherwise we see it on the bmc serial console every time we boot the machine.

Up to you, feel free to tweak it as you merge :-)

Cheers,
Ben.
