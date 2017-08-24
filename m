Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd8gy4kxlzDrJs
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 13:20:46 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7O3JYuX022468
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 23:20:44 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2chmm3r7p1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 23:20:43 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 23 Aug 2017 23:20:43 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 23 Aug 2017 23:20:41 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7O3Kd1J24969326; Thu, 24 Aug 2017 03:20:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4119112034;
 Wed, 23 Aug 2017 23:20:28 -0400 (EDT)
Received: from [9.85.184.109] (unknown [9.85.184.109])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id 5645C112054;
 Wed, 23 Aug 2017 23:20:28 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add optional MTD and UBI
 support to ast-g4 and ast-g5
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
In-Reply-To: <1503541899.4231.3.camel@aj.id.au>
Date: Wed, 23 Aug 2017 22:18:31 -0500
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
References: <1503538442.4231.1.camel@aj.id.au>
 <1503540105-33337-1-git-send-email-anoo@linux.vnet.ibm.com>
 <1503541899.4231.3.camel@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17082403-2213-0000-0000-0000020E610E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007600; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000224; SDB=6.00906770; UDB=6.00454516; IPR=6.00686970; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016839; XFM=3.00000015;
 UTC=2017-08-24 03:20:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082403-2214-0000-0000-000057515971
Message-Id: <F4495991-D24F-4F9B-BA48-1EFDA526B5A7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-24_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708240053
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
X-List-Received-Date: Thu, 24 Aug 2017 03:20:47 -0000


> On Aug 23, 2017, at 9:31 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Wed, 2017-08-23 at 21:01 -0500, Adriana Kobylak wrote:
>> Add MTD and UBI support conditioned to having MTDPARTS_DEFAULT =
defined.
>> This allows platforms to enable this support if desired without
>> adding it by default since it increases the size of u-boot by about =
70kB.
>>=20
>>> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
>> ---
>>  include/configs/ast-g4-ncsi.h | 10 ++++++++++
>>  include/configs/ast-g4-phy.h  | 10 ++++++++++
>>  include/configs/ast-g5-ncsi.h | 10 ++++++++++
>>  include/configs/ast-g5-phy.h  | 10 ++++++++++
>>  4 files changed, 40 insertions(+)
>=20
> So my understanding is instead of duplicating the additions we can put
> the them once in include/configs/ast-common.h:
>=20
>    $ grep 'ast-common.h' include/configs/ast*
>    include/configs/ast-g4-ncsi.h:#include <configs/ast-common.h>
>    include/configs/ast-g4-phy.h:#include <configs/ast-common.h>
>    include/configs/ast-g5-ncsi.h:#include <configs/ast-common.h>
>    include/configs/ast-g5-phy.h:#include <configs/ast-common.h>
>=20
> Sorry for the back-and-forth, but I think that would be a cleaner
> solution.
>=20
Yep, agree. Thanks Andrew for the feedback, better to do it right the =
first time. Will be sending a new patch in a min.

> Cheers,
>=20
> Andrew
>=20
>>=20
>> diff --git a/include/configs/ast-g4-ncsi.h =
b/include/configs/ast-g4-ncsi.h
>> index 8191dfc..0ba5a43 100644
>> --- a/include/configs/ast-g4-ncsi.h
>> +++ b/include/configs/ast-g4-ncsi.h
>> @@ -26,4 +26,14 @@
>>>  #define CONFIG_CPU_420			1
>>>  #define CONFIG_DRAM_528			1
>> =20
>> +/* Optional MTD and UBI */
>> +#ifdef MTDPARTS_DEFAULT
>> +#define CONFIG_FLASH_CFI_MTD
>> +#define CONFIG_CMD_UBI
>> +#define CONFIG_RBTREE
>> +#define CONFIG_MTD_DEVICE
>> +#define CONFIG_MTD_PARTITIONS
>> +#define CONFIG_CMD_MTDPARTS
>> +#endif
>> +
>>>  #endif	/* __AST_G4_NCSI_CONFIG_H */
>> diff --git a/include/configs/ast-g4-phy.h =
b/include/configs/ast-g4-phy.h
>> index baa522f..8b26fa6 100644
>> --- a/include/configs/ast-g4-phy.h
>> +++ b/include/configs/ast-g4-phy.h
>> @@ -28,4 +28,14 @@
>>>  #define CONFIG_CPU_420			1
>>>  #define CONFIG_DRAM_528			1
>> =20
>> +/* Optional MTD and UBI */
>> +#ifdef MTDPARTS_DEFAULT
>> +#define CONFIG_FLASH_CFI_MTD
>> +#define CONFIG_CMD_UBI
>> +#define CONFIG_RBTREE
>> +#define CONFIG_MTD_DEVICE
>> +#define CONFIG_MTD_PARTITIONS
>> +#define CONFIG_CMD_MTDPARTS
>> +#endif
>> +
>>>  #endif	/* __AST_G4_NCSI_CONFIG_H */
>> diff --git a/include/configs/ast-g5-ncsi.h =
b/include/configs/ast-g5-ncsi.h
>> index 12d6684..167835f 100644
>> --- a/include/configs/ast-g5-ncsi.h
>> +++ b/include/configs/ast-g5-ncsi.h
>> @@ -28,4 +28,14 @@
>> =20
>>  #define CONFIG_HW_WATCHDOG
>> =20
>> +/* Optional MTD and UBI */
>> +#ifdef MTDPARTS_DEFAULT
>> +#define CONFIG_FLASH_CFI_MTD
>> +#define CONFIG_CMD_UBI
>> +#define CONFIG_RBTREE
>> +#define CONFIG_MTD_DEVICE
>> +#define CONFIG_MTD_PARTITIONS
>> +#define CONFIG_CMD_MTDPARTS
>> +#endif
>> +
>>>  #endif	/* __AST_G5_NCSI_CONFIG_H */
>> diff --git a/include/configs/ast-g5-phy.h =
b/include/configs/ast-g5-phy.h
>> index 62ddb84..c3e2552 100644
>> --- a/include/configs/ast-g5-phy.h
>> +++ b/include/configs/ast-g5-phy.h
>> @@ -30,4 +30,14 @@
>>  /* platform.S */
>>>>  #define	CONFIG_DRAM_ECC_SIZE		0x10000000
>> =20
>> +/* Optional MTD and UBI */
>> +#ifdef MTDPARTS_DEFAULT
>> +#define CONFIG_FLASH_CFI_MTD
>> +#define CONFIG_CMD_UBI
>> +#define CONFIG_RBTREE
>> +#define CONFIG_MTD_DEVICE
>> +#define CONFIG_MTD_PARTITIONS
>> +#define CONFIG_CMD_MTDPARTS
>> +#endif
>> +
>>>  #endif	/* __AST_G5_PHY_CONFIG_H */
