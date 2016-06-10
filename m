Return-Path: <clg@kaod.org>
X-Greylist: delayed 3298 seconds by postgrey-1.35 at bilbo;
 Fri, 10 Jun 2016 23:03:36 AEST
Received: from 7.mo2.mail-out.ovh.net (7.mo2.mail-out.ovh.net [188.165.48.182])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR2RX0KhpzDq5k
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 23:03:35 +1000 (AEST)
Received: from player760.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 9E220FF9CBA
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:08:32 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id D2E893C0077;
 Fri, 10 Jun 2016 14:08:25 +0200 (CEST)
Subject: Re: [PATCH linux 3/4] ftgmac100: Add devicetree option for the Aspeed
 g5 register interface
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
 <1465533869-3218-4-git-send-email-andrew@aj.id.au>
 <CACPK8Xfe58gdYGV9QcdHVc2y3hp9AYpCtuFFUd1C-pHmNAy0=w@mail.gmail.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <575AADB9.5050501@kaod.org>
Date: Fri, 10 Jun 2016 14:08:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xfe58gdYGV9QcdHVc2y3hp9AYpCtuFFUd1C-pHmNAy0=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12520006966677572438
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeejgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 10 Jun 2016 13:03:36 -0000

Hello, 

On 06/10/2016 10:46 AM, Joel Stanley wrote:
> On Thu, Jun 9, 2016 at 11:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> @@ -1346,6 +1358,15 @@ static int ftgmac100_probe(struct platform_device *pdev)
>>                 priv->use_ncsi = false;
>>         }
>>
>> +       if (pdev->dev.of_node &&
>> +           of_get_property(pdev->dev.of_node, "aspeed-g5-interface", NULL)) {
> 
> We should get our device tree experts to chime in here.
> 
> An alternative could be to use
> of_machine_is_compatible("aspeed,ast2500"). Then we don't need extra
> properties.

yes. That would be better.


So, given that there always has been fixes from Aspeed on the driver in
u-boot (see below), it seems that these EDO bits have been wrong since
the beginning in Linux.

I am wondering what how this was working. We should probably contact 
Aspeed to have some clarification.

C. 


Current SDK (fixed):

./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h://#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 30) //org is 15 ->30
./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h://#define FTGMAC100_RXDES0_EDORR		(1 << 15)
./u-boot-v2016.05-ast2500/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 30)	//org 15->30
./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h://#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 30) //org is 15 ->30
./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h://#define FTGMAC100_RXDES0_EDORR		(1 << 15)
./u-boot-2013.01-aspeed/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 30)	//org 15->30

Older SDK (only aspeednic is fixed with a comment)

./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c://#define EDORR   0x00008000  /* Receive End Of Ring */
./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:#define EDORR   0x40000000  /* Receive End Of Ring */
./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c://#define EDOTR   0x00008000  /* Transmit End Of Ring */
./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:#define EDOTR   0x40000000  /* Transmit End Of Ring */
./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:  rx_ring[rxRingSize - 1].status |= cpu_to_le32(EDORR);
./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/aspeednic.c:  tx_ring[txRingSize - 1].status |= cpu_to_le32(EDOTR);

./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
./u-boot-github-v2016.03-aspeed-openbmc/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 15)

Mainline (broken):

./u-boot/drivers/net/ftgmac100.h:#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
./u-boot/drivers/net/ftgmac100.h:#define FTGMAC100_RXDES0_EDORR		(1 << 15)
