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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4077LY1L4RzF1VY
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 02:51:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2NFoU6q028189
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:51:14 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gw25xy544-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:51:14 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 23 Mar 2018 09:51:13 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 23 Mar 2018 09:51:09 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2NFp8mn7274770; Fri, 23 Mar 2018 08:51:08 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CE66C6047;
 Fri, 23 Mar 2018 09:51:08 -0600 (MDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 0443CC604F;
 Fri, 23 Mar 2018 09:51:07 -0600 (MDT)
Subject: Re: [PATCH 3/5] serial/8250: export serial8250_read_char
To: Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-4-jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 23 Mar 2018 10:51:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321025241.19785-4-jk@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032315-0016-0000-0000-0000086F6B7D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008729; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01007285; UDB=6.00512934; IPR=6.00786572; 
 MB=3.00020201; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-23 15:51:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032315-0017-0000-0000-00003DF61A06
Message-Id: <bc1b7b27-4ed0-b6c3-92bf-7e73a43b2b40@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 23 Mar 2018 15:51:17 -0000



On 03/20/2018 09:52 PM, Jeremy Kerr wrote:
> Currently, we export serial8250_rx_chars, which does a whole bunch of
> reads from the 8250 data register, without any form of flow control
> between reads.
>
> An upcoming change to the aspeed vuart driver implements more
> fine-grained flow control in the interrupt handler, requiring
> character-at-a-time control over the rx path.
>
> This change exports serial8250_read_char to allow this.

Tested-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/tty/serial/8250/8250_port.c | 3 ++-
>   include/linux/serial_8250.h         | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index a5fe0e66c607..ea435406936c 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1650,7 +1650,7 @@ static void serial8250_enable_ms(struct uart_port *port)
>   	serial8250_rpm_put(up);
>   }
>
> -static void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
> +void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
>   {
>   	struct uart_port *port = &up->port;
>   	unsigned char ch;
> @@ -1710,6 +1710,7 @@ static void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
>
>   	uart_insert_char(port, lsr, UART_LSR_OE, ch, flag);
>   }
> +EXPORT_SYMBOL_GPL(serial8250_read_char);
>
>   /*
>    * serial8250_rx_chars: processes according to the passed in LSR
> diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
> index 61fbb440449c..4639a3608614 100644
> --- a/include/linux/serial_8250.h
> +++ b/include/linux/serial_8250.h
> @@ -162,6 +162,7 @@ extern void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl);
>   extern int fsl8250_handle_irq(struct uart_port *port);
>   int serial8250_handle_irq(struct uart_port *port, unsigned int iir);
>   unsigned char serial8250_rx_chars(struct uart_8250_port *up, unsigned char lsr);
> +void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr);
>   void serial8250_tx_chars(struct uart_8250_port *up);
>   unsigned int serial8250_modem_status(struct uart_8250_port *up);
>   void serial8250_init_port(struct uart_8250_port *up);
