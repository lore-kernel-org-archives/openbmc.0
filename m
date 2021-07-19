Return-Path: <SRS0=S/TR=ML=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E57C636C8
	for <openbmc@archiver.kernel.org>; Mon, 19 Jul 2021 01:04:30 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F8DD61004
	for <openbmc@archiver.kernel.org>; Mon, 19 Jul 2021 01:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F8DD61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSkC06MLYz306Q
	for <openbmc@archiver.kernel.org>; Mon, 19 Jul 2021 11:04:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pLeL5RFZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pLeL5RFZ; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSkBP4Y8Fz2yMP;
 Mon, 19 Jul 2021 11:03:56 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 62so17409939pgf.1;
 Sun, 18 Jul 2021 18:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MRCpTY3XLrkorIsL4Kd4E8S+WPJpKt1Ijbch/c1mGOQ=;
 b=pLeL5RFZQiIgbIb2XQoVgv8uvI77if3Uj5JFRnwbFAlDIvZ6DVgb92hr749pQ3rTu4
 K+f0/0I4BhRB6RAOIgcb/034/r0I4L92qWznyCKnSYv0bSWd3avYuiP3x9Pj7M/f/XE9
 FL32Zw3JcnHg3kbmeSxIsYKbxIliwRd0I4BJKdK7GQXPnCaL3cZNlxgquVE+IZ6XGiJC
 mjU8+GyNBkCPgX4p7j1zrXrC1VtK9MhqMyXKAjZI3MrFH010qXXWoLeGb57IW3N78jyF
 VA8LVoj3pNz/5+vt23j0jLm2coyI4xHbbHhPlMp/DX/dsSYDUL3tvqVaIOTGoDKxaYIU
 TP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MRCpTY3XLrkorIsL4Kd4E8S+WPJpKt1Ijbch/c1mGOQ=;
 b=Jno+VxPyz/sStXzRpSxdirSt8wV6Sod4K0E0t7kC1dFylWxn2tWDsrPRu7H8m5n2pD
 Id4sXQ7lCjW3ugL3GHU8csH9roXTZvLAQgDvdzETJCjmIBR1pH8DbbL7homJWAQ4NRNd
 Z41QFNT9IAN752KTAYeeoYZIoYF9s4Dq1fx4k0/6+e0owyY2ZlI+68OL8g4zrQ3ny6bH
 ZYZB32/QBX+FmjfRCjY62A8xwAnMVCoxHFOix3XnFFQrq/w49ByQ6kMPTxN5E415q2oZ
 5fGsjAunuDCarnbpJUqcn3+Gf43D7ZFDq6YC2Q+X3uQk1W/j0uC6GQPTdIRnf1pSL7pn
 CfDQ==
X-Gm-Message-State: AOAM532vyITWl7NhXLy3HT853CtYy0rG0eX7GHy1DR0IDKsZASK3Ym7Z
 fwM2BqxoUrpi/CLP+ZB+Qe8=
X-Google-Smtp-Source: ABdhPJzrBWV4/Ba2hzqbP4/NkJLwwHvjBXXwfmNYZnM46wPk4JxF6EfjTOKcrVuXzaMYqz1kTACCcg==
X-Received: by 2002:a65:6217:: with SMTP id d23mr22426920pgv.105.1626656633335; 
 Sun, 18 Jul 2021 18:03:53 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id il13sm11365330pjb.7.2021.07.18.18.03.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Jul 2021 18:03:53 -0700 (PDT)
Date: Sun, 18 Jul 2021 18:03:46 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Enable ADC for wedge100 BMC
Message-ID: <20210719010346.GA6817@taoren-ubuntu-R90MNF91>
References: <20210719001724.6410-1-rentao.bupt@gmail.com>
 <CACPK8Xdgp50KbVvhSbhrwUiTB6MJ5PoBzV9n18ubZAAOprOGiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xdgp50KbVvhSbhrwUiTB6MJ5PoBzV9n18ubZAAOprOGiw@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Jul 19, 2021 at 12:21:20AM +0000, Joel Stanley wrote:
> On Mon, 19 Jul 2021 at 00:17, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch series enables ADC for Facebook Wedge100 BMC platform.
> >
> > Patch #1 enables ADC in Facebook AST2400 common dtsi because ADC is used
> > on all the Facebook AST2400 Network BMC platforms.
> >
> > Patch #2 removes the redundant ADC entry from Wedge40 dts.
> >
> > Patch #3 removes the redundant ADC entry from Galaxy100 dts.
> >
> > Patch #4 enables the ADC voltage sensoring channels in Wedge100 dts.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks Tao, I will apply these for v5.15.

Thanks Joel!


Cheers,

Tao
