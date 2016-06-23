Return-Path: <clg@kaod.org>
Received: from mo1.mail-out.ovh.net (mo1.mail-out.ovh.net [178.32.228.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb7VM05zgzDqnP
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 03:19:06 +1000 (AEST)
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 6EABAFF997D
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:09:35 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 1DEF62C0086;
 Thu, 23 Jun 2016 19:09:32 +0200 (CEST)
Subject: Re: [PATCH linux 3/4] ftgmac100: Add devicetree option for the Aspeed
 g5 register interface
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
 <1465533869-3218-4-git-send-email-andrew@aj.id.au>
 <CACPK8Xfe58gdYGV9QcdHVc2y3hp9AYpCtuFFUd1C-pHmNAy0=w@mail.gmail.com>
 <575AADB9.5050501@kaod.org>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bfac8b51-733c-e7e7-635f-bbae2b0d6a8c@kaod.org>
Date: Thu, 23 Jun 2016 19:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <575AADB9.5050501@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1715589986778647382
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdeigdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2016 17:19:08 -0000

On 06/10/2016 02:08 PM, Cédric Le Goater wrote:
> Hello, 
> 
> On 06/10/2016 10:46 AM, Joel Stanley wrote:
>> On Thu, Jun 9, 2016 at 11:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>> @@ -1346,6 +1358,15 @@ static int ftgmac100_probe(struct platform_device *pdev)
>>>                 priv->use_ncsi = false;
>>>         }
>>>
>>> +       if (pdev->dev.of_node &&
>>> +           of_get_property(pdev->dev.of_node, "aspeed-g5-interface", NULL)) {
>>
>> We should get our device tree experts to chime in here.
>>
>> An alternative could be to use
>> of_machine_is_compatible("aspeed,ast2500"). Then we don't need extra
>> properties.
> 
> yes. That would be better.
> 
> 
> So, given that there always has been fixes from Aspeed on the driver in
> u-boot (see below), it seems that these EDO bits have been wrong since
> the beginning in Linux.
> 
> I am wondering what how this was working. We should probably contact 
> Aspeed to have some clarification.

Aspeed said that they have a different design than Faraday and we should 
be using :

	#define FTGMAC100_TXDES0_EDOTR		(1 << 30) 
	#define FTGMAC100_RXDES0_EDORR		(1 << 30)	

for all boards : ast2400 *and* ast2500. 

I gave it a try on a palmetto and indeed, network works fine with the 
Aspeed EDO{T,R}R bits. 
  
Cheers,

C.
 

> Current SDK (fixed):
> 
> ./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h://#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
> ./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 30) //org is 15 ->30
> ./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h://#define FTGMAC100_RXDES0_EDORR		(1 << 15)
> ./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 30)	//org 15->30
> ./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h://#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
> ./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 30) //org is 15 ->30
> ./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h://#define FTGMAC100_RXDES0_EDORR		(1 << 15)
> ./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 30)	//org 15->30
> 
> Older SDK (only aspeednic is fixed with a comment)
> 
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c://#define EDORR   0x00008000  /* Receive End Of Ring */
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:#define EDORR   0x40000000  /* Receive End Of Ring */
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c://#define EDOTR   0x00008000  /* Transmit End Of Ring */
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:#define EDOTR   0x40000000  /* Transmit End Of Ring */
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:  rx_ring[rxRingSize - 1].status |= cpu_to_le32(EDORR);
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:  tx_ring[txRingSize - 1].status |= cpu_to_le32(EDOTR);
> 
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
> ./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 15)
> 
> Mainline (broken):
> 
> ./u-boot/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
> ./u-boot/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 15)
> 
> 
> 
> 
