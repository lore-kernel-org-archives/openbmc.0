Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cF81+AJW"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXhMQ4jBDzF0Wn
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 13:51:30 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id d21so22195916qkj.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2018 18:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qqBcDvweRt+wR6hZjBJHY+mJ8POjYLqjpPlLZjmRwA8=;
 b=cF81+AJWSsUbFfOHmFKIxoZPBZnoyda31u7U1eLsXBewlT5RnOeLL8J+qjP2Ne/zOt
 aL8hDa4nT+BbdHU+anO1um9DEJ8OhULbvNeUxH3jFZ6fjpXvMTi7326oJ6I73U6d4ime
 8m+bhZHsj/TAyg0LeWROMqnaHw1d/3r3YbyJyyLhpfSINOr5is2B+RcF9X60xJ646Hup
 +Ty3a/dNETIjh2GTOgpNNFzUPu5m4BClFxpFTuomP7fUxxidJDyw5eYOa2keeFAflZZh
 TObN3EmN+e13nrUl1p/VQGUaBX7bCvfESbWK4H+0UvGWazK0w5VwebjvqkP/T+6t1z15
 BjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qqBcDvweRt+wR6hZjBJHY+mJ8POjYLqjpPlLZjmRwA8=;
 b=Mc1gCx/N9kNsdwiq8tjbKzQPa21+xrGXgFdEMTd0TvEXZschsrUUEyirSt3ilhLkac
 I5bWeGxqVJySdPH7uEYef+fbjLUmYyCemfyKzh+52HSERUF0eDafhLS6Ca+ro2zsNeR8
 bsv84lGAlPQ06Q/pM17txfGxtuR9SO4UwqrTJHCMfkaBE7zGlWvfLFvgcLR40GSkuE7b
 1z8WaWNiVwPjQ+5XeWtyPyYDeZPi9wO5ZNORKeSy2sDd0p3zIGXF9DkU4AXCmgMkaBFp
 R+hX4EI9aRPPH65fHyAVkscRQ/a3tGOoKah5T7p4EzDrYxkemTZM56RcLkYt63hszY50
 TMcQ==
X-Gm-Message-State: AKwxytenFMTAYc2vbVV0TP+sDXpuwyBbYsjaH6/GruTIamsXAb5kdKoR
 U/OyelD9o/zUCmjZbMu48Twfch9cF2HrfwGpbUw=
X-Google-Smtp-Source: AH8x2244dvLk9rkXIdQe4xSENq2nUNyR/gZTOT9H/ImMnOwPDDlaxhxuOpaowN+XshMMtxEiyjxV0XNCg2y/1mHnh9Y=
X-Received: by 10.55.198.155 with SMTP id s27mr12853875qkl.284.1517539887271; 
 Thu, 01 Feb 2018 18:51:27 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Thu, 1 Feb 2018 18:51:06 -0800 (PST)
In-Reply-To: <1516720600-2040-3-git-send-email-tmaimon77@gmail.com>
References: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
 <1516720600-2040-3-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Feb 2018 13:21:06 +1030
X-Google-Sender-Auth: H_5UixkF4rvNybV5gTCCi7CZIM0
Message-ID: <CACPK8XcznGkfjhhi3TB+pYYH_EsT0ehJdF944=iVfG-ROQnWcw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 2/2] serial: npcm: add NPCM UART driver
To: Tomer Maimon <tmaimon77@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 02:51:31 -0000

On Wed, Jan 24, 2018 at 1:46 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Add Nuvoton BMC NPCM UART driver.
>
> The NPCM7xx BMC contains four UART blocks and accessory logic.
>
> NPCM UART based on 8250 driver.

Nice! Much less code to review and maintain than before :)

I did some more digging, to see if we could add even less code. I'll
sent a patch to the list, but I need to clarify the divisor
calculation first.

> +static int npcm_uart_set_baud_rate(struct uart_port *port,
> +                                     NPCM_UART_BAUDRATE_T baudrate)
> +{
> +       struct uart_8250_port *up = up_to_u8250p(port);
> +       int divisor     = 0;
> +       int ret         = 0;
> +       unsigned long flags;
> +
> +       divisor = ((int)port->uartclk / ((int)baudrate * 16)) - 2;

The 8250 core uses this calculation:

 divisor = port->uartclk / (baudrate * 16).

Checking the datasheet, this is the calculation that is documented for Poleg:

 divisor = port->uartclk / (baudrate * 16 + 2).

If I change the calculation to this, the UART doesn't work (due to the
precision of the integer division, there's no change from the 8250
core code). If I subtract 2 from the number, as you do in your patch,
it works!

Can you explain what is happening here?

> +
> +       /* since divisor is rounded down check
> +        * if it is better when rounded up
> +        */
> +       if (((int)port->uartclk / (16 * (divisor + 2)) - (int)baudrate) >
> +               ((int)baudrate -
> +                (int)port->uartclk / (16 * ((divisor + 1) + 2))))
> +               divisor++;

This bit confused me when I tried to understand what it was checking.
I couldn't find a mention of it in the datasheet either.

Can you explain to me what it is trying to do? Do we need it?

Cheers,

Joel
