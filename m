Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsTkQ6TdRzDqC2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 09:50:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GTbRSfCR"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id k13so77631ywk.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9bVn9nwLtZ0QAJmr/AHKZibuWWQz0NU0usjzmQJxta0=;
 b=GTbRSfCRnrq/yTAZ+3jArFHgAchaD65zeXGOJ35otrzygG5Th2LNalPla89kmM7ctp
 NhsGDl/7TywBq4x0d083z3vq8MUwUf8yFAx3IFepo8oX4gFcj6jkRd7XkoKbch/Z6gd+
 TVevXxOc1pY8aOqK9LFNeZUgiyf2CPXc+2nq8JmKAvVgBqHe0vkgTYhThzzDvkJ+dUZ7
 D//wmc2Le3yTxFWhStKBfkzvvCOLAZJwOHgb6XMVX85AZZwfwP9k3/jP1tf+XqVwnzZE
 9UAMehTzqShiz4iQM7GWtqoaBfaz2g9Du1nckGW5N4GSmpyfJui6jX/eJo42RUuTqo4B
 ZZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9bVn9nwLtZ0QAJmr/AHKZibuWWQz0NU0usjzmQJxta0=;
 b=LssC5s/qiGZo7Sl20qJDjK8wFbiOonbkaisyFzkPXN1xbfToP/9cO7bKFx8arEkn3J
 JMW5mdRZLTkb62+utY6W1gj4PTtaINjtmbFNpK+B4LVujhbp9/5an5rJOg6C2mDjL+8R
 mQszwXyl7DYh7Iwpi0qi1NEW0TncWB5uZu6hat+Izj8SRGezasO9BeHVJGO2flCGl8Qv
 Xo34F5lDyOLqWHVWq2PpbrAfdw7gcsivUTmlawmzf/rZPKIKEaJd8eZAbkdSAH/mvsB4
 RzJXvRKXnKfYLxB9nuuuhVU680Rqf4whqfji8OPxTvPszUbUfQRGsI0Pm00rnAvSwhj7
 GpFA==
X-Gm-Message-State: AFeK/H3ViPg7iu8TVbeo0PGklIQz2O5u8cXlCMbDze1lwcKUO46/T1zkOY+39aSVQkj2VtE0fa2Ehke6WKXsEQ==
X-Received: by 10.129.71.198 with SMTP id u189mr19934786ywa.174.1490655004506; 
 Mon, 27 Mar 2017 15:50:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Mon, 27 Mar 2017 15:49:44 -0700 (PDT)
In-Reply-To: <20170324013906.24050-1-joel@jms.id.au>
References: <20170324013906.24050-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Mar 2017 09:19:44 +1030
X-Google-Sender-Auth: ULkaD3L6I0TOVkbMrwHsv5JinPo
Message-ID: <CACPK8XdECCqgqXgMQnx2e+fSYxHUtRVZG8Ct9ZoByCBU+oBVew@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] tty: aspeed-vuart: Add IRQF_SHARED to flags
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 27 Mar 2017 22:50:07 -0000

On Fri, Mar 24, 2017 at 12:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> All of the LPC devices share an IRQ line. When other LPC devices (such
> as the BT) have enabled IRQs we receive them unexpectedly in the vuart
> driver before it is ready.
>
> And the IRQF_SHARED flag to the vuart driver so we ignore interrupts
> until we are ready to handle them.
>
> Reported-by: Anton Blanchard <anton@samba.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/tty/serial/aspeed-vuart.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
> index 020c8159d25d..42ccb380af41 100644
> --- a/drivers/tty/serial/aspeed-vuart.c
> +++ b/drivers/tty/serial/aspeed-vuart.c
> @@ -238,6 +238,7 @@ static int ast_vuart_probe(struct platform_device *pdev)
>                 port.port.line = rc;
>
>         port.port.irq = irq_of_parse_and_map(np, 0);
> +       port.port.irqflags = IRQF_SHARED;
>         port.port.iotype = UPIO_MEM;
>         if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
>                 switch (prop) {
> --
> 2.11.0
>
