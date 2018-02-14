Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zh55k4hdrzF1FP
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 14:50:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="dGreMf4K"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3zh55k0cf0z9t2x;
 Wed, 14 Feb 2018 14:50:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1518580218; bh=R5nekzzPYaR53/4SO8T9E7xsQQJmTGhDN+awohQnQRc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dGreMf4K/j2VM8Fd6SdDQzA5u9g7cIC2X1C7UMTs/DE8nV9ZRLalFI1MDO6jhtLd8
 Ka7rlxC9FQD1/oETsyujxcQvzO5QQNb00zvI6wXKBSbD1P9VfBFAMn4CqaeGwDvTnF
 6OZ77TEV0bagAgNVsoxHxuQLUqC7blEvgfrgG6cpgeKGxQFX5LjAcYOksXjNqDvwii
 dvBftY2+Emj4CEj0P++XZWzZ7PjCJanQsht3pl4vAX3Q3f0xdoilb2ap6mWCrL1Jop
 2OJ1rqoXb/YYPZ/PnO6ESky83nTU5sNJWQif9MpUYazqPT/TRQcZPJJdBc4rfbmRbP
 V2Gz6WMD1wdBQ==
Subject: Re: Serial Mux Mode in NPCM
To: Eugene.Cho@dell.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Brian.Berry@Dell.com
References: <599c29f92c5e4849a7c30820442d8f7e@AUSX13MPC105.AMER.DELL.COM>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <ad550452-8cfd-a9aa-464d-4c6efb1b8681@ozlabs.org>
Date: Wed, 14 Feb 2018 11:50:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <599c29f92c5e4849a7c30820442d8f7e@AUSX13MPC105.AMER.DELL.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
X-List-Received-Date: Wed, 14 Feb 2018 03:50:19 -0000

Hi Eugene,

> Any thoughts how we should handle the serial mux mode (SPMOD in SPSWC)
> in the NPCM? It seems we need to able to switch between modes runtime
> (as these are customer configurable options that can change at
> anytime). 
> 
> We use almost all the modes in some fashion...  
> 
> Could this be a handled like the 8250_aspeed_vuart.c? Maybe another
> simple sysfs driver? Thoughts?

Code to handle this would not be suitable as a UART driver; it handles
more than a simple UART "endpoint", so we'd need something distinct from
the existing tty device here. Perhaps a separate SoC driver?

However, you may not need dynamic reconfiguration of the UART routing,
depending on what configurations are available and your requirements. If
there's a routing configuration that feeds the necessary UARTs
(host-side and external ports) to the BMC CPU, then obmc-console-server
can handle all the routing in userspace, and you set that HW routing
configuration once on boot. This is what we currently do for phosphor
platforms.

Regards,


Jeremy
