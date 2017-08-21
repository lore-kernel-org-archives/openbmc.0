Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbbkr6mWGzDqZv
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 00:32:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7LEWJXe072257
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 10:32:50 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cfx8pa3ss-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 10:32:50 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 21 Aug 2017 10:32:48 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 Aug 2017 10:32:45 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7LEWjCe26280050; Mon, 21 Aug 2017 14:32:45 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF41E124049;
 Mon, 21 Aug 2017 10:30:06 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 0AF1D12403F;
 Mon, 21 Aug 2017 10:30:05 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Aug 2017 09:35:10 -0500
From: anoo <anoo@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Milton Miller II <miltonm@us.ibm.com>
Cc: Rick Altherr <raltherr@google.com>, Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, joel.stan@gmail.com
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD support to Aspeed
 Flash driver
In-Reply-To: <CACPK8XcR3ZX6X_DZTttvHj5t=Cvnz3eS7uVPc3g_3afSkTULhw@mail.gmail.com>
References: <1502140837-48939-1-git-send-email-anoo@linux.vnet.ibm.com>
 <CACPK8XcR3ZX6X_DZTttvHj5t=Cvnz3eS7uVPc3g_3afSkTULhw@mail.gmail.com>
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 17082114-0008-0000-0000-00000271A960
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007585; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00905566; UDB=6.00453793; IPR=6.00685769; 
 BA=6.00005543; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016791; XFM=3.00000015;
 UTC=2017-08-21 14:32:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082114-0009-0000-0000-00003671B712
Message-Id: <0c225b398db607f05023b2f584f78986@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-21_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708210227
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
X-List-Received-Date: Mon, 21 Aug 2017 14:32:54 -0000

On 2017-08-21 06:06, Joel Stanley wrote:
> On Tue, Aug 8, 2017 at 6:50 AM, Adriana Kobylak 
> <anoo@linux.vnet.ibm.com> wrote:
>> Add support to the aspeed flash driver to enable the common mtd layer
>> through CONFIG_FLASH_CFI_MTD.
>> 
>> This enables the flash to be used by u-boot mtd drivers including
>> the mtdparts and ubi commands.
>> 
>> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
>> Acked-by: Milton Miller <miltonm@us.ibm.com>
>> ---
>>  arch/arm/mach-aspeed/flash.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>> 
>> diff --git a/arch/arm/mach-aspeed/flash.c 
>> b/arch/arm/mach-aspeed/flash.c
>> index 9c5ead6..e1e3cf8 100644
>> --- a/arch/arm/mach-aspeed/flash.c
>> +++ b/arch/arm/mach-aspeed/flash.c
>> @@ -124,6 +124,22 @@ flash_info_t 
>> flash_info[CONFIG_SYS_MAX_FLASH_BANKS];               /* FLASH chips 
>> info */
>>  /* specificspi */
>>  #define SpecificSPI_N25Q512    0x00000001
>> 
>> +#ifdef CONFIG_FLASH_CFI_MTD
>> +static uint flash_verbose=1;
>> +void flash_set_verbose(uint v)
>> +{
>> +       flash_verbose = v;
>> +}
>> +
>> +unsigned long flash_sector_size(flash_info_t *info, flash_sect_t 
>> sect)
>> +{
>> +       if (sect != (info->sector_count - 1))
>> +               return info->start[sect + 1] - info->start[sect];
>> +       else
>> +               return info->start[0] + info->size - 
>> info->start[sect];
>> +}
> 
> This function looks like it's copied from cfi_flash.c (line 197).
> 
> Can you explain why we're duplicating it here?

Yes, it's duplicated :) . What I understood from Milton is that this 
function would be
available if we enabled the CONFIG_FLASH_CFI_DRIVER, but we don't want 
to enable
the driver as this would cause some collisions, we just want to enable
CONFIG_FLASH_CFI_MTD so these functions are the only ones needed that 
the driver
would provide.

> 
>> +#endif
>> +
>>  
>> /*-----------------------------------------------------------------------*/
>>  static u32 ast_spi_calculate_divisor(u32 max_speed_hz)
>>  {
>> @@ -1372,6 +1388,10 @@ unsigned long flash_init (void)
>>                        flash_get_info(CONFIG_ENV_ADDR_REDUND));
>>  #endif
>> 
>> +#ifdef CONFIG_FLASH_CFI_MTD
>> +       cfi_mtd_init();
>> +#endif
>> +
>>         return (size);
>>  }
>> 
>> --
>> 1.8.2.2
>> 
