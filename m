Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx50b4n1SzDr1n
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 20:30:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8QJcjjP"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id f200so1550418ywb.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 03:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tvh5of/XShtNP7+n6WMwDqKmDAyNcdHxufB4/ok6p/o=;
 b=f8QJcjjPvqJnAcjMVhflBAc2eTn7GIA/e45okRX0T2xRjGGuoYvUY+ECVRKRQfUGNN
 t7bXQMkVCl0mR9otoS32gz5cCWzE/4pAYeZ8R/tilK0n9/b0NLI95L7Wq1nTgMXOe2CM
 YZkVc4l7ICOl7ScjSaE5ytAlWcfIls86YXfh3UwSG+JLueJ0EaKw/bqe1uytutr2TcPw
 L/4tiCu+QuOV4sppjTLDH5AgtLAy+RfFlDYmqyUexAs8fB3KGme3odtIfvHVcOjwjjP1
 bkuWKZa7OekHv7FCdeUs6VTLjNdClhRFW0vc9bFGWK03Rm7EuN1RROMKlBc76ILQVL8N
 xiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tvh5of/XShtNP7+n6WMwDqKmDAyNcdHxufB4/ok6p/o=;
 b=qwO/v8yBXEus+b0o1OmPI0yOEdYEA1DNz3S2sVIb7xecI9jlFPYktTLroOTSEPNUwt
 syweuVT2hTY406VFyGw8IW5wbQC1yqncc6WGhZIDpSE0iEw9TWtOq+yvKauWb/hjkh5m
 jGngYgyNmz8bQVOUAsGWizJjin+WCpXZyzwmSp1OSQKTR7o0G+9ozPjWoN9Uahg45U91
 lk51AC6jagvZX+SFSDWy7A6TQ684cN3oyVwyvnCIWaYK/KbcJdKiyf5dtMUadbTbdIY6
 ui5OahXRxSZTTvQyaLcuG5P8nxem4RmoDaTuyrI+vtAUyPI3ihBhg54BzS/Xta8/YGDb
 gCHA==
X-Gm-Message-State: AKS2vOzZg9DHBJm9nCN9EUaCqvA/7hXgE0hi57Dq3VLhbl2zE8P4MCR4
 H41UAvAcODhum6NCfRgcig4ez5siFw==
X-Received: by 10.129.52.148 with SMTP id b142mr13121203ywa.164.1498473005416; 
 Mon, 26 Jun 2017 03:30:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Mon, 26 Jun 2017 03:29:45 -0700 (PDT)
In-Reply-To: <20170524152820.43150-1-c_mykolak@mellanox.com>
References: <20170524152820.43150-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 19:59:45 +0930
X-Google-Sender-Auth: RwDsMK7hkl84VlJHllf5ETXRBRM
Message-ID: <CACPK8Xfyi=8+ae8TduMnkuh=L11DjWiRUnS82ZJLybVNJQVv7w@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add WD2 reset support for
 ast-g5
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 26 Jun 2017 10:30:08 -0000

On Thu, May 25, 2017 at 12:58 AM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Add support for WATCHDOG_RESET macro for aspeed g5 boards

As I understand it, with this change we can have the watchdog enabled
from boot but also have u-boot pat the watchdog when dropping to the
console?

This is great!

>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Merged to v2016.07-aspeed-openbmc.

Cheers,

Joel

> ---
>  board/aspeed/ast-g5/ast-g5.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index da79d7b79a..412b632a41 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -46,3 +46,17 @@ int board_eth_init(bd_t *bd)
>          return aspeednic_initialize(bd);
>  }
>  #endif
> +
> +/*Called by macro WATCHDOG_RESET*/
> +#if defined(CONFIG_HW_WATCHDOG)
> +
> +#define AST_WDT2_RESTART_REG 0x28 /*WDT2 Counter Restart Register*/
> +#define AST_WDT2_RESTART_SET 0x4755 /*WDT2 Restart Counter programming value*/
> +
> +void hw_watchdog_reset(void)
> +{
> +       /*restart WD2 timer*/
> +       writel(AST_WDT2_RESTART_SET, AST_BASE_WD | AST_WDT2_RESTART_REG);
> +}
> +
> +#endif /* CONFIG_WATCHDOG */
> --
> 2.11.0
>
