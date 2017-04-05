Return-Path: <andy.shevchenko@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyj1l6ww6zDqGv
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 20:36:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bE3dEXLe"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id r45so1027465qte.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GsV6cAilbb3X5VpzEL8UaJ4dGheI8v2fSMDmGt9aYH0=;
 b=bE3dEXLerEorjkCSHvDtyEzasXZhTLOcpOFDDvtDajs7F0N4mH4guKfYZ5Fi9k9+n7
 lysA6dWNrHfguDtQHO6O4saiDz5D4FOq6JPLogVUj0/hJO8QGJhtVQuyPBwBvvBHbvxD
 E5zzJuU8IQ5hFnRV4wqxD9903VDPa3OQkD2OZwyAB8Dy6k5Mv9Kv58NSjH81Qu7DGUQD
 gt4LozBdipV8pdlVctzP4rayEA+yNkIC2lJkcmDbEHCW8kv9bXFrjH5W9nhSOzuep8dv
 97dgqv/b+mMpZcCNiG5oHcovwMRHlw1/abr/Z22vmkAkrArI1BqrFptO/QsYF1hQr9yu
 9mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GsV6cAilbb3X5VpzEL8UaJ4dGheI8v2fSMDmGt9aYH0=;
 b=XLwg2lCuRUXfz3BuSMSCuLrN8zNCb+YpQ2Xwh45RrVq+VwKYcQyJ+GnO8HbxGb0vKS
 pIIUq4cjhgLFWlUQsJVa7Dxr3ibtKS/AnCWKBKZVRkiR95hvUK4KiQ8rEI0AJv1W5D1U
 2IR0rHNEfhFqgjGulb+rr/jtowaB42Mb+xtLp3sf1XwFIjK3uWRcLPZVbNn8GkdOWjLb
 t3pkt0PY7Jc48L59zEmwhOEVkfr6iedvlHwIE0zBfhV2fUKvMUaxL/+rcfUZ4eGXaRc9
 XHq8CYGLfBK5l7dxjq0k5+xApSB78+BNy/pNxendnGSOrKc4YcH1AidAosTet9pT7pcE
 es5g==
X-Gm-Message-State: AFeK/H1kjL5cBGzvvo0llUhvxye2uoXF+qTPSA9e6kjC7WHdRWq54HyAsMnpqqt6OZza4U0owmBdwm8LLaWJPQ==
X-Received: by 10.200.43.17 with SMTP id 17mr26051822qtu.199.1491388584856;
 Wed, 05 Apr 2017 03:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.93 with HTTP; Wed, 5 Apr 2017 03:36:24 -0700 (PDT)
In-Reply-To: <20170405040352.5661-2-joel@jms.id.au>
References: <20170405040352.5661-1-joel@jms.id.au>
 <20170405040352.5661-2-joel@jms.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Apr 2017 13:36:24 +0300
Message-ID: <CAHp75VcynBwkdiq+Cu1pRG3z3qDLfSx+P=wFrdo4Oqyw9jfBQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] serial: 8250: Add flag so drivers can avoid THRE
 probe
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
 openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 05 Apr 2017 10:36:29 -0000

On Wed, Apr 5, 2017 at 7:03 AM, Joel Stanley <joel@jms.id.au> wrote:
> The probing of THRE irq behaviour assumes the other end will be reading
> bytes out of the buffer in order to probe the port at driver init. In
> some cases the other end cannot be relied upon to read these bytes, so
> provide a flag for them to skip this step.
>

> Bit 16 was chosen as the flags are a int and the top bits are taken.

19 ?

>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/tty/serial/8250/8250_port.c | 2 +-
>  include/linux/serial_core.h         | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 6119516ef5fc..60a6c247340f 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2229,7 +2229,7 @@ int serial8250_do_startup(struct uart_port *port)
>                 }
>         }
>
> -       if (port->irq) {
> +       if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
>                 unsigned char iir1;
>                 /*
>                  * Test for UARTs that do not reassert THRE when the
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 58484fb35cc8..260245deec94 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -195,6 +195,7 @@ struct uart_port {
>  #define UPF_NO_TXEN_TEST       ((__force upf_t) (1 << 15))
>  #define UPF_MAGIC_MULTIPLIER   ((__force upf_t) ASYNC_MAGIC_MULTIPLIER /* 16 */ )
>
> +#define UPF_NO_THRE_TEST       ((__force upf_t) (1 << 19))
>  /* Port has hardware-assisted h/w flow control */
>  #define UPF_AUTO_CTS           ((__force upf_t) (1 << 20))
>  #define UPF_AUTO_RTS           ((__force upf_t) (1 << 21))
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
