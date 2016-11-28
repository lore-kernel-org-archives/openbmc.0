Return-Path: <clg@kaod.org>
X-Greylist: delayed 14574 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Nov 2016 22:26:59 AEDT
Received: from 11.mo4.mail-out.ovh.net (11.mo4.mail-out.ovh.net
 [46.105.34.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS4C74ws2zDvSR
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 22:26:59 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id F3E481FB62
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 12:20:23 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 43C5318006C;
 Mon, 28 Nov 2016 12:20:21 +0100 (CET)
Subject: Re: [PATCH qemu 35/38] net/ftgmac100: add a 'aspeed' property
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-36-git-send-email-clg@kaod.org>
 <1480299768.2503.79.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d6d61259-f7d6-cc34-a21c-244e495ddec0@kaod.org>
Date: Mon, 28 Nov 2016 12:20:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480299768.2503.79.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1366279539598527234
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 28 Nov 2016 11:27:00 -0000

On 11/28/2016 03:22 AM, Andrew Jeffery wrote:
> On Fri, 2016-11-18 at 15:22 +0100, Cédric Le Goater wrote:
>> Aspeed SOCs have different definitions for the end of ring bits. Add
>> a
>> property to specify which set of bits should be used by the nic
>> device
>> model.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/net/ftgmac100.c         | 24 ++++++++++++++++++++----
>>  include/hw/net/ftgmac100.h |  2 ++
>>  2 files changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>> index 22573ff956fd..0a8ab6b9e4d8 100644
>> --- a/hw/net/ftgmac100.c
>> +++ b/hw/net/ftgmac100.c
>> @@ -136,9 +136,11 @@ struct ftgmac100_txdes {
>>  
>>  #define FTGMAC100_TXDES0_TXBUF_SIZE(x)   ((x) & 0x3fff)
>>  #define FTGMAC100_TXDES0_EDOTR           (1 << 15)
>> +
>>  #define FTGMAC100_TXDES0_CRC_ERR         (1 << 19)
>>  #define FTGMAC100_TXDES0_LTS             (1 << 28)
>>  #define FTGMAC100_TXDES0_FTS             (1 << 29)
>> +#define FTGMAC100_TXDES0_EDOTR_ASPEED    (1 << 30)
>>  #define FTGMAC100_TXDES0_TXDMA_OWN       (1 << 31)
>>  
>>  #define FTGMAC100_TXDES1_VLANTAG_CI(x)   ((x) & 0xffff)
>> @@ -174,6 +176,7 @@ struct ftgmac100_rxdes {
>>  #define FTGMAC100_RXDES0_PAUSE_FRAME     (1 << 25)
>>  #define FTGMAC100_RXDES0_LRS             (1 << 28)
>>  #define FTGMAC100_RXDES0_FRS             (1 << 29)
>> +#define FTGMAC100_RXDES0_EDORR_ASPEED    (1 << 30)
>>  #define FTGMAC100_RXDES0_RXPKT_RDY       (1 << 31)
>>  
>>  #define FTGMAC100_RXDES1_VLANTAG_CI      0xffff
>> @@ -208,6 +211,18 @@ typedef struct {
>>      uint32_t        des3;        /* TXBUF_BADR */
>>  } Ftgmac100Desc  __attribute__ ((aligned(16)));
>>  
>> +static inline uint32_t ftgmac100_rxdes0_edorr(Ftgmac100State *s)
>> +{
>> +    return s->aspeed ?
>> +        FTGMAC100_RXDES0_EDORR_ASPEED : FTGMAC100_RXDES0_EDORR;
>> +}
>> +
>> +static inline uint32_t ftgmac100_txdes0_edotr(Ftgmac100State *s)
>> +{
>> +    return s->aspeed ?
>> +        FTGMAC100_TXDES0_EDOTR_ASPEED : FTGMAC100_TXDES0_EDOTR;
>> +}
>> +
>>  /* max frame size is :
>>   *
>>   *   9216 for Jumbo frames (+ 4 for VLAN)
>> @@ -405,7 +420,7 @@ static uint32_t
>> ftgmac100_find_txdes(Ftgmac100State *s, uint32_t addr)
>>  
>>      while (1) {
>>          ftgmac100_read_bd(&bd, addr);
>> -        if (bd.des0 & (FTGMAC100_TXDES0_FTS |
>> FTGMAC100_TXDES0_EDOTR)) {
>> +        if (bd.des0 & (FTGMAC100_TXDES0_FTS |
>> ftgmac100_txdes0_edotr(s))) {
>>              break;
>>          }
>>          addr += sizeof(Ftgmac100Desc);
>> @@ -459,7 +474,7 @@ static void ftgmac100_do_tx(Ftgmac100State *s)
>>          /* Write back the modified descriptor.  */
>>          ftgmac100_write_bd(&bd, addr);
>>          /* Advance to the next descriptor.  */
>> -        if (bd.des0 & FTGMAC100_TXDES0_EDOTR) {
>> +        if (bd.des0 & ftgmac100_txdes0_edotr(s)) {
> 
> Should we just derive the bit and stash it in a state member at realise
> time? Would save a branch for every call. Interested in your thoughts,
> not necessarily something that must happen.

This is a good suggestion and it is a small change in the code.

Thanks,


C.


> 
>>              addr = s->tx_ring;
>>          } else {
>>              addr += sizeof(Ftgmac100Desc);
>> @@ -480,7 +495,7 @@ static void ftgmac100_enable_rx(Ftgmac100State
>> *s)
>>      while (1) {
>>          ftgmac100_read_bd(&bd, s->rx_descriptor);
>>          full = (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY);
>> -        if (!full || bd.des0 & FTGMAC100_TXDES0_EDOTR) {
>> +        if (!full || bd.des0 & ftgmac100_txdes0_edotr(s)) {
>>              break;
>>          }
>>          s->rx_descriptor += sizeof(Ftgmac100Desc);
>> @@ -784,7 +799,7 @@ static ssize_t ftgmac100_receive(NetClientState
>> *nc, const uint8_t *buf,
>>              s->isr |= FTGMAC100_INT_RPKT_FIFO;
>>          }
>>          ftgmac100_write_bd(&bd, addr);
>> -        if (bd.des0 & FTGMAC100_RXDES0_EDORR) {
>> +        if (bd.des0 & ftgmac100_rxdes0_edorr(s)) {
>>              addr = s->rx_ring;
>>          } else {
>>              addr += sizeof(Ftgmac100Desc); 
>> @@ -869,6 +884,7 @@ static const VMStateDescription vmstate_ftgmac100
>> = {
>>  };
>>  
>>  static Property ftgmac100_properties[] = {
>> +    DEFINE_PROP_BOOL("aspeed", Ftgmac100State, aspeed, false),
>>      DEFINE_NIC_PROPERTIES(Ftgmac100State, conf),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>> diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
>> index cc5cb4207a5c..ee8975000260 100644
>> --- a/include/hw/net/ftgmac100.h
>> +++ b/include/hw/net/ftgmac100.h
>> @@ -57,6 +57,8 @@ typedef struct Ftgmac100State {
>>      uint32_t phy_int;
>>      uint32_t phy_int_mask;
>>  
>> +    bool aspeed;
>> +
>>  } Ftgmac100State;
>>  
>>  #endif
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
