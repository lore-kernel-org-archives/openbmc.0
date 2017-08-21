Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbbbf0G0RzDqgy
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 00:26:37 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7LEO9rT057308
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 10:26:35 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cg1548k38-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 10:26:34 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 21 Aug 2017 10:26:34 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 Aug 2017 10:26:31 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7LEQVXB26411096; Mon, 21 Aug 2017 14:26:31 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A629E124035;
 Mon, 21 Aug 2017 10:23:52 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id F068A12403D;
 Mon, 21 Aug 2017 10:23:51 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Aug 2017 09:28:56 -0500
From: anoo <anoo@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Rick Altherr <raltherr@google.com>, Maxim Sloyko <maxims@google.com>,
 Milton Miller II <miltonm@us.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, joel.stan@gmail.com
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD and UBI support to
 ast-g5
In-Reply-To: <CACPK8Xc1zk+uYf-ZJTPZM83u_6i8aQRNNUogk2PGKhGjSBntEQ@mail.gmail.com>
References: <1502849350-40252-1-git-send-email-anoo@linux.vnet.ibm.com>
 <CACPK8Xc1zk+uYf-ZJTPZM83u_6i8aQRNNUogk2PGKhGjSBntEQ@mail.gmail.com>
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 17082114-0048-0000-0000-000001D6BF5C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007585; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00905564; UDB=6.00453792; IPR=6.00685767; 
 BA=6.00005543; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016791; XFM=3.00000015;
 UTC=2017-08-21 14:26:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082114-0049-0000-0000-0000424DC015
Message-Id: <28e7b011044a11f75c4d1a2fd0febee1@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 21 Aug 2017 14:26:38 -0000

Thanks Joel, answers inline below.

On 2017-08-21 06:03, Joel Stanley wrote:
> On Wed, Aug 16, 2017 at 11:39 AM, Adriana Kobylak
> <anoo@linux.vnet.ibm.com> wrote:
>> Add MTD and UBI support to the default g5 include, conditioned to
>> having MTDPARTS_DEFAULT defined.
> 
> Can you explain what we're planning on using mtdparts for? As I
> understand it this is for specifying the mtd partitions on the command
> line.
> 
> Are you proposing to move away from the device tree description?

mtdparts is needed by u-boot to find the kernel in a ubi volume, for 
example
the u-boot command "ubi part" requires it.
Implementing the device tree in u-boot could be a future possibility but
the current version of u-boot in openbmc can't read from any other chips
besides the bmc, so we need to duplicate the device tree layout of the 
bmc
chip in u-boot for now.

> 
>> This allows platforms to enable this support if desired without
>> adding it by default since it increases the size of u-boot.
> 
> Do you have numbers? It's good to keep track in case we need to go
> back and save space in the future.

After you mentioned that you saw u-boot increasing by 122kB with an 
earlier
patch, I removed UBIFS since it wasn't needed, bringing the increase 
down
by 50kB. The new size is 302kB (increase of 72kB over current size).

> 
>> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
>> ---
>>  include/configs/ast-g5-ncsi.h | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/include/configs/ast-g5-ncsi.h 
>> b/include/configs/ast-g5-ncsi.h
>> index 12d6684..b126e6e 100644
>> --- a/include/configs/ast-g5-ncsi.h
>> +++ b/include/configs/ast-g5-ncsi.h
>> @@ -28,4 +28,14 @@
>> 
>>  #define CONFIG_HW_WATCHDOG
>> 
>> +/* MTD and UBI */
>> +#ifdef MTDPARTS_DEFAULT
>> +#define CONFIG_FLASH_CFI_MTD
>> +#define CONFIG_CMD_UBI
> 
> I thought Milton mentioned today that we didn't need to enable the UBI
> command in u-boot, but I may have misunderstood.

It is needed since the kernel is in ubi volume.

> 
>> +#define CONFIG_RBTREE
>> +#define CONFIG_MTD_DEVICE
>> +#define CONFIG_MTD_PARTITIONS
>> +#define CONFIG_CMD_MTDPARTS
>> +#endif
>> +
>>  #endif /* __AST_G5_NCSI_CONFIG_H */
>> --
>> 1.8.2.2
>> 
