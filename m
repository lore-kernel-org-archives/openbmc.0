Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4077MV2RKRzDr2G
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 02:52:06 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2NFoQNu072819
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:52:03 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gw21vqt6a-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:52:01 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 23 Mar 2018 09:52:00 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 23 Mar 2018 09:51:56 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2NFpuF58389042; Fri, 23 Mar 2018 08:51:56 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BC09C6047;
 Fri, 23 Mar 2018 09:51:56 -0600 (MDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id A2C37C603E;
 Fri, 23 Mar 2018 09:51:55 -0600 (MDT)
Subject: Re: [PATCH 5/5] serial/aspeed-vuart: Implement quick throttle
 mechanism
To: Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-6-jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 23 Mar 2018 10:51:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321025241.19785-6-jk@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032315-0008-0000-0000-0000097F6C26
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008729; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01007284; UDB=6.00512934; IPR=6.00786573; 
 MB=3.00020202; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-23 15:51:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032315-0009-0000-0000-00004682D993
Message-Id: <473dcfc9-9462-6b67-6d40-3f9d5ecaf492@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-23_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803230182
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
X-List-Received-Date: Fri, 23 Mar 2018 15:52:06 -0000



On 03/20/2018 09:52 PM, Jeremy Kerr wrote:
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

Tested-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/tty/serial/8250/8250_aspeed_vuart.c | 103 ++++++++++++++++++++++++++--
>   1 file changed, 99 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 50c082b4a1ac..bc2b63578e58 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -14,6 +14,8 @@
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
> +#include <linux/tty.h>
> +#include <linux/tty_flip.h>
>   #include <linux/clk.h>
>
>   #include "8250.h"
> @@ -32,8 +34,16 @@ struct aspeed_vuart {
>   	void __iomem		*regs;
>   	struct clk		*clk;
>   	int			line;
> +	struct timer_list	unthrottle_timer;
>   };
>
> +/*
> + * If we fill the tty flip buffers, we throttle the data ready interrupt
> + * to prevent dropped characters. This timeout defines how long we wait
> + * to (conditionally, depending on buffer state) unthrottle.
> + */
> +static const int unthrottle_timeout = HZ/10;
> +
>   /*
>    * The VUART is basically two UART 'front ends' connected by their FIFO
>    * (no actual serial line in between). One is on the BMC side (management
> @@ -183,17 +193,23 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
>   	serial8250_do_shutdown(uart_port);
>   }
>
> -static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
> +static void __aspeed_vuart_set_throttle(struct uart_8250_port *up,
> +		bool throttle)
>   {
>   	unsigned char irqs = UART_IER_RLSI | UART_IER_RDI;
> -	struct uart_8250_port *up = up_to_u8250p(port);
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&port->lock, flags);
>   	up->ier &= ~irqs;
>   	if (!throttle)
>   		up->ier |= irqs;
>   	serial_out(up, UART_IER, up->ier);
> +}
> +static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(port);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	__aspeed_vuart_set_throttle(up, throttle);
>   	spin_unlock_irqrestore(&port->lock, flags);
>   }
>
> @@ -207,6 +223,81 @@ static void aspeed_vuart_unthrottle(struct uart_port *port)
>   	aspeed_vuart_set_throttle(port, false);
>   }
>
> +static void aspeed_vuart_unthrottle_exp(unsigned long data)
> +{
> +	struct uart_8250_port *up = (void *)data;
> +	struct aspeed_vuart *vuart = up->port.private_data;
> +
> +	if (!tty_buffer_space_avail(&up->port.state->port)) {
> +		mod_timer(&vuart->unthrottle_timer, unthrottle_timeout);
> +		return;
> +	}
> +
> +	aspeed_vuart_unthrottle(&up->port);
> +}
> +
> +/*
> + * Custom interrupt handler to manage finer-grained flow control. Although we
> + * have throttle/unthrottle callbacks, we've seen that the VUART device can
> + * deliver characters faster than the ldisc has a chance to check buffer space
> + * against the throttle threshold. This results in dropped characters before
> + * the throttle.
> + *
> + * We do this by checking for flip buffer space before RX. If we have no space,
> + * throttle now and schedule an unthrottle for later, once the ldisc has had
> + * a chance to drain the buffers.
> + */
> +static int aspeed_vuart_handle_irq(struct uart_port *port) { struct
> +	uart_8250_port *up = up_to_u8250p(port); unsigned int iir, lsr;
> +	unsigned long flags; int space, count;
> +
> +	iir = serial_port_in(port, UART_IIR);
> +
> +	if (iir & UART_IIR_NO_INT)
> +		return 0;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +
> +	lsr = serial_port_in(port, UART_LSR);
> +
> +	if (lsr & (UART_LSR_DR | UART_LSR_BI)) {
> +		space = tty_buffer_space_avail(&port->state->port);
> +
> +		if (!space) {
> +			/* throttle and schedule an unthrottle later */
> +			struct aspeed_vuart *vuart = port->private_data;
> +			__aspeed_vuart_set_throttle(up, true);
> +
> +			if (!timer_pending(&vuart->unthrottle_timer)) {
> +				vuart->unthrottle_timer.data =
> +					(unsigned long)up;
> +				mod_timer(&vuart->unthrottle_timer,
> +						unthrottle_timeout);
> +			}
> +
> +		} else {
> +			count = min(space, 256);
> +
> +			do {
> +				serial8250_read_char(up, lsr);
> +				lsr = serial_in(up, UART_LSR);
> +				if (--count == 0)
> +					break;
> +			} while (lsr & (UART_LSR_DR | UART_LSR_BI));
> +
> +			tty_flip_buffer_push(&port->state->port);
> +		}
> +	}
> +
> +	serial8250_modem_status(up);
> +	if (lsr & UART_LSR_THRE)
> +		serial8250_tx_chars(up);
> +
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	return 1;
> +}
> +
>   static int aspeed_vuart_probe(struct platform_device *pdev)
>   {
>   	struct uart_8250_port port;
> @@ -223,6 +314,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>
>   	vuart->dev = &pdev->dev;
> +	setup_timer(&vuart->unthrottle_timer,
> +			aspeed_vuart_unthrottle_exp, (unsigned long)vuart);
>
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	vuart->regs = devm_ioremap_resource(&pdev->dev, res);
> @@ -284,6 +377,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>
>   	port.port.irq = irq_of_parse_and_map(np, 0);
>   	port.port.irqflags = IRQF_SHARED;
> +	port.port.handle_irq = aspeed_vuart_handle_irq;
>   	port.port.iotype = UPIO_MEM;
>   	port.port.type = PORT_16550A;
>   	port.port.uartclk = clk;
> @@ -323,6 +417,7 @@ static int aspeed_vuart_remove(struct platform_device *pdev)
>   {
>   	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
>
> +	del_timer_sync(&vuart->unthrottle_timer);
>   	aspeed_vuart_set_enabled(vuart, false);
>   	serial8250_unregister_port(vuart->line);
>   	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
