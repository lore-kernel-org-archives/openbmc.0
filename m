Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZBosKGh1"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZhcm67L6zDrLP
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 20:10:00 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id d13so29511252iog.5
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 01:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=G+GsYHDZ25v89ZBeXkUZu6TRJ6jzveF3YvXBt9RQRtU=;
 b=ZBosKGh1AnXMM66s8LCU+zfeswQcrFAbmmJdSh3fShczT934VTIDRgjyo0/eQa/9RO
 iEnCEiuhmY8PcHC56/Cx8nGen7Z68/kkgpZTmhic/O3USWMk28UGeKRshoSXD4/YVjqV
 YDo/NDTkyATLCbpnm1+fFRmQju9lTCXDagceAZMoNiOxJELNg0QPcDV7VYG5cRKG7ZU5
 q7a2w7Pfl8VNWYEBjt8yyN4sYVA7+4iz1CYQ85Xs1doGePDGwSTQhFVCP0egbFBzDnK5
 pweTxhVUEtRzxTqiTO7MDjhDa1b30gwKNfxRu4HlNJkA1L4pyfSiYj6lIgera6/7t8n7
 HlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=G+GsYHDZ25v89ZBeXkUZu6TRJ6jzveF3YvXBt9RQRtU=;
 b=KL0sSR9apL+N3mAe2Zr17GjGZb9n49rD/LEkkcUxGdgenBhjZlKhnTrVImWD0Wse5n
 +UU30C9BBGMsVSgRySuoIVHyIp106L+wx3PKNIfxR4Hjs2PWBTccYu3/dgpJFZHEaGwb
 /Jd2LYge5qnmwtASobTrYXZOOoHb2qCjlLIq/pWP67B+mReSET9asY2kIo4TKe2eh4IL
 /kEKbIvwel/Lhy5OGGdnV7/RJcWmleTchCeDEsvZytJb721+o607xuaD9UmNGmZQE84j
 g7vZDbpWsslJr3ZklUFD95nYzJU41ipNZeDPUw5dsz7QtF4mLP/AiV//rLbifT7PDmkP
 Rf4w==
X-Gm-Message-State: AKwxytdsoZaF969vZIpfdIbxpcIv4DcKW0KyB7igJ+Y3mPe5YOJdqdkK
 +50ItrV8Bz+33s5xLYaVc7NlNKt1RHiNLdw0hyI=
X-Google-Smtp-Source: AH8x225Q0D0U3ekgQy9n2uEH+UKsVumFTy4YBQfL8RcwTse2H4bwsmtdxmC4ODni+OxcHQq/vHVMZL5VfP2TmS3HOj8=
X-Received: by 10.107.23.7 with SMTP id 7mr54511563iox.62.1517821798638; Mon,
 05 Feb 2018 01:09:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.7.10 with HTTP; Mon, 5 Feb 2018 01:09:58 -0800 (PST)
In-Reply-To: <20180202042709.21627-1-joel@jms.id.au>
References: <20180202042709.21627-1-joel@jms.id.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 5 Feb 2018 11:09:58 +0200
Message-ID: <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Mon, 05 Feb 2018 09:10:01 -0000

Thanks Joel!

On 2 February 2018 at 06:27, Joel Stanley <joel@jms.id.au> wrote:
> From: Tomer Maimon <tmaimon77@gmail.com>
>
> The Nuvoton UART is almost compatible with the 8250 driver when probed
> via the 8250_of driver, however it requires some extra configuration
> at startup.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt |  1 +
>  drivers/tty/serial/8250/8250_of.c                 |  1 +
>  drivers/tty/serial/8250/8250_port.c               | 30 +++++++++++++++++++++++
>  include/uapi/linux/serial_core.h                  |  3 +++
>  include/uapi/linux/serial_reg.h                   |  5 ++++
>  5 files changed, 40 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
> index 419ff6c0a47f..e8d921bae665 100644
> --- a/Documentation/devicetree/bindings/serial/8250.txt
> +++ b/Documentation/devicetree/bindings/serial/8250.txt
> @@ -22,6 +22,7 @@ Required properties:
>         - "ti,da830-uart"
>         - "aspeed,ast2400-vuart"
>         - "aspeed,ast2500-vuart"
> +       - "nuvoton,npcm750-uart"
>         - "serial" if the port type is unknown.
>  - reg : offset and length of the register set for the device.
>  - interrupts : should contain uart interrupt.
> diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
> index 0cf95fddccfc..a947e1e36930 100644
> --- a/drivers/tty/serial/8250/8250_of.c
> +++ b/drivers/tty/serial/8250/8250_of.c
> @@ -298,6 +298,7 @@ static const struct of_device_id of_platform_serial_table[] = {
>         { .compatible = "mrvl,mmp-uart",
>                 .data = (void *)PORT_XSCALE, },
>         { .compatible = "ti,da830-uart", .data = (void *)PORT_DA830, },
> +       { .compatible = "nuvoton,npcm750-uart", .data = (void *)PORT_NPCM, },
>         { /* end of list */ },
>  };
>  MODULE_DEVICE_TABLE(of, of_platform_serial_table);
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index a5fe0e66c607..df52f9ddbb99 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -289,6 +289,16 @@ static const struct serial8250_config uart_config[] = {
>                 .rxtrig_bytes   = {1, 4, 8, 14},
>                 .flags          = UART_CAP_FIFO | UART_CAP_AFE,
>         },
> +       [PORT_NPCM] = {
> +               .name           = "Nuvoton 16550",
> +               .fifo_size      = 16,
> +               .tx_loadsz      = 16,
> +               .fcr            = UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> +                                 UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
> +               .rxtrig_bytes   = {1, 4, 8, 14},
> +               .flags          = UART_CAP_FIFO,
> +
> +       },
>  };
>
>  /* Uart divisor latch read */
> @@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
>                                 UART_DA830_PWREMU_MGMT_FREE);
>         }
>
> +       if (port->type == PORT_NPCM) {
> +               /*
> +                * Nuvoton calls the scratch register 'UART_TOR' (timeout
> +                * register). Enable it, and set TIOC (timeout interrupt
> +                * comparator) to be 0x20 for correct operation.
> +                */
> +               serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
> +       }

Can we set the TOR register dynamically (adding special IOCTL)?

> +
>  #ifdef CONFIG_SERIAL_8250_RSA
>         /*
>          * If this is an RSA port, see if we can kick it up to the
> @@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
>         return quot_16 >> 4;
>  }
>
> +/* Nuvoton NPCM UARTs have a custom divisor calculation */
> +static unsigned int npcm_get_divisor(struct uart_8250_port *up,
> +               unsigned int baud)
> +{
> +       struct uart_port *port = &up->port;
> +
> +       return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
> +}
> +
>  static unsigned int serial8250_get_divisor(struct uart_8250_port *up,
>                                            unsigned int baud,
>                                            unsigned int *frac)
> @@ -2485,6 +2513,8 @@ static unsigned int serial8250_get_divisor(struct uart_8250_port *up,
>                 quot = 0x8002;
>         else if (up->port.type == PORT_XR17V35X)
>                 quot = xr17v35x_get_divisor(up, baud, frac);
> +       else if (up->port.type == PORT_NPCM)
> +               quot = npcm_get_divisor(up, baud);
>         else
>                 quot = uart_get_divisor(port, baud);
>
> diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
> index c34a2a3eeff5..4807dca14ea2 100644
> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -271,4 +271,7 @@
>  /* MPS2 UART */
>  #define PORT_MPS2UART  116
>
> +/* Nuvton UART */
> +#define PORT_NPCM      117
> +
>  #endif /* _UAPILINUX_SERIAL_CORE_H */
> diff --git a/include/uapi/linux/serial_reg.h b/include/uapi/linux/serial_reg.h
> index 5db76880b4ad..50fc96431eb5 100644
> --- a/include/uapi/linux/serial_reg.h
> +++ b/include/uapi/linux/serial_reg.h
> @@ -374,5 +374,10 @@
>  #define UART_ALTR_EN_TXFIFO_LW 0x01    /* Enable the TX FIFO Low Watermark */
>  #define UART_ALTR_TX_LOW       0x41    /* Tx FIFO Low Watermark */
>
> +
> +/* Nuvoton NPCM timeout register */
> +#define UART_NPCM_TOR          7
> +#define UART_NPCM_TOIE         BIT(7)  /* Timeout Interrupt Enable */
> +
>  #endif /* _LINUX_SERIAL_REG_H */
>
> --
> 2.15.1
>

cheers,

Tomer
