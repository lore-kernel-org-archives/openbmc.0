Return-Path: <SRS0=7r8K=NI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D54C4338F
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 00:03:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A33960F22
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 00:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A33960F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpWSr0jMGz3bXt
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 10:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gpANUohh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gpANUohh; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpWRZ626Vz303t;
 Tue, 17 Aug 2021 10:02:01 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id c4so6416437plh.7;
 Mon, 16 Aug 2021 17:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=78YHZHnJSjDKWg8zjTZj0BCLoUOSU1vHhIJ7lXSskDk=;
 b=gpANUohhW5ovntoe5a6jBaIVPw2LBbR7fbbt73KQZgAs0ckFkkw2W2WCF4C6rjRWoJ
 N72su3YB9tQUFR13DjKz5C0qPCcZ5XGFvTFE6ZKpXS69a8JeSeJjhZuVwMwmDjukcfYx
 eECKeiwLw5dIpPKYIndQMOzcfWVr6sKOweM9DOo9jA7Rz/mojP0HPvcch+W3U+IdShot
 nhkg09h/sO6GvsJwxHVTY2Nf96gNxxfHJUGKWF//3YCcND23x4WHW9pFC50LNrRNFjQA
 jS9wqjaPWHsiBhySp6/pOHJOLJMDb4sjJFHXSzXe8G/tzlk6tIsgUNVPdWmNhs5/PbbV
 llAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=78YHZHnJSjDKWg8zjTZj0BCLoUOSU1vHhIJ7lXSskDk=;
 b=YhGRc4YxIzzv3UBXivMizEU/mrkGhYi+DB/Jndxc2Dg1OXe3wZ8lXF+d4qwgVUkHSq
 IkSsg8AT6jGvzslP27TlZ51/hyYDK8+M1ko8TJE/Pm1J/PJqZmCHg8tI+wJEWv3hy7LM
 yIn4TnR0thenauEEaPKQtiQC1sEVMsZSmVjwNu+sLGFNlTbSrGcGErndgQ2ueNF3caOs
 OpRj3KDPhRzaBFKvYO7rHRQmRZs+aEhNeOMxtko2yVX+ie/gaeFZ70IyV0OiruIo1RF/
 K0oIhwj6XLWta4DI8jEQkJku4gIQE59iRnpFMNtGabzUA9RtKRnk9t4MI8iS/SYsU4qp
 gogg==
X-Gm-Message-State: AOAM532fWCqjS6tbNV9fNdTwH+hRoTyIgoSML/GVJCGFh7OIgMdWnC7E
 IVsLOrTmj4BQX9LEppqzxvE=
X-Google-Smtp-Source: ABdhPJz8QcDhSLV5QJ2of0M+kIIloIKlQbjPLtgWVbRmX9qZFVxr85khXu2QMr15qvlR6/rQmhhl9Q==
X-Received: by 2002:a17:90a:e88:: with SMTP id 8mr489071pjx.108.1629158516781; 
 Mon, 16 Aug 2021 17:01:56 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id k22sm260946pff.154.2021.08.16.17.01.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Aug 2021 17:01:56 -0700 (PDT)
Date: Mon, 16 Aug 2021 17:01:49 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 4/6] ARM: dts: aspeed: Add Facebook Cloudripper
 (AST2600) BMC
Message-ID: <20210817000148.GA7547@taoren-ubuntu-R90MNF91>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-5-rentao.bupt@gmail.com>
 <CACPK8XcV5On2D4D+SXnfw1M0owwfCL4Su19jOEA7yWpq+T3jLw@mail.gmail.com>
 <20210813034016.GA21895@taoren-ubuntu-R90MNF91>
 <YRaFpq1LvRzMYr/A@lunn.ch>
 <20210814052228.GA1298@taoren-ubuntu-R90MNF91>
 <YRfgv5OknMluW7jj@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRfgv5OknMluW7jj@lunn.ch>
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

On Sat, Aug 14, 2021 at 05:26:55PM +0200, Andrew Lunn wrote:
> > Thanks for jumping in. We are using BCM5389 and the MDIO bus is used to
> > access BCM5389 MDC/MDIO interface in Pseudo-PHY mode.
> > 
> > I didn't know drivers/net/dsa, but let me check out the drivers and see
> > if it works in the Cloudripper environment.
> 
> The b53 driver knows about this switch, so please make use of that
> driver. See Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> for how you describe it in DT.
> 
>     Andrew

Thank you Andrew for looking into it. I will update dts and send out
followup patch after validation (perhaps after v5.15 merge window).


Thanks,

Tao
