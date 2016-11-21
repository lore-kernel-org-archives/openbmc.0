Return-Path: <clg@kaod.org>
X-Greylist: delayed 3305 seconds by postgrey-1.36 at bilbo;
 Mon, 21 Nov 2016 22:02:37 AEDT
Received: from 15.mo3.mail-out.ovh.net (15.mo3.mail-out.ovh.net
 [87.98.150.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMm0F08wgzDvjf
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:02:36 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 9B2C1601CF
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 10:44:23 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 2722E28009F;
 Mon, 21 Nov 2016 10:44:21 +0100 (CET)
Subject: Re: [PATCH qemu 09/38] aspeed/scu: fix SCU region size
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-10-git-send-email-clg@kaod.org>
 <CACPK8XcGXnHy5jj4JUN_XKDALYX0U4vzrffE20nKGduTJ7dZTQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <79cdcdc5-ba12-679c-61a3-894d333a6d4d@kaod.org>
Date: Mon, 21 Nov 2016 10:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcGXnHy5jj4JUN_XKDALYX0U4vzrffE20nKGduTJ7dZTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13976639969908984578
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 11:02:38 -0000

On 11/21/2016 08:26 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:51 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  hw/misc/aspeed_scu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>> index 34e86385d837..95022d3607ad 100644
>> --- a/hw/misc/aspeed_scu.c
>> +++ b/hw/misc/aspeed_scu.c
>> @@ -86,7 +86,7 @@
>>  #define BMC_DEV_ID           TO_REG(0x1A4)
>>
>>  #define PROT_KEY_UNLOCK 0x1688A8A8
>> -#define SCU_IO_REGION_SIZE 0x20000
>> +#define SCU_IO_REGION_SIZE 0x1000
>>
> 
> The last register is at 0x1A4. Do we want to use that as the size?

That is a good remark. 

The Aspeed specs define address space ranges for each controller
but the full window is not covered by the registers. So when 
you go beyond the last register, the HW loops back on the first 
after while. Holes are filled with 0xffffffff or 0x0. 

I suppose restricting the window to the last register is the 
best option. Event if it is possible, going beyond is a guest 
error anyhow.

Thanks,

C. 

> 
>>  static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] = {
>>       [SYS_RST_CTRL]    = 0xFFCFFEDCU,
>> --
>> 2.7.4
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
