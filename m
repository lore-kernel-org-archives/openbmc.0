Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Yy5F6ZbBzDqWY
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 03:14:41 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x08FxErr076142
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jan 2019 11:14:39 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pvvwgr4kd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 11:14:39 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 8 Jan 2019 16:14:37 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 8 Jan 2019 16:14:35 -0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x08GEYOf27459832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Jan 2019 16:14:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DC87788C0;
 Tue,  8 Jan 2019 16:14:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E47E5788CB;
 Tue,  8 Jan 2019 16:14:33 +0000 (GMT)
Received: from oc6728276242.ibm.com (unknown [9.85.186.38])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jan 2019 16:14:33 +0000 (GMT)
Subject: Re: [PATCH dev-4.19 2/6] clk: aspeed: Setup video engine clocking
From: Eddie James <eajames@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1546552448-22621-1-git-send-email-eajames@linux.ibm.com>
 <1546552448-22621-3-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xd5b13RunesBwKzH41K0xwL1mko_JGxhrb6R6v1isDNAQ@mail.gmail.com>
 <236c763d-e0df-dae5-cdc9-2bcef56a4884@linux.ibm.com>
Date: Tue, 8 Jan 2019 10:14:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <236c763d-e0df-dae5-cdc9-2bcef56a4884@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19010816-8235-0000-0000-00000E471602
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010367; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000274; SDB=6.01143565; UDB=6.00595359; IPR=6.00923823; 
 MB=3.00025036; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-08 16:14:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010816-8236-0000-0000-00004400304F
Message-Id: <45ca3924-fdd1-dcd9-df42-92bd571bf7ac@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-08_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901080131
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
X-List-Received-Date: Tue, 08 Jan 2019 16:14:42 -0000



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
>
> I'd rather have the reset available separately, so if this must be 
> changed, I'd prefer to drop the reset from the clock description. That 
> way the video driver doesn't need changes.

Nevermind, clock start requires the reset toggle according to the spec, 
so can't drop that...

>
> Thanks,
> Eddie
>
>>
>> If this is the patch that went upstream then upstream needs to be 
>> fixed too.
>>
>
