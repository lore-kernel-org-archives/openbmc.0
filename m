Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WzKUtEm5"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="e6xO93wl"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405Zx46LBSzF0Xs;
 Wed, 21 Mar 2018 14:27:20 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id j4so3952041qth.8;
 Tue, 20 Mar 2018 20:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xQ+2mZYok2JUSrFufA45GZ8gLckS1HiadXg0BXT/2x8=;
 b=WzKUtEm55Q5UuLOBifn5sks/JWvzGA4uCk9LWA8eo9EKwPp3ZLaPP4l2AuFx3FmmOI
 YHVAkZCACt6jgZzKDM6CF/AjHJyFKZLzAnsLI3jJ54YB+trCiunVT6odOXFxnYP980Jo
 fDSGIpSacu/edWm8Hw89kQ8BGQRL+gyndFQPYTMzJwnbcxmB6nlbIw1+bXLgb3Pn/7X6
 5Qi83ZbFb5pBKl047W3uK1yIap63EcAgA9qYUaSAkmVVFtBQmKrbtPHuVgfimd9X5NAD
 xuymEPEs2bPXoL1tR0SHxjGJsCp3t9K8Scw6T6BAthLG5neG5EN/WpTrezuCpwWeydjc
 3gmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xQ+2mZYok2JUSrFufA45GZ8gLckS1HiadXg0BXT/2x8=;
 b=e6xO93wl8R37IpTrE42UOZYVwMQHqoDT8QIC+rMSSgZZ5goobZ4w6az0EFTYIqS+jJ
 gV/dMYnOU539n1zrVLFYxHV0muRYNZ8ijvWmAx5oAL+QRKWOeM7YFocYq/Wp0k5AOFI5
 d83UfrLMVjTRLMHGDRyiVu/+imeSY/ivSj314=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xQ+2mZYok2JUSrFufA45GZ8gLckS1HiadXg0BXT/2x8=;
 b=rAEwG+XSX2ebV2/a3WlWvMnX1dEswr3e49Th4JMY+GYWUtl2Y0NOYZ7Yl7o54QuWnY
 EMKk8zEF4VY+2LehogyparorNr4HBq1pKO/wb4OnRJlIeumkyCLwWZEshNqwNAsiJL3S
 AU/EvBIEuOmIkrrtHPBxl4wZ7AFj0GizQmOTwbwuzdZnO6A8HZJI2Naaq3UOC8h8cTUP
 Ifso5ungDJpBtFBWJ/JTEUPUu6D9avZ3VCypRrVtmWtWcojVyYta6IBBF6F9e6Gn94mm
 /S1iFLAv9VDCoSkEx2Y8HVI5b2R0GgdLagEYrgVRL50waCZMvTJFHpPjpKl4PzCk0Qx3
 w8Nw==
X-Gm-Message-State: AElRT7GAO1t1uBeTZq1IHkx1q50T3jrCB66QGQiCiN4hKkzH3kNVVCOU
 zw2wYIug1RgxOkPHmV81fpuWfA5u3bZ9mN29W9Q=
X-Google-Smtp-Source: AG47ELsnWGJwJWnCSIEi5Tvz6LAYlLof8k+H8qCpK4ozqRe6eokQ2aJmo0KlXz8Djj15Cdu5/mtoCih5nrufr1rdSFU=
X-Received: by 10.200.57.132 with SMTP id v4mr27250518qte.204.1521602838055;
 Tue, 20 Mar 2018 20:27:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Tue, 20 Mar 2018 20:26:57 -0700 (PDT)
In-Reply-To: <20180321025241.19785-6-jk@ozlabs.org>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-6-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Mar 2018 13:56:57 +1030
X-Google-Sender-Auth: LQOBJ7KZL0JmRxeesbQ_uYGdqJc
Message-ID: <CACPK8Xc+BhX+8o3-z1tVWCc81rCnf5EBaFA8VqU64ywvJg6aZw@mail.gmail.com>
Subject: Re: [PATCH 5/5] serial/aspeed-vuart: Implement quick throttle
 mechanism
To: Jeremy Kerr <jk@ozlabs.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 21 Mar 2018 03:27:22 -0000

Hi Jeremy,

On Wed, Mar 21, 2018 at 1:22 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Although we populate the ->throttle and ->unthrottle UART operations,
> these may not be called until the ldisc has had a chance to schedule and
> check buffer space. This means that we may overflow the flip buffers
> without ever hitting the ldisc's throttle threshold.
>
> This change implements an interrupt-based throttle, where we check for
> space in the flip buffers before reading characters from the UART's
> FIFO. If there's no space available, we disable the RX interrupt and
> schedule a timer to check for space later.
>
> This prevents a case where we drop characters under heavy RX load.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 103 ++++++++++++++++++++++++++--
>  1 file changed, 99 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 50c082b4a1ac..bc2b63578e58 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -14,6 +14,8 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> +#include <linux/tty.h>
> +#include <linux/tty_flip.h>
>  #include <linux/clk.h>
>
>  #include "8250.h"
> @@ -32,8 +34,16 @@ struct aspeed_vuart {
>         void __iomem            *regs;
>         struct clk              *clk;
>         int                     line;
> +       struct timer_list       unthrottle_timer;
>  };
>
> +/*
> + * If we fill the tty flip buffers, we throttle the data ready interrupt
> + * to prevent dropped characters. This timeout defines how long we wait
> + * to (conditionally, depending on buffer state) unthrottle.
> + */
> +static const int unthrottle_timeout = HZ/10;
> +
>  /*
>   * The VUART is basically two UART 'front ends' connected by their FIFO
>   * (no actual serial line in between). One is on the BMC side (management
> @@ -183,17 +193,23 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
>         serial8250_do_shutdown(uart_port);
>  }
>
> -static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
> +static void __aspeed_vuart_set_throttle(struct uart_8250_port *up,
> +               bool throttle)
>  {
>         unsigned char irqs = UART_IER_RLSI | UART_IER_RDI;
> -       struct uart_8250_port *up = up_to_u8250p(port);
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&port->lock, flags);

The diff is a bit confusing, considering you just added these
functions. Can you explain why you did it that way?

Cheers,

Joel
