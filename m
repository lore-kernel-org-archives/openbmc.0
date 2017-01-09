Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyB1T37KBzDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 10:19:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTIaidTi"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id f144so6737290pfa.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 15:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KkThse1QutwZeqePTo7SJwNqoaBjrxtcbibUdRAtLjM=;
 b=fTIaidTiGTlzbPWvrM8yn5HGC2vvYCzO3fAmxsQkZRDt/TyfRwKQCeQFFNP/SVo0UU
 qyqh+M/bOyzyn9kzJTUg0gLH9DED/M3iF18gEz/R+1cGDVPKqj19kqqPKVK+sc0Orqy6
 i9V9MQVmkTJtrm7yh+1xt1uedglWPKfJSsOQO8TNnxj5fgV8hZDcrCfaQjUskupOVcKc
 UoWZfL13K5S0VZpTZ524slLo3pWSaBAa9IXjzz1urW6/88DWVtUv/HFAoxUBCL8uA9fL
 Hu/q7Jn9kRp+l0qlpOrJ7XAFHypx5iufbb3MrRWf/nzcDdm6DVJkOiASnq60yaIjjUf2
 4WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KkThse1QutwZeqePTo7SJwNqoaBjrxtcbibUdRAtLjM=;
 b=mHbR/E4KymxnSVOv1A6QSQFW1O8PGQGyy6tMDGp8DVn32vxkJDgQwARTtPm2yOX+aS
 fjEuHEq+afHDZcPIqqyLJKwDNPmcafwDLGmN2mx+NKW7/yDQlGyocRWv43sgGaNdsR5C
 LGREuAbPg/TuBwfBXFiOPymVjbZrrEmQciEe5mmOkzVQZD4OwayY6A0+x45vOgnCOEqZ
 zV2eF5yWs1Mg3HCB1iZQnwRooRX2s5FXX22u+UDzO9zRczhuJXEEmKfeXH4kKNDAOO7m
 B41JmCum2HI9jt668dLgb4joQI5fXmweFMtEvQ7XQPDTao0K9SFmXT2IlwG5dq0R1nAn
 NkFQ==
X-Gm-Message-State: AIkVDXKRvrrDTU0z3IypIelGcCC3qLGtEKNnfx+iq1UKCAnRVI1BNLoTB8R4CQMYPwfr1A==
X-Received: by 10.84.167.2 with SMTP id c2mr310572plb.56.1484003947672;
 Mon, 09 Jan 2017 15:19:07 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id w5sm10898pfl.31.2017.01.09.15.19.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Jan 2017 15:19:07 -0800 (PST)
Message-ID: <1484003903.6236.7.camel@gmail.com>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, benh@au1.ibm.com, 
 openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 10 Jan 2017 10:18:23 +1100
In-Reply-To: <1484002504.12800.1.camel@aj.id.au>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911906.15843.61.camel@au1.ibm.com>
 <1483999740.6236.2.camel@gmail.com> <1484002504.12800.1.camel@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
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
X-List-Received-Date: Mon, 09 Jan 2017 23:19:09 -0000

On Tue, 2017-01-10 at 09:25 +1030, Andrew Jeffery wrote:
> On Tue, 2017-01-10 at 09:09 +1100, Cyril Bur wrote:
> > On Sun, 2017-01-08 at 15:45 -0600, Benjamin Herrenschmidt wrote:
> > > On Tue, 2017-01-03 at 11:54 +1030, Andrew Jeffery wrote:
> > > > > > I think we should rename the IOCTL as what we do below doesn't
> > > > > > necessarily raise an interrupt.
> > > > > >  
> > > > > 
> > > > >  
> > > > > Agreed, taking unput :). ASPEED_MBOX_IOCTL_WRITE_BYTE ?
> > > > 
> > > > That suggestion works for me.
> > 
> > Sorry about the blank one, I'll try typing something this time.
> > 
> > > If we are going to do that, maybe we should make this a write()
> > > at a specific lpos...
> > > 
> > 
> > Andrew, Joel what do you think of this, a write of count 1 at a
> > specific pos. I like this since it removes ioctls all together and
> > isn't any harder for userspace.
> 
> I'm in favour of removing the ioctl. So the logic would be:
> 

Cool done.

> 1. If lpos is zero, assume a MBOX_NUM_DATA_REGS-sized write as we do
> currently

Just to clarify - if lpos is zero anything smaller than or equal to
MBOX_NUM_DATA_REGS is good.

> 2. If lpos is non-zero, assume a single byte write
> 

Sounds good.

> On that, should we be testing the assumptions about buffer sizes?
> Currently we don't (we use the MBOX_NUM_DATA_REGS rather than count).
> 

Yeah. Simple checks for your condition 1 and 2.

> Andrew
