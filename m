Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x233.google.com (mail-ob0-x233.google.com
 [IPv6:2607:f8b0:4003:c01::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63EED1A006D
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 16:40:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BBarWpyA; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=YPr3sxX4; 
 dkim-atps=neutral
Received: by mail-ob0-x233.google.com with SMTP id is5so13492417obc.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Feb 2016 21:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=dMHJ7b1ReIScRj5t6iVk8xCXQPsH0oSq22GCguGDDb8=;
 b=BBarWpyApb/gbJwT94lzDhvY+c+U+m90Qr/JeaKI7RqZ+GQsFOhyUJDmwZtNeW6Lhf
 N0n1ucewgroJbpMTKTHbj+BskFXS93tfzNy0tLE2dhhK5MGt7bPJtSD9flgQHs++7FkI
 C5FJFceGu7+A9bssJNJip/t15knLFiq5iv2kwOmZpiKXkWo2Z6usidObmlauvoo7wZBD
 jifsbfnWZYYT9Dc8be0aYifCAw9nfHFQ+HxOR5Y9QimWI3woGp+GmWe6FPJ5vtcllIcG
 A7tTVwYGnVXPLhkVF0+5nLEHHbKiz5bYnbRjqHTin1K5BSuGfw4E6wUxJ4Rq2sijmC75
 KIig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=dMHJ7b1ReIScRj5t6iVk8xCXQPsH0oSq22GCguGDDb8=;
 b=YPr3sxX44woswGCu12Uv4mWbFNo/1AOmzxIfSY9BP8EjXQapMifGSASA6/bDmIj0qK
 cSAuqs2J0r7C0c7M811fqRrFb7G5aDMDWikFw89dVZDiqRLs1RerPmrUXcI4TnlmYQHb
 TNXmWoWKOAOO+COa0QBpPqW4v9X8C+o4vZJwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=dMHJ7b1ReIScRj5t6iVk8xCXQPsH0oSq22GCguGDDb8=;
 b=KC+XGv77t9c7uU9h9dM9U932uSr49ak9RZlbL3MK8xprug1qVP+pYK3ikmVIcO+4Qy
 Xu9v8d8MFUGayQbva2OS0kZ4cz8wstkyksjfV0lXGE3xjBhgkBoAEDWT8DDYgNaxQm98
 FM3sr7K7xCIvXLl2OUP3Hcj4/8d/eZM/fouLKlXl6l3oGXk541IvX31X6yuCOFfkv8J5
 FhqZo9rM9XiJ9xnONqj7YAtHyao1sIXIZbguNnAdJ2CFdNs9irJLTW7jsvks6YLjNaA4
 JS6ZUhA0EYjcfvelXlCgf+f6w/I9/CqqxyDCHhiupT4qC+XUcEITOO03kHMVkIpT3Unl
 fGnw==
X-Gm-Message-State: AG10YOR0lpQe1fvDLXckGh7G7t5d69541T62uyJv2kJzFVaf4Fd5Jy0thCF0sQ6JierPK5bWGhgru3SFHGaWTg==
X-Received: by 10.60.125.7 with SMTP id mm7mr20488906oeb.18.1455082821079;
 Tue, 09 Feb 2016 21:40:21 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Tue, 9 Feb 2016 21:40:01 -0800 (PST)
In-Reply-To: <1455027957-9524-1-git-send-email-jk@ozlabs.org>
References: <1455027957-9524-1-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2016 16:10:01 +1030
X-Google-Sender-Auth: r4T9xN0luuuUM0B8lHIIprkzOCs
Message-ID: <CACPK8Xe4+YUnOc=+Qn75knMx+cFvpWx0V8QCeDiXO45Nxg_s1A@mail.gmail.com>
Subject: Re: [PATCH] serial/aspeed-vuart: Disable host TX discard mode during
 init
To: Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Wed, 10 Feb 2016 05:40:25 -0000

On Wed, Feb 10, 2016 at 12:55 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> If host TX discard mode is enabled, we don't see the LSR[RBR} bit
> getting set on new characters written on the host side. This makes the
> VUART a little useless.
>
> This change set this bit during VUART initialisation, to disable host
> TX discard.

Thanks! I've pulled it in; I'll push it out once I've given it a spin.

Do you have some notes on how you tested it?

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/tty/serial/aspeed-vuart.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
> index f1988dd..a56d3a9 100644
> --- a/drivers/tty/serial/aspeed-vuart.c
> +++ b/drivers/tty/serial/aspeed-vuart.c
> @@ -20,7 +20,8 @@
>  #include "8250/8250.h"
>
>  #define AST_VUART_GCRA         0x20
> -#define AST_VUART_GCRA_VUART_EN                0x1
> +#define AST_VUART_GCRA_VUART_EN                0x01
> +#define AST_VUART_GCRA_HOST_TX_DISCARD 0x20
>  #define AST_VUART_GCRB         0x24
>  #define AST_VUART_GCRB_HOST_SIRQ_MASK  0xf0
>  #define AST_VUART_GCRB_HOST_SIRQ_SHIFT 4
> @@ -143,6 +144,17 @@ static ssize_t ast_vuart_set_sirq(struct device *dev,
>  static DEVICE_ATTR(sirq, S_IWUSR | S_IRUGO,
>                 ast_vuart_show_sirq, ast_vuart_set_sirq);
>
> +static void ast_vuart_setup(struct ast_vuart *vuart)
> +{
> +       u8 reg;
> +
> +       /* disable TX discard mode */
> +       reg = readb(vuart->regs + AST_VUART_GCRA);
> +       reg |= AST_VUART_GCRA_HOST_TX_DISCARD;
> +       writeb(reg, vuart->regs + AST_VUART_GCRA);
> +}
> +
> +
>  /**
>   * The device tree parsinc code here is heavily based on that of the of_serial
>   * driver, but we have a few core differences, as we need to use our own
> @@ -261,6 +273,7 @@ static int ast_vuart_probe(struct platform_device *pdev)
>
>         vuart->line = rc;
>         platform_set_drvdata(pdev, vuart);
> +       ast_vuart_setup(vuart);
>
>         /* extra sysfs control */
>         rc = device_create_file(&pdev->dev, &dev_attr_lpc_address);
> --
> 2.5.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
