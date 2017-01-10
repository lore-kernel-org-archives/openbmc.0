Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyC5x1hTgzDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 11:08:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PCbjIupM"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id b22so9439134pfd.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 16:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBvi1XmxJzXdvKPYfBb5VwbNptT97RX/ZjVFPcfZVuQ=;
 b=PCbjIupMPuVbVUQ/Q74q8QoQQiJo9pZETamRIoQFeJMiuXjoELTG100vUsMo7Zetad
 kl+5TmRTqgdVTOzOkStGXk55FOKwLnzsuwUAtsEBl1+3DbLgMEDHJ487VyOtbuRIfLgP
 VcY+Cvsi9htx8bMJ617fkZsQskUJZXBO2koYs4fdJQD/W5LxbilBlw6JlKsDTzm+DbwG
 IcO70PhTBIwGDE2y7++jdMQNnVl8jhdKrZNWknCOv+1zY5e4/+VUYvajJov9+jhOytMp
 oqd9RJy5t3NzFj95tJz67zJBANlF16e61UaAZGYxfqP439duJdLHwyClrEI6XkF7fi5f
 bwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBvi1XmxJzXdvKPYfBb5VwbNptT97RX/ZjVFPcfZVuQ=;
 b=flOiXXrGAf6aodrwJe05oHzCxueWJ/xpDElXKzypY0fTdvh35Av1e4jdAyQW/3oRa7
 NYk6LrQDXqARx4nVOWcvpYm3PE1PVgKU51Ighq38e4TDIkucXsgtERUxtXYY48V+s/aO
 SAerPORWk0/xrMazVOZHOFUszpuGZa8ukzzGHP/GdqCL/DW6pl5/KNVZoihUMk+Fg88W
 NxcAJjQMpM+alWZ32zGAXN8JztSWlXJ7GyQawubLcVZ09AsGr77HzIUqqaa5UKW1kEvt
 krPsikvpvFzL0/dvGNaPn5/0HhNtns7MiX8WHuTo9WndoiiLpUuFdocR/LdXIJA+0t+H
 vQkA==
X-Gm-Message-State: AIkVDXLrpJBOS9pk16NEIiN/oGd1FBmwJ3Ok5e11Jklwv2lenuJLU6dOCey/PYnLq7ME2Q==
X-Received: by 10.99.107.4 with SMTP id g4mr486752pgc.108.1484006883121;
 Mon, 09 Jan 2017 16:08:03 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id x2sm115423pfx.65.2017.01.09.16.08.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Jan 2017 16:08:02 -0800 (PST)
Message-ID: <1484006838.6236.10.camel@gmail.com>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, benh@au1.ibm.com, 
 openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 10 Jan 2017 11:07:18 +1100
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
X-List-Received-Date: Tue, 10 Jan 2017 00:08:05 -0000

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
> 1. If lpos is zero, assume a MBOX_NUM_DATA_REGS-sized write as we do
> currently
> 2. If lpos is non-zero, assume a single byte write
> 

Ok so I started writing it - and I thought myself, wait why limit to
single byte writes of lpos is non-zero... I mean, they can do what they
want... what if they want to update two consequtive bytes, it seems
silly to have to require two write()s to do that no?

> On that, should we be testing the assumptions about buffer sizes?
> Currently we don't (we use the MBOX_NUM_DATA_REGS rather than count).
> 
> Andrew
