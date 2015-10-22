Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A1E081A09AC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 10:47:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aJSRZ8i6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=dhi50v8Q; 
 dkim-atps=neutral
Received: by oiao187 with SMTP id o187so57061288oia.3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 16:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=ujtoCLDm3GojTOnnyxHDb/milhBuoLwzikFZQiZKp4k=;
 b=aJSRZ8i6OP9MN2J+Krr0mgRCrJExg781IT131K38js1b856L8OQ2xG9xgsMFGOFo0Q
 gNBMyJedZhMlUbDaoQscLcbhP8DxIb3ci+SSV9KBHYgeDGAwIQGEJzLhbAb4qLEa/V7/
 YcDtIpeVJiULrzYwAIknw8PX8BulPKlh2fv5Gzv4ZXvjGzVks9G7peLn4DciVlMu2q7t
 yNRGBNZfivDeWwq2d49Msv5++ubhIxgPqta9FPVvH5nVFR/NRGAFCfDwZUTewc59oWw6
 o0i7vEDHdOdonRS61rP6iqDyBAAOVpK35TJxdEPH5oPPch2a9lVDm6QmTD5/0Y92vso5
 cFeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=ujtoCLDm3GojTOnnyxHDb/milhBuoLwzikFZQiZKp4k=;
 b=dhi50v8Q8ZIftwFNSlRNNW+ndVxrhVGt6TVB5NUyRDzkH67Gzj2J8W9XaLqclkB/po
 zEr8qUgAJeNU2QaLMHyZtBfRM1hQcIeFQLJ2YC0LwWFs3p2FDJ/8v7VhW6k6FBvmKJvP
 k2zAjA6zsm1pcHSurKVegfKZFrcbFVf/ozZCw=
X-Received: by 10.202.80.67 with SMTP id e64mr12246078oib.125.1445557666930;
 Thu, 22 Oct 2015 16:47:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Thu, 22 Oct 2015 16:47:27 -0700 (PDT)
In-Reply-To: <1445536779-14516-4-git-send-email-patches@stwcx.xyz>
References: <1445536779-14516-1-git-send-email-patches@stwcx.xyz>
 <1445536779-14516-4-git-send-email-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Oct 2015 10:17:27 +1030
X-Google-Sender-Auth: 8eZ6JS-BpjqW2MS91U4o4ghkAyw
Message-ID: <CACPK8XcFkY4w54u2wQvAE4-sjzGohvvutT_BZhMqJ_jCcHBMPw@mail.gmail.com>
Subject: Re: [PATCH linux 3/3] watchdog/aspeed_wdt: Set system reset mode to
 'full chip'
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2015 23:47:53 -0000

On Fri, Oct 23, 2015 at 4:29 AM, OpenBMC Patches <patches@stwcx.xyz> wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>
> Currently, the watchdog timer does nothing on expiry - the 'SoC system'
> reset type doesn't seem to have any effect.
>
> This change uses the 'full chip' reset type instead.

Do we understand why this resolved the issue?

The previous code was working before, and the BSP from Aspeed uses
WDT_CTRL_RESET_SYSTEM | WDT_CTRL_ENABLE ( == 3) for this register as
well.
>
>  static void aspeed_wdt_enable(struct aspeed_wdt *wdt, int count)
>  {
> -       u32 ctrl = WDT_CTRL_RESET_SYSTEM | WDT_CTRL_ENABLE;
> +       u32 ctrl = WDT_CTRL_RESET_MODE_FULL_CHIP | WDT_CTRL_RESET_SYSTEM |
> +               WDT_CTRL_ENABLE;
>
>         writel(0, wdt->base + WDT_CTRL);
>         writel(count, wdt->base + WDT_RELOAD_VALUE);
