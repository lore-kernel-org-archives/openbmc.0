Return-Path: <SRS0=JHGv=NR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA7FC4320A
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 01:53:52 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A34F610C8
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 01:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A34F610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw5VP4kQ4z2yZp
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 11:53:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=M21ZefVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M21ZefVt; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw5Tc2WCsz2xnf
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 11:53:07 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id j2so784132pll.1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x4JuXSrwBuvstP4/kGJz2DgvTrucNrk/L/pWGS28Bh4=;
 b=M21ZefVt0a2bJh5CQxVOXxxzif3fWXWQkDyUX5I653bC5XYlVIlkPrL7nQMCxmQFy0
 wzqDsNNkWVQRCkAhWjgoMZ2gPvAjg+Rmt3UD8tmZiB34390A++fL4dAldEyGbJTh4yqW
 Cj/cmQMjXiCoKj4PNOnu9It6vZx8vx/ARDOkHzag/xlP4dkfFCzvn6SCGYsNeW6+K1ac
 KtFweAgUgaUOxpSXA2jszhyMVCpVEhyuAbfx4g5EHBqIKpdFgu+h40jxzXoHNOb0aCId
 7k8QArRlcsnQSjYZFeMQpg3ZKVxn0GlXxuVle8JKrU+JmsKb+S+AUqtXkZKGKWuyHGWA
 ovBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x4JuXSrwBuvstP4/kGJz2DgvTrucNrk/L/pWGS28Bh4=;
 b=PshqDBE4UYseGQ2QU8YtiTvVeyy76PB8aDel9nON86empGU7ScYIEPpsuR26ZuasTR
 7eNGdJkpeb7nJHwUwxzDj5VcuD85LhP7g4Et1yleBN/dLtrrHY0SXA7Gbu4TsgvVKq0y
 ghlyUjsKDvK8J1QqDczVEmgITvsfA8JG9qcwfiApW/fSBtQe5bgo4s412n5GId0qmj68
 tkkGX0S6KGFUi2KE1639OLtrPE/iGDzJF/9mFgceRi23EiYYek4sN0AqS4Z4HhId/CBO
 Dq0j0rZJ1t8CIPvcvvtWaMW/ZKI2wZimFTlXS8y7YpCDKHx9FfazWGLXffmUZ+yH7bsx
 Rk2w==
X-Gm-Message-State: AOAM531OOPlCkz32DUZXyt/qhPqaiMrohxSGnMmQEjDygopbp9gQP7Qg
 UCJaQmJcEtJDRML/pj3J3u8=
X-Google-Smtp-Source: ABdhPJx70po7lWpxMgu3Haa2OBZ2C6Ld5Fc9cH0qcKFBnAVOm9XVmV/mL34ZJsev0CBUBhT5KJQFIg==
X-Received: by 2002:a17:90a:d589:: with SMTP id
 v9mr13655376pju.61.1629942782609; 
 Wed, 25 Aug 2021 18:53:02 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id f11sm827643pfc.23.2021.08.25.18.53.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Aug 2021 18:53:02 -0700 (PDT)
Date: Wed, 25 Aug 2021 18:52:55 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: ASPEED EHCI error: "controller refused to start: -110"
Message-ID: <20210826015254.GA24175@taoren-ubuntu-R90MNF91>
References: <20210825062348.GA18567@taoren-ubuntu-R90MNF91>
 <HK0PR06MB33800E25D0C103664C9129F7F2C69@HK0PR06MB3380.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB33800E25D0C103664C9129F7F2C69@HK0PR06MB3380.apcprd06.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "andrew@aj.id.au" <andrew@aj.id.au>, Neal Liu <neal_liu@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joppa Tsao <joppa_tsao@aspeedtech.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Ryan,

On Wed, Aug 25, 2021 at 07:48:57AM +0000, Ryan Chen wrote:
> Hello,
> 	ASPEED EHCI design for HALT bit effect is depend on Asynchronous/Periodic Schedule enable or not.
> 	If Asynchronous/Periodic Schedule not enable, but run bit is setting, Halt still = 1.
> 
> Ryan Chen

Thanks for the inputs.

What is your recommendation? Enabling Async/Periodic schedule to make
USBSTS.HCHalted handshake happy? Or ignoring HCHalted check for ASPEED
platforms? Can you please send out a patch to fix the failure? The EHCI
driver stops working on ASPEED platforms since v5.10.


Cheers,

Tao
> 
> Tel : 886-3-5751185 ext:8857
> 
> > -----Original Message-----
> > From: Tao Ren <rentao.bupt@gmail.com>
> > Sent: Wednesday, August 25, 2021 2:24 PM
> > To: openbmc@lists.ozlabs.org
> > Cc: joel@jms.id.au; andrew@aj.id.au; Ryan Chen
> > <ryan_chen@aspeedtech.com>
> > Subject: ASPEED EHCI error: "controller refused to start: -110"
> > 
> > Hi,
> > 
> > I started to see below EHCI probe failure on my AST2500 and AST2600 BMC
> > platforms since commit 280a9045bb18 ("ehci: fix EHCI host controller
> > initialization sequence"):
> > 
> > > ehci-platform 1e6a3000.usb: USB 2.0, controller refused to start: -110
> > 
> > The error happens because USBSTS.HCHalted stays at 1. But if I ignore the
> > error at probe time, the downstream USB devices can still be enumerated
> > without problems (even though USBSTS.HCHalted is still 1).
> > 
> > My questions are: why USBSTS.HCHalted stays at 1 on ASPEED platforms? Do
> > we need extra configuration at EHCI probe time for ASPEED SoC?
> > 
> > CC Ryan @ASPEED for more comments.
> > 
> > 
> > Cheers,
> > 
> > Tao
