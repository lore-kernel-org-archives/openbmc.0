Return-Path: <clg@kaod.org>
Received: from 2.mo6.mail-out.ovh.net (2.mo6.mail-out.ovh.net [46.105.76.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tY6Sh1HXKzDvk7
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 03:26:11 +1100 (AEDT)
Received: from player776.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id E069764898
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 17:26:06 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: postmaster@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id E79D640006E;
 Tue,  6 Dec 2016 17:26:01 +0100 (CET)
Subject: Re: [PATCH] ftgmac100: fixup MAC address set during board bringup
To: "Anton D. Kachalov" <mouse@yandex-team.ru>, Joel Stanley <joel@jms.id.au>
References: <12131479795846@webcorp02g.yandex-team.ru>
 <CACPK8Xc+dgohMYhShGoifNf4pxWTHzoas1G1+FiffPGBG-7j7Q@mail.gmail.com>
 <135601479877296@webcorp02g.yandex-team.ru>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <75c5a2e0-a628-5dd1-7237-149185ef4ace@kaod.org>
Date: Tue, 6 Dec 2016 17:25:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <135601479877296@webcorp02g.yandex-team.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16617719678371728130
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrhedtgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 06 Dec 2016 16:26:12 -0000

On 11/23/2016 06:01 AM, Anton D. Kachalov wrote:
> 
> 
> 23.11.2016, 07:57, "Joel Stanley" <joel@jms.id.au>:
>> On Tue, Nov 22, 2016 at 4:54 PM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
>>>  Hardware reset leads to clear all registers.
>>>  Make the hardware reset first before actual MAC address set in ftgmac100_initialization loop.
>>>  Based on datasheet only one bit (SW_RST) have to be set in order to proper MAC reset.
>>>
>>>  Signed-off-by: Anton D. Kachalov <mouse@yandex-team.ru>
>>
>> Thanks for the patch!
>>
>>>  ---
>>>   drivers/net/ftgmac100.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>>  diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
>>>  --- a/drivers/net/ftgmac100.c 2016-11-22 07:07:44.000000000 +0300
>>>  +++ b/drivers/net/ftgmac100.c 2016-11-22 07:27:12.131940971 +0300
>>>  @@ -457,7 +457,7 @@ static void ftgmac100_reset(struct eth_d
>>>          debug("%s()\n", __func__);
>>>
>>>          //Ryan modify
>>>  - __raw_writel(__raw_readl(&ftgmac100->maccr) | FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
>>>  + __raw_writel(FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
>>
>> I assume all of the other values in MACCR will be reset when we do the
>> software reset, so that's why you don't need to read-modify-write?
> 
> Regarding to the datasheet reset sequence, only one bit (SW_RST) have to be written. 

I checked the specs. This is correct.

However, there is also this quote (on AST2400 and AST2500) : 

	After setting the SW RST (MAC50 [31]) = 1 to do the software 
	reset, it need to delay at lease 10 us and then setting the 
	SW RST (MAC50 [31]) = 1 to do the software reset again.
	This means the software reset need to be done at least twice

Shouldn't we add a delay and an extra reset before polling on the maccr 
value ? 

Thanks,

C. 

> Within real hardware (AST2150) read-modify-write doesn't work. Sametime, kernel's driver 
> has a proper init sequence too (only one bit set).
> 
>>
>>>          while (__raw_readl(&ftgmac100->maccr) & FTGMAC100_MACCR_SW_RST);
>>>
>>>  @@ -791,11 +791,11 @@ int ftgmac100_initialize(bd_t *bd)
>>>                  miiphy_register(dev->name, ftgmac100_reg_read, ftgmac100_reg_write);
>>>   #endif
>>>
>>>  + ftgmac100_reset(dev);
>>>  +
>>
>> This part of the change looks good.
>>
>> Cheers,
>>
>> Joel
>>
>>>                  /* set the ethernet address */
>>>                  ftgmac100_set_mac_from_env(dev);
>>>
>>>  - ftgmac100_reset(dev);
>>>  -
>>>                  card_number++;
>>>          }
>>>          return card_number;
>>>  _______________________________________________
>>>  openbmc mailing list
>>>  openbmc@lists.ozlabs.org
>>>  https://lists.ozlabs.org/listinfo/openbmc
> 
