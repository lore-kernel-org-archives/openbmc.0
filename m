Return-Path: <clg@kaod.org>
Received: from mo4.mail-out.ovh.net (mo4.mail-out.ovh.net [178.32.228.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS5hv73hMzDqhX
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 23:34:23 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 31D4C1FB27
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:34:18 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 3AB0A180088;
 Mon, 28 Nov 2016 13:34:15 +0100 (CET)
Subject: Re: [PATCH qemu 25/38] aspeed/sdmc: rework the locking register of
 the memory controller
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-26-git-send-email-clg@kaod.org>
 <1480298155.2503.68.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3249de40-e352-fa5f-5ccb-56824d694a32@kaod.org>
Date: Mon, 28 Nov 2016 13:34:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480298155.2503.68.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2614902533845912322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 28 Nov 2016 12:34:24 -0000

On 11/28/2016 02:55 AM, Andrew Jeffery wrote:
> On Fri, 2016-11-18 at 15:22 +0100, Cédric Le Goater wrote:
>> The lock register is unlocked with a write of a special value and
>> locked with a write of any other value. When unlocked, reads return
>> one and when locked a zero.
>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/misc/aspeed_sdmc.c         | 28 +++++++++++++++++++---------
>>  include/hw/misc/aspeed_sdmc.h |  1 +
>>  2 files changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
>> index 5f3ac0b6f608..867caa2d64dc 100644
>> --- a/hw/misc/aspeed_sdmc.c
>> +++ b/hw/misc/aspeed_sdmc.c
>> @@ -83,17 +83,22 @@
>>  static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
>>  {
>>      AspeedSDMCState *s = ASPEED_SDMC(opaque);
>> +    uint64_t val = 0;
>>  
>>      addr >>= 2;
>>  
>> -    if (addr >= ARRAY_SIZE(s->regs)) {
>> +    switch (addr) {
>> +    case R_PROT:
>> +        val = s->unlocked;
>> +        break;
>> +    default:
>>          qemu_log_mask(LOG_GUEST_ERROR,
>>                        "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
>>                        __func__, addr);
>> -        return 0;
>> +        break;
>>      }
>>  
>> -    return s->regs[addr];
>> +    return val;
> 
> This suggests we only care about R_PROT - the change returns 0 for the
> value of other registers. That doesn't seem right.

Well, the read already returned 0 and that is what you get most of the 
time on real HW. Some time you get a 0xFFFFFFFF. 

Thanks,

C.


> Andrew
> 
>>  }
>>  
>>  static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
>> @@ -103,19 +108,18 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
>>  
>>      addr >>= 2;
>>  
>> -    if (addr >= ARRAY_SIZE(s->regs)) {
>> -        qemu_log_mask(LOG_GUEST_ERROR,
>> -                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
>> -                      __func__, addr);
>> +    if (addr == R_PROT) {
>> +        s->unlocked = (data == PROT_KEY_UNLOCK);
>>          return;
>>      }
>>  
>> -    if (addr != R_PROT && s->regs[R_PROT] != PROT_KEY_UNLOCK) {
>> +    if (!s->unlocked) { /* TODO protect : MCR04 ∼ MCR7C */
>>          qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
>>          return;
>>      }
>>  
>> -    if (addr == R_CONF) {
>> +    switch (addr) {
>> +    case R_CONF:
>>          /* Make sure readonly bits are kept */
>>          switch (s->silicon_rev) {
>>          case AST2400_A0_SILICON_REV:
>> @@ -128,6 +132,12 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
>>          default:
>>              g_assert_not_reached();
>>          }
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
>> +                      __func__, addr << 2);
>> +        return;
>>      }
>>  
>>      s->regs[addr] = data;
>> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
>> index 551c8afdf4be..a4415d9efc2f 100644
>> --- a/include/hw/misc/aspeed_sdmc.h
>> +++ b/include/hw/misc/aspeed_sdmc.h
>> @@ -28,6 +28,7 @@ typedef struct AspeedSDMCState {
>>      uint32_t ram_bits;
>>      uint64_t ram_size;
>>  
>> +    bool unlocked;
>>  } AspeedSDMCState;
>>  
>>  #endif /* ASPEED_SDMC_H */
