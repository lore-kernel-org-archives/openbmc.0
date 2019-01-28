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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pM4Z1TXxzDqLs
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 07:42:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0SKPYSP174811
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 15:41:59 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qa7yv2v4p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 15:41:58 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 28 Jan 2019 20:41:58 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 28 Jan 2019 20:41:55 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0SKfsbC18284592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 28 Jan 2019 20:41:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B600C112064;
 Mon, 28 Jan 2019 20:41:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC2D112063;
 Mon, 28 Jan 2019 20:41:54 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jan 2019 20:41:54 +0000 (GMT)
Subject: Re: [PATCH dev-4.19 2/6] clk: aspeed: Setup video engine clocking
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1546552448-22621-1-git-send-email-eajames@linux.ibm.com>
 <1546552448-22621-3-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xd5b13RunesBwKzH41K0xwL1mko_JGxhrb6R6v1isDNAQ@mail.gmail.com>
 <236c763d-e0df-dae5-cdc9-2bcef56a4884@linux.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 28 Jan 2019 14:41:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <236c763d-e0df-dae5-cdc9-2bcef56a4884@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19012820-0052-0000-0000-0000037F8D14
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010494; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000277; SDB=6.01153134; UDB=6.00601165; IPR=6.00933497; 
 MB=3.00025328; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-28 20:41:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012820-0053-0000-0000-00005FA28388
Message-Id: <64ddefa0-0163-0bbe-054d-37c7f53be7cd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-28_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901280152
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 20:42:07 -0000



On 01/08/2019 09:12 AM, Eddie James wrote:
>
>
> On 01/07/2019 08:14 PM, Joel Stanley wrote:
>> On Fri, 4 Jan 2019 at 08:54, Eddie James <eajames@linux.ibm.com> wrote:
>>
>>>   static const struct aspeed_gate_data aspeed_gates[] = {
>>>          /*                               clk rst 
>>> name                 parent  flags */
>>> -       [ASPEED_CLK_GATE_ECLK] =        {  0, -1, 
>>> "eclk-gate",          "eclk", 0 }, /* Video Engine */
>>> +       [ASPEED_CLK_GATE_ECLK] =        {  0,  6, 
>>> "eclk-gate",          "eclk", 0 }, /* Video Engine */
>>>          [ASPEED_CLK_GATE_GCLK] =        {  1,  7, 
>>> "gclk-gate",          NULL,   0 }, /* 2D engine */
>>>          [ASPEED_CLK_GATE_MCLK] =        {  2, -1, 
>>> "mclk-gate",          "mpll", CLK_IS_CRITICAL }, /* SDRAM */
>>>          [ASPEED_CLK_GATE_VCLK] =        {  3,  6, 
>>> "vclk-gate",          NULL,   0 }, /* Video Capture */
>>> @@ -317,6 +338,7 @@ struct aspeed_reset {
>>>          [ASPEED_RESET_PECI]     = 10,
>>>          [ASPEED_RESET_I2C]      =  2,
>>>          [ASPEED_RESET_AHB]      =  1,
>>> +       [ASPEED_RESET_VIDEO]    =  6,
>> This is incorrect. You've already added the video reset to the video
>> clock, so the reset will be released by enabling the clock.
>
> I don't quite understand what's wrong about this. Why can't the clock 
> control and reset control both be done independently? Of course the 
> clock control overrides the reset control, but that's fine, presumably?

Hey Joel,

After some more testing, the driver NEEDS to have the reset available 
separately. The problem is that the clock driver doesn't enable reset 
before the clocks turn off, resulting in odd behavior. For example, I 
get endless IRQs and can't disable them by writing the engine registers, 
since the clocks are off.

What do you suggest here?

Thanks,
Eddie

>
> I'd rather have the reset available separately, so if this must be 
> changed, I'd prefer to drop the reset from the clock description. That 
> way the video driver doesn't need changes.
>
> Thanks,
> Eddie
>
>>
>> If this is the patch that went upstream then upstream needs to be 
>> fixed too.
>>
>
