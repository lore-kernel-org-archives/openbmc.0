Return-Path: <sjg@google.com>
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vf4X4YzDqBP
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:11:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e/ontVyA"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="U5HK6MoM";
 dkim-atps=neutral
Received: by mail-ua0-x229.google.com with SMTP id q26so5284222uaa.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sRjrFhYoM4UJVxrlybmogtO9wfgE9mA2Fs7glgZkCAk=;
 b=e/ontVyAg6NBPaxm61wtEkU00DPGuTVgJ4A4beRsfbjnaBNJ6dKgbCM4E5m7kWZXRO
 xVukDX/IarYQ0ui5ZVBvOB3Gn4WiTbxQYScz1yB05j1xI72FSn+uEp/wTFrcvWWcd3N+
 UrmjIWdohIIFT+LeKMysgFGNTCm118exxIhlybC33YMFEJDVKKei0iamgxyPk6h1tGLm
 cjpDs4gUfhRjooiRXKmZHBBR5LsXcB3mDL3YgQmKD0ycY+TH5y29d6evkN90ZLczjX+e
 wAJ6PrIaCHAUHajNCOD6Y7BYYkm8f8CA+texCvNSHTQDHedd2z8rqC+D0bT0DkHFZbRh
 GEmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sRjrFhYoM4UJVxrlybmogtO9wfgE9mA2Fs7glgZkCAk=;
 b=U5HK6MoM8RgAw/BfSxotiTkab4Tc0kshHl1wKYJYcRVAjvp0Qq6Ag+wVIWXl4qYvik
 k9N8pLwRTXwUJBNW16hiSNPqJXCzVc2AQA4n1PBkBsMqkrZgOl10DpuyUhL1if4DX14e
 QbFL8X5IaxrfAyWf2U4i5333m/GAcx/0l5dc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sRjrFhYoM4UJVxrlybmogtO9wfgE9mA2Fs7glgZkCAk=;
 b=kNxr9uJAmttOCmw0l47JvyhpM1VYCF2OWyRacVXGa20XPnKnhaBGhb4Jlrksre2hEC
 UGsx4ajiKQMdY3Qlsg1R3nhoS5+2UbfaBr4GS+54QUFxUOTPSTTZMTK3yAztF6FcvUpa
 voAxzo0TwN6ghboaVMtBcc+bDxdPn5PHKjHVzANYOEwBIteb3n17f6Jt0EwOybZmeKXP
 ie5DjFD0H87O2zQ2kvAZIv4O4ZxfvCPKOfaW0/LFXyrcQ+CXihF7ZW0fkI1YR2ALabH7
 XTrIDFQuBb9Zy+/j+O9E/6tc8epv6GDBoJpmvLHfOAT46PVpEb0OhacyMaiElagZL6gm
 0N1Q==
X-Gm-Message-State: AN3rC/4OlTGz4vIoP/Red0VGY9kR4+NqkzVVfUvMf1qMB5HtlLpYY9uX
 CqfRyMPQSAsdd18NeYyjb5rbFTqhVYhe
X-Received: by 10.176.4.117 with SMTP id 108mr38002uav.134.1492560712167; Tue,
 18 Apr 2017 17:11:52 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:31 -0700 (PDT)
In-Reply-To: <20170417190034.71945-4-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-4-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:31 -0600
X-Google-Sender-Auth: vxsFVvGo9W-mnrqNaenG1H4FYoA
Message-ID: <CAPnjgZ3itH88h7sHFJZ6j6WztMk0FDgfxxrkLz2fY8d2t4HjBg@mail.gmail.com>
Subject: Re: [PATCH v1 03/15] aspeed: Watchdog Timer Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 19 Apr 2017 00:11:55 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> This driver supports ast2500 and ast2400 SoCs.
> Only ast2500 supports reset_mask and thus the option of resettting
> individual peripherals using WDT.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
> Changes in v1:
> - Rename reset to expire_now
> - Rename restart to reset
>
>
> ---
>  arch/arm/include/asm/arch-aspeed/wdt.h |  53 ++++++++++++--
>  arch/arm/mach-aspeed/ast_wdt.c         |  40 ++++++++---
>  drivers/watchdog/Kconfig               |  11 +++
>  drivers/watchdog/Makefile              |   1 +
>  drivers/watchdog/ast_wdt.c             | 125 +++++++++++++++++++++++++++++++++
>  5 files changed, 217 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/watchdog/ast_wdt.c

Reviewed-by: Simon Glass <sjg@chromium.org>
