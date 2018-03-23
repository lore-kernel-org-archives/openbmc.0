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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4076sW5d7YzDr5m;
 Sat, 24 Mar 2018 02:29:35 +1100 (AEDT)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id D4A201391;
 Fri, 23 Mar 2018 15:29:32 +0000 (UTC)
Date: Fri, 23 Mar 2018 16:29:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH 2/5] serial: expose buf_overrun count through proc
 interface
Message-ID: <20180323152931.GB25972@kroah.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-3-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321025241.19785-3-jk@ozlabs.org>
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
X-List-Received-Date: Fri, 23 Mar 2018 15:29:36 -0000

On Wed, Mar 21, 2018 at 10:52:38AM +0800, Jeremy Kerr wrote:
> The buf_overrun count is only every written, and not exposed to
> userspace anywhere. This means that dropped characters due to flip
> buffer overruns are never visible to userspace.
> 
> The /proc/tty/driver/serial file exports a bunch of metrics (including
> hardware overruns) already, so add the buf_overrun (as "bo:") to this
> file.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  drivers/tty/serial/serial_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 8f3dfc8b5307..fc677534b510 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -1780,6 +1780,8 @@ static void uart_line_info(struct seq_file *m, struct uart_driver *drv, int i)
>  			seq_printf(m, " brk:%d", uport->icount.brk);
>  		if (uport->icount.overrun)
>  			seq_printf(m, " oe:%d", uport->icount.overrun);
> +		if (uport->icount.buf_overrun)
> +			seq_printf(m, " bo:%d", uport->icount.buf_overrun);

Hopefully this doesn't break any tools that might want to parse this
file :)
