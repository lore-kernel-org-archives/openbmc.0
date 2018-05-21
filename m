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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qBnL116WzF12N
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 18:31:01 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4L8UePO010464;
 Mon, 21 May 2018 03:30:47 -0500
Message-ID: <85b59d57c40db1b69101ca2bb295d8203a6223a3.camel@kernel.crashing.org>
Subject: Re: [PATCH v3 linux dev-4.13 2/3] fsi/sbefifo: Add driver for the
 SBE FIFO
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: Nick Piggin <npiggin@au1.ibm.com>
Date: Mon, 21 May 2018 18:30:40 +1000
In-Reply-To: <1526874415.2620050.1378895248.510458F0@webmail.messagingengine.com>
References: <20180518013429.17732-1-benh@kernel.crashing.org>
 <20180518013429.17732-2-benh@kernel.crashing.org>
 <1526874415.2620050.1378895248.510458F0@webmail.messagingengine.com>
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
X-List-Received-Date: Mon, 21 May 2018 08:31:02 -0000

+Nick (see question about iovec)

> > --- /dev/null
> > +++ b/drivers/fsi/fsi-sbefifo.c
> > @@ -0,0 +1,867 @@
> > +/*
> > + * Copyright (C) IBM Corporation 2017
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> 
> Should be SPDX-style?

Yup, keep forgetting about that new thing :)

> > 

 .../...

> > +static int sbefifo_get_sbe_state(struct sbefifo *sbefifo)
> 
> This isn't so much getting the state as ensuring it's in a usable
> state, or it's conflating error codes with the SBE state. Maybe
> sbefifo_is_ready()?

Hrm... I would expect something called is_something() to return a
boolean, while here I have 3 different result codes as I want to
differenciate busy. I'm also adding some more in the next version
to extract the bit indicating that an SBE async FFDC is present.

So what about calling it sbefifo_check_sbe_state() instead ?

IE. It's not a "getter" .. 

  .../...

> > +/**
> > + * sbefifo_submit() - Submit and SBE fifo command and receive response
> > + * @dev: The sbefifo device
> > + * @command: The raw command data
> > + * @cmd_len: The command size (in 32-bit words)
> > + * @response: The output response buffer
> > + * @resp_len: In: Response buffer size, Out: Response size
> > + *
> > + * This will perform the entire operation. If the reponse buffer
> > + * overflows, returns -EOVERFLOW
> > + */
> > +int sbefifo_submit(struct device *dev, const __be32 *command, size_t 
> > cmd_len,
> > +		   __be32 *response, size_t *resp_len)
> > +{
> > +	struct sbefifo *sbefifo = dev_get_drvdata(dev);
> > +	mm_segment_t old_fs;
> > +	int rc;
> > +
> > +	if (!dev || !sbefifo)
> > +		return -ENODEV;
> > +	if (WARN_ON_ONCE(sbefifo->magic != SBEFIFO_MAGIC))
> > +		return -ENODEV;
> > +	if (!resp_len || !command || !response || cmd_len > 
> > SBEFIFO_MAX_CMD_LEN)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&sbefifo->lock);
> > +	old_fs = get_fs();
> > +	set_fs(KERNEL_DS);
> > +	rc = __sbefifo_submit(sbefifo, command, cmd_len,
> > +			      response, resp_len);
> > +	set_fs(old_fs);
> 
> Can you talk about why the get_fs()/set_fs()/set_fs() sequence is the
> right way to go here when there's been discussion in the past about
> removing the whole show?
> 
> https://lwn.net/Articles/722267/

Interesting, I had missed that conversation/debate, it's an old API but
I've been around for a long time :-) It used to be the way to do that
sort of thing.

The above use is a rather safe since the oops case has been fixed, but
if it's actively being phased out then I should try to find a different
way, though sadly nothing will be as simple and efficient as the above.

Nick, you added some of that iovec stuff, what do you think is the
right construct here ?

I read from the HW fifo synchronously and currently just put_user() one
word at a time into the destination buffer, which can be either a user
address (read() syscall to the driver) or a kernel address (in-kernel
API).

The old code just had 2 pointer argument, one kernel pointer and one
user pointer and would write to which ever was populated, which I
thought was gross.

The iovec stuff looks ... complicated for such a simple use case.

Cheers,
Ben.
