Return-Path: <sjg@google.com>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vt4h0TzDqC4
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gLVthw47"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ASONIX4i";
 dkim-atps=neutral
Received: by mail-vk0-x229.google.com with SMTP id q78so4481173vke.3
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lbFIE7ehtohZy1I2yQbA6r4U2wUYDapPqQeLQH7PAAc=;
 b=gLVthw47CDKPyMSjvFmdVEIBDV7ah0qtCojtcj51edOYkxmxxEqJjyzOI0GBVRxaQs
 gJPy9komullVxiz4HMDbb8DWwQAWvt+GEpW78ZALV0BK3vCr4Ly+TBXTU8MhZAkUTkHE
 PEREryIYTX7XOz8p/zMmn77bH8LWOqyc/vtjDJJELf+qXqDcMSy/LWqhbcKJqcY23CMh
 whb3vc8udhmFEeSF0bbYUudJmf5m0ulNrMUGFZuxPfQGmF9JEGYeQpSAdla3ESWFFp3u
 DcO0NkCrp0c/f83Sb9nrSPNBRcrAu8Xg/p2FSMz6Tv7bBOgf7dZ6PrjkDIhL332savqC
 u1Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lbFIE7ehtohZy1I2yQbA6r4U2wUYDapPqQeLQH7PAAc=;
 b=ASONIX4in2hKDwhXIPek/dnKciAvxjL7Gkptwaiopc60HSVsCN6sG0D7o+8ohrvsWu
 wnoX5hO0j59dVSmrtctwuWy0QWa1dk35pmD3DNqv9eypNbmOi1GzXlYrcpF0VxgqgH33
 o2d3rdLlOIa8Z6RjhHbrklo9qo82+b7XJ/oeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lbFIE7ehtohZy1I2yQbA6r4U2wUYDapPqQeLQH7PAAc=;
 b=qBaQbkfQgAf5yUtZL3cA/6GpwSjG7pbXcWKxkGNff7RgJQsQNunE234wNBcKOGtgAu
 AJeMIkk3OSVYXzyV20Zzh2dZtUw6jNJuJwuaw7dX95ntP1N4tEJg6PpL+U1gzklhf3Qi
 R8qDjEoqcon2TDgFjtkJ4feGmrkP4WOc/DsbBLNqnREtfYlsYw9ywMBSo0HzrOHBzMnC
 OuVS8RAqKiA3EQJ7Yw46iEYJ61SN20GHsaOsi5LRbN/QDJnPhk+oSvbJb5MeUZl1zNnn
 UBf694SWsYBTp/vPh7ya7bopQTISIFMryTSflb4yVnyo7Ftg0hN9myQlUtsrWYgvSLwE
 skcw==
X-Gm-Message-State: AN3rC/6KQOK84pmToWx3ZBqylvXIKoUYcYnSvjKgzrRCxHw/BIG2YYVH
 jj0u6PlVNkNE69IOyjf5KZ763HMl70KK
X-Received: by 10.31.233.131 with SMTP id g125mr49511vkh.34.1492560724131;
 Tue, 18 Apr 2017 17:12:04 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:43 -0700 (PDT)
In-Reply-To: <20170417190034.71945-8-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-8-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:43 -0600
X-Google-Sender-Auth: u3iBG048riHvbi6zLEN__y35B5M
Message-ID: <CAPnjgZ3jTtwUGepTSc8SaMp6i-rf9GvR8yEo+n2waaZXMiN=Jg@mail.gmail.com>
Subject: Re: [PATCH v1 07/15] aspeed: Refactor AST2500 RAM Driver and Sysreset
 Driver
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:07 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> This change switches all existing users of ast2500 Watchdog to Driver
> Model based Watchdog driver.
>
> To perform system reset Sysreset Driver uses first Watchdog device found
> via uclass_first_device call. Since the system is going to be reset
> anyway it does not make much difference which watchdog is used.
>
> Instead of using Watchdog to reset itself, SDRAM driver now uses Reset
> driver to do that.
>
> These were the only users of the old Watchdog API, so that API is
> removed.
>
> This all is done in one change to avoid having to maintain dual API for
> watchdog in between.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
> Changes in v1:
> - Rename wdt_reset call to wdt_expire_now
>
> ---
>  arch/arm/include/asm/arch-aspeed/wdt.h       | 39 ---------------------
>  arch/arm/mach-aspeed/Kconfig                 |  8 +----
>  arch/arm/mach-aspeed/ast2500/sdram_ast2500.c | 12 +++++--
>  arch/arm/mach-aspeed/ast_wdt.c               | 51 ----------------------------
>  configs/evb-ast2500_defconfig                |  2 ++
>  drivers/sysreset/sysreset_ast.c              | 24 ++++++-------
>  6 files changed, 24 insertions(+), 112 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
