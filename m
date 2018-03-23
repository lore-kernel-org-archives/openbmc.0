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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4077Kl1zvVzF0x9
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 02:50:34 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2NFoPuK072784
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:50:32 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gw21vqrev-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:50:32 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 23 Mar 2018 09:50:31 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 23 Mar 2018 09:50:27 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2NFoReV11534634; Fri, 23 Mar 2018 08:50:27 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48E2DC6042;
 Fri, 23 Mar 2018 09:50:27 -0600 (MDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id CDBEAC6047;
 Fri, 23 Mar 2018 09:50:26 -0600 (MDT)
Subject: Re: [PATCH 1/5] serial: Introduce UPSTAT_SYNC_FIFO for synchronised
 FIFOs
To: Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-2-jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 23 Mar 2018 10:50:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321025241.19785-2-jk@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032315-0016-0000-0000-0000086F6B56
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008729; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01007284; UDB=6.00512933; IPR=6.00786572; 
 MB=3.00020201; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-23 15:50:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032315-0017-0000-0000-00003DF61995
Message-Id: <2708b9bf-cf8b-a98e-d64b-abb1c90a927f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-23_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
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
X-List-Received-Date: Fri, 23 Mar 2018 15:50:36 -0000



On 03/20/2018 09:52 PM, Jeremy Kerr wrote:
> This change adds a flag to indicate that a UART is has an external means
> of synchronising its FIFO, without needing CTSRTS or XON/XOFF.
>
> This allows us to use the throttle/unthrottle callbacks, without having
> to claim other methods of flow control.

This series fixed extremely heavy cpu usage we were getting with a lot 
of traffic coming in on the console. System is usable again with console 
getting hammered.

Tested-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/tty/serial/serial_core.c | 4 ++--
>   include/linux/serial_core.h      | 1 +
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index f534a40aebde..8f3dfc8b5307 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -678,7 +678,7 @@ static void uart_throttle(struct tty_struct *tty)
>   	if (C_CRTSCTS(tty))
>   		mask |= UPSTAT_AUTORTS;
>
> -	if (port->status & mask) {
> +	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
>   		port->ops->throttle(port);
>   		mask &= ~port->status;
>   	}
> @@ -707,7 +707,7 @@ static void uart_unthrottle(struct tty_struct *tty)
>   	if (C_CRTSCTS(tty))
>   		mask |= UPSTAT_AUTORTS;
>
> -	if (port->status & mask) {
> +	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
>   		port->ops->unthrottle(port);
>   		mask &= ~port->status;
>   	}
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 1775500294bb..bf600ae0290d 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -232,6 +232,7 @@ struct uart_port {
>   #define UPSTAT_AUTORTS		((__force upstat_t) (1 << 2))
>   #define UPSTAT_AUTOCTS		((__force upstat_t) (1 << 3))
>   #define UPSTAT_AUTOXOFF		((__force upstat_t) (1 << 4))
> +#define UPSTAT_SYNC_FIFO	((__force upstat_t) (1 << 5))
>
>   	int			hw_stopped;		/* sw-assisted CTS flow state */
>   	unsigned int		mctrl;			/* current modem ctrl settings */
