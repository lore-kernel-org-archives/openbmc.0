Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xvv32xbLzDqJW
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 01:32:30 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x31EPRDM106547
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 10:32:27 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rkjrtq6nv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 10:32:25 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 1 Apr 2019 15:32:24 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Apr 2019 15:32:22 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x31EWLO822020166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Apr 2019 14:32:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9788FB2073;
 Mon,  1 Apr 2019 14:32:20 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F567B2065;
 Mon,  1 Apr 2019 14:32:20 +0000 (GMT)
Received: from [9.85.191.137] (unknown [9.85.191.137])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Apr 2019 14:32:20 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xd3YUmDZYOaXm7OBtM_PT9P=mCqdwozCjQCGB2opSrkow@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 1 Apr 2019 09:32:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd3YUmDZYOaXm7OBtM_PT9P=mCqdwozCjQCGB2opSrkow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040114-0040-0000-0000-000004DA3AEF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010855; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01182811; UDB=6.00619101; IPR=6.00963554; 
 MB=3.00026243; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-01 14:32:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040114-0041-0000-0000-000008E560A0
Message-Id: <6ff90bb3-f460-0670-5a63-ea1e9f4203d4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904010099
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
X-List-Received-Date: Mon, 01 Apr 2019 14:32:32 -0000


On 4/1/19 1:23 AM, Joel Stanley wrote:
> On Fri, 29 Mar 2019 at 21:15, Eddie James <eajames@linux.ibm.com> wrote:
>> The reset line is toggled by enabling the clocks, so it's not necessary
>> to manually toggle the reset as well.
> Hi Eddie,
>
> You didn't include a changelog here. You said last week that without
> the extra reset line toggle you would get interrupt storms. Can you
> fill us in on what changed?
I disabled interrupts before turning the clocks off. That wasn't the 
only issue, so I had to add the delay after turning clocks on in order 
to reliably get the resolution.
>
>>   #define INVALID_RESOLUTION_DELAY       msecs_to_jiffies(250)
>> -#define RESOLUTION_CHANGE_DELAY                msecs_to_jiffies(500)
>> -#define MODE_DETECT_TIMEOUT            msecs_to_jiffies(500)
>> -#define STOP_TIMEOUT                   msecs_to_jiffies(1000)
>> +#define RESOLUTION_CHANGE_DELAY                msecs_to_jiffies(750)
>> +#define MODE_DETECT_TIMEOUT            msecs_to_jiffies(1000)
>> +#define STOP_TIMEOUT                   msecs_to_jiffies(1500)
> These numbers changed but you didn't mention why.
Increasing these helped improve stability when changing resolution.
>
>>   #define DIRECT_FETCH_THRESHOLD         0x0c0000 /* 1024 * 768 */
>>
>>   #define VE_MAX_SRC_BUFFER_SIZE         0x8ca000 /* 1920 * 1200, 32bpp */
>> @@ -208,7 +207,6 @@ struct aspeed_video {
>>          void __iomem *base;
>>          struct clk *eclk;
>>          struct clk *vclk;
>> -       struct reset_control *rst;
>>
>>          struct device *dev;
>>          struct v4l2_ctrl_handler ctrl_handler;
>> @@ -483,19 +481,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>>          aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>>   }
>>
>> -static void aspeed_video_reset(struct aspeed_video *video)
>> -{
>> -       /* Reset the engine */
>> -       reset_control_assert(video->rst);
>> -
>> -       /* Don't usleep here; function may be called in interrupt context */
>> -       udelay(100);
>> -       reset_control_deassert(video->rst);
>> -}
>> -
>>   static void aspeed_video_off(struct aspeed_video *video)
>>   {
>> -       aspeed_video_reset(video);
>> +       /*
>> +        * Delay (and don't sleep in case in interrupt context) to let the
>> +        * clocks stabilize. Without this, mode detection sometimes fails.
>> +        * Possibly the registers don't update too soon after clocks are
>> +        * enabled.
>> +        */
>> +       udelay(100);
> How did you get to 100us?

I used the delay from between the reset assert/deassert used in the old 
aspeed_video_reset function.

>
>> @@ -1464,7 +1459,9 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>> -               aspeed_video_reset(video);
>> +               aspeed_video_off(video);
>> +               aspeed_video_on(video);
>> +
> This includes 5.1ms of sleeping in the clock driver's enable path; are
> you sure we need to turn clocks off and on again? Can we avoid the
> full reset by instead resetting the registers to a specific state?

In this case the engine has failed to stop streaming, so it's not 
obeying commands via the registers. Only option is to reset the engine. 
It's an error condition.

>
