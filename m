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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4077Lt4xR8zF1YQ
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 02:51:34 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2NFoPUj146023
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:51:31 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gw3anbsb5-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:51:31 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 23 Mar 2018 09:51:30 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 23 Mar 2018 09:51:28 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2NFpS9Z2556268; Fri, 23 Mar 2018 08:51:28 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28578C6037;
 Fri, 23 Mar 2018 09:51:28 -0600 (MDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 96CA3C604C;
 Fri, 23 Mar 2018 09:51:27 -0600 (MDT)
Subject: Re: [PATCH 4/5] serial/aspeed-vuart: Implement rx throttling
To: Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-5-jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 23 Mar 2018 10:51:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321025241.19785-5-jk@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032315-0004-0000-0000-000013D8552C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008729; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01007284; UDB=6.00512934; IPR=6.00786573; 
 MB=3.00020202; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-23 15:51:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032315-0005-0000-0000-00008694FB4F
Message-Id: <8eb7d8e4-92ef-766c-9c8b-6725ef121085@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 23 Mar 2018 15:51:35 -0000



On 03/20/2018 09:52 PM, Jeremy Kerr wrote:
> The aspeed VUART runs at LPC bus frequency, rather than being restricted
> to a typical UART baud rate. This means that the VUART can receive a lot
> of data, which can overrun tty flip buffers, and/or cause a large amount
> of interrupt traffic.
>
> This change implements the uart_port->throttle & unthrottle callbacks,
> implemented by disabling the receiver line status & received data
> available IRQs.

Tested-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/tty/serial/8250/8250_aspeed_vuart.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 33a801353114..50c082b4a1ac 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -183,6 +183,30 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
>   	serial8250_do_shutdown(uart_port);
>   }
>
> +static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
> +{
> +	unsigned char irqs = UART_IER_RLSI | UART_IER_RDI;
> +	struct uart_8250_port *up = up_to_u8250p(port);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	up->ier &= ~irqs;
> +	if (!throttle)
> +		up->ier |= irqs;
> +	serial_out(up, UART_IER, up->ier);
> +	spin_unlock_irqrestore(&port->lock, flags);
> +}
> +
> +static void aspeed_vuart_throttle(struct uart_port *port)
> +{
> +	aspeed_vuart_set_throttle(port, true);
> +}
> +
> +static void aspeed_vuart_unthrottle(struct uart_port *port)
> +{
> +	aspeed_vuart_set_throttle(port, false);
> +}
> +
>   static int aspeed_vuart_probe(struct platform_device *pdev)
>   {
>   	struct uart_8250_port port;
> @@ -212,6 +236,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>   	port.port.mapsize = resource_size(res);
>   	port.port.startup = aspeed_vuart_startup;
>   	port.port.shutdown = aspeed_vuart_shutdown;
> +	port.port.throttle = aspeed_vuart_throttle;
> +	port.port.unthrottle = aspeed_vuart_unthrottle;
> +	port.port.status = UPSTAT_SYNC_FIFO;
>   	port.port.dev = &pdev->dev;
>
>   	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
