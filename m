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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hJCV3rNWzF2Rl
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 13:11:18 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4A3AjUo006554;
 Wed, 9 May 2018 22:10:51 -0500
Message-ID: <8bcfbbe6b3c3bd44e96d063a57e9572905446181.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 4/6] fsi/fsi-master-gpio: Add
 "no-gpio-delays" option
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andrew Jeffery <andrew@aj.id.au>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Thu, 10 May 2018 13:10:45 +1000
In-Reply-To: <1525921439.2436671.1366969152.5C41D3BD@webmail.messagingengine.com>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-4-benh@kernel.crashing.org>
 <c3c12f08-afc1-7937-68a1-dabd559382ad@linux.vnet.ibm.com>
 <1525921439.2436671.1366969152.5C41D3BD@webmail.messagingengine.com>
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
X-List-Received-Date: Thu, 10 May 2018 03:11:19 -0000

On Thu, 2018-05-10 at 12:33 +0930, Andrew Jeffery wrote:
> > >      for (i = 0; i < count; i++) {
> > > -           ndelay(FSI_GPIO_STD_DLY);
> > > +           if (!master->no_delays)
> 
> This is a bit of a nit, but we don't have to have the member name
> reflect the devicetree property. I reckon the code would be mildly
> easier to read (avoiding the double-negative) if we inverted it:
> 
>                         if (master->do_delays)
>  
> > > +                   ndelay(FSI_GPIO_STD_DLY);

I prefer it as "no_delays" personally because delays is the norm,
and no delays is the exception for aspeed (or slow GPIO blocks).

Cheers,
Ben.
