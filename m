Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4076yV2MP6zF0wk;
 Sat, 24 Mar 2018 02:33:54 +1100 (AEDT)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 4669413C0;
 Fri, 23 Mar 2018 15:33:52 +0000 (UTC)
Date: Fri, 23 Mar 2018 16:33:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH 1/5] serial: Introduce UPSTAT_SYNC_FIFO for synchronised
 FIFOs
Message-ID: <20180323153350.GC25972@kroah.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-2-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321025241.19785-2-jk@ozlabs.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Fri, 23 Mar 2018 15:33:54 -0000

On Wed, Mar 21, 2018 at 10:52:37AM +0800, Jeremy Kerr wrote:
> This change adds a flag to indicate that a UART is has an external means
> of synchronising its FIFO, without needing CTSRTS or XON/XOFF.
> 
> This allows us to use the throttle/unthrottle callbacks, without having
> to claim other methods of flow control.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  drivers/tty/serial/serial_core.c | 4 ++--
>  include/linux/serial_core.h      | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index f534a40aebde..8f3dfc8b5307 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -678,7 +678,7 @@ static void uart_throttle(struct tty_struct *tty)
>  	if (C_CRTSCTS(tty))
>  		mask |= UPSTAT_AUTORTS;
>  
> -	if (port->status & mask) {
> +	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
>  		port->ops->throttle(port);
>  		mask &= ~port->status;
>  	}

Why not just set mask to UPSTAT_SYNC_FIFO at the top of this function?

> @@ -707,7 +707,7 @@ static void uart_unthrottle(struct tty_struct *tty)
>  	if (C_CRTSCTS(tty))
>  		mask |= UPSTAT_AUTORTS;
>  
> -	if (port->status & mask) {
> +	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
>  		port->ops->unthrottle(port);
>  		mask &= ~port->status;
>  	}

Same here.  Would make it a bit more obvious (at least to me...)

thanks,

greg k-h
