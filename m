Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lgCa+oYx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bSOKHR+J"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hJ650shtzF2Rl
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 13:06:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C7402281B;
 Wed,  9 May 2018 23:06:34 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 09 May 2018 23:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=s2Nl7ERbCuKMMGRthFv7uDtAtoubw
 079fm0Qf2zNgKw=; b=lgCa+oYxZB/WUwUwimkionTUoZqy/6senkHz8I0R4HJxm
 SXKt5rKviM1/0jCRKhKIOUP7JM1k+z9pWXxYdnrQVsOZnNlYfGdfE3brweL1ReVy
 agP17fVrqe3TFIKFyE+fOSVaRAzcVBGzL24UrtTneEodi3CSF7jHWMuLCwHv0+/C
 G42dZ3ZiQQp7g5ECU8FLkYVUgxlUSyMwNqa/cdUBmfaRiAIFbRvfS70khMAtUGlA
 U2A4HugcD1YDi+ewMQ/IRWq6F1255U2n/6DOmvzbAZ0Gr5xzkjOVgVQYYIOji6LT
 7/LjbX2i7v8QvOFcGgx5CM/ToLNpJ6DQvDNrzBGTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s2Nl7E
 RbCuKMMGRthFv7uDtAtoubw079fm0Qf2zNgKw=; b=bSOKHR+J/jls8QojHwSpUi
 IcWp1r6foQ0t8gRkNjPjD9gjYb4haLq/1rVY4CTGBTWAeoQHK/SVUoc6EEqu5pdq
 IGerSSKuIRsALoAeiLTgKQcsPDA1G9N2UWgFgYf6fBdisqBCyEmdPaJ79TeWPZlt
 8PhjHKVsx7uoaes6NpI0M6ndDbCxcOOYS7WDwA0XKoG7n0L/4uKSjCeNjkaGnnRs
 FHyCaV9txifL1RhfQNZIurqSh+zmI+qEORQ/+3zPXJbLQiwwO7CJ2TayNtQAvyDf
 FYbE9pimxdnjePAwAicpRRLqwsLcpviA1LHhLC83E+d8N1lEbZvviJaV5semSJrA
 ==
X-ME-Sender: <xms:OrfzWvuz9U9fb8lNzI4omgLa0vsg24_9vdi7_ZSoxzl5uT69E-6ncQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EEEC4412B; Wed,  9 May 2018 23:06:33 -0400 (EDT)
Message-Id: <1525921593.2437705.1366975752.2D373C24@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <05e89ea8549634e750d783360590f2802954437d.camel@kernel.crashing.org>
 <f2a71866-7ab5-8017-0865-14f4e9b57b91@linux.vnet.ibm.com>
In-Reply-To: <f2a71866-7ab5-8017-0865-14f4e9b57b91@linux.vnet.ibm.com>
Date: Thu, 10 May 2018 12:36:33 +0930
Subject: Re: [PATCH linux dev-4.13 6/6] fsi/fsi-master-gpio: Reduce dpoll
 clocks
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
X-List-Received-Date: Thu, 10 May 2018 03:06:37 -0000

On Wed, 9 May 2018, at 05:30, Christopher Bostic wrote:
> Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> 
> 
> On 5/7/18 8:46 PM, Benjamin Herrenschmidt wrote:
> > FSI_GPIO_DPOLL_CLOCKS is the number of clocks before sending
> > a DPOLL command after receiving a BUSY status. It should be
> > at least tSendDelay (16 clocks).
> >
> > According to comments in the code, it needs to also be at least
> > 21 clocks due to HW issues.
> >
> > It's currently 100 clocks which impacts performances negatively
> > in some cases. Reduces it in half to 50 clocks which seems to
> > still be solid.

Out of curiosity, was there any science to 50 beyond the (16/21 cycle) reasoning above? Was there instability at lower values?

> >
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> >   drivers/fsi/fsi-master-gpio.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> > index 029b0a5b6d89..bd2b2cbd5eb5 100644
> > --- a/drivers/fsi/fsi-master-gpio.c
> > +++ b/drivers/fsi/fsi-master-gpio.c
> > @@ -29,7 +29,8 @@
> >   #define	FSI_GPIO_CMD_TERM	0x3f
> >   #define FSI_GPIO_CMD_ABS_AR	0x4
> >
> > -#define	FSI_GPIO_DPOLL_CLOCKS	100      /* < 21 will cause slave to hang */
> > +
> > +#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
> >
> >   /* Bus errors */
> >   #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
> > @@ -43,7 +44,7 @@
> >   #define	FSI_GPIO_RESP_ACK	0
> >   #define	FSI_GPIO_RESP_ACKD	4
> >
> > -#define	FSI_GPIO_MAX_BUSY	100
> > +#define	FSI_GPIO_MAX_BUSY	200
> >   #define	FSI_GPIO_MTOE_COUNT	1000
> >   #define	FSI_GPIO_DRAIN_BITS	20
> >   #define	FSI_GPIO_CRC_SIZE	4
> >
> 
