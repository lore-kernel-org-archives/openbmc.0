Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqGhf3kP9zDqcK
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 19:25:54 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2O8PiM9006732;
 Fri, 24 Mar 2017 03:25:46 -0500
Message-ID: <1490343943.3177.34.camel@kernel.crashing.org>
Subject: Re: [PATCH] serial: 8250: Add flag so drivers can avoid probe
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 24 Mar 2017 19:25:43 +1100
In-Reply-To: <20170324032015.1194-1-joel@jms.id.au>
References: <20170324032015.1194-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 24 Mar 2017 08:25:55 -0000

On Fri, 2017-03-24 at 13:50 +1030, Joel Stanley wrote:
> The probe assumes the other end will be reading bytes out of the
> buffer
> in order to probe the port at driver init. In some cases the other
> end cannot be relied upon to read these bytes, so provide a flag for
> them to skip this step.
> 
> Bit 16 was chosen as the flags are a int and the top bits are taken.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Only nit: "The probe" is unclear. "The probing of THRE irq behaviour"
would be more precise. There are other forms of probing in that
driver :-)

Cheers,
Ben.

> ---
>  drivers/tty/serial/8250/8250_port.c | 2 +-
>  drivers/tty/serial/aspeed-vuart.c   | 2 +-
>  include/linux/serial_core.h         | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c
> b/drivers/tty/serial/8250/8250_port.c
> index 427dd789c0e5..90994e0389df 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2167,7 +2167,7 @@ int serial8250_do_startup(struct uart_port
> *port)
>  		serial_port_out(port, UART_LCR, 0);
>  	}
>  
> -	if (port->irq) {
> +	if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
>  		unsigned char iir1;
>  		/*
>  		 * Test for UARTs that do not reassert THRE when the
> diff --git a/drivers/tty/serial/aspeed-vuart.c
> b/drivers/tty/serial/aspeed-vuart.c
> index 42ccb380af41..b9559025d710 100644
> --- a/drivers/tty/serial/aspeed-vuart.c
> +++ b/drivers/tty/serial/aspeed-vuart.c
> @@ -260,7 +260,7 @@ static int ast_vuart_probe(struct platform_device
> *pdev)
>  	port.port.type = PORT_16550A;
>  	port.port.uartclk = clk;
>  	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
> -		| UPF_FIXED_PORT | UPF_FIXED_TYPE;
> +		| UPF_FIXED_PORT | UPF_FIXED_TYPE |
> UPF_NO_THRE_TEST;
>  
>  	if (of_find_property(np, "no-loopback-test", NULL))
>  		port.port.flags |= UPF_SKIP_TEST;
> diff --git a/include/linux/serial_core.h
> b/include/linux/serial_core.h
> index a3d7c0d4a03e..2d1fb7423999 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -193,6 +193,7 @@ struct uart_port {
>  #define UPF_NO_TXEN_TEST	((__force upf_t) (1 << 15))
>  #define UPF_MAGIC_MULTIPLIER	((__force upf_t)
> ASYNC_MAGIC_MULTIPLIER /* 16 */ )
>  
> +#define UPF_NO_THRE_TEST	((__force upf_t) (1 << 19))
>  /* Port has hardware-assisted h/w flow control */
>  #define UPF_AUTO_CTS		((__force upf_t) (1 << 20))
>  #define UPF_AUTO_RTS		((__force upf_t) (1 << 21))
