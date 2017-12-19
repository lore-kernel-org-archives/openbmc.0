Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1TFN07TqzF07K
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 06:56:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBJJscqW088817
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 14:56:53 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ey7hv5fhh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 14:56:53 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 19 Dec 2017 12:56:52 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Dec 2017 12:56:48 -0700
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBJJumei6488526; Tue, 19 Dec 2017 12:56:48 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59DEA78038;
 Tue, 19 Dec 2017 12:56:48 -0700 (MST)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id BA16178037;
 Tue, 19 Dec 2017 12:56:47 -0700 (MST)
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix integer overflow in
 multiplication
To: Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: "Edward A. James" <eajames@us.ibm.com>, =?UTF-8?B?6Z+p56yR?=
 <xiao.han@powercore.com.cn>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 qiaoling.qin@powercore.com.cn
References: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xd2Pcb8Z_2PP-B+aALLS9Z1Pc5tvX=2+1qZUbCeVyRUag@mail.gmail.com>
 <0d01c184-8ae0-6cbb-b222-d6c22c15ea55@linux.vnet.ibm.com>
 <CACPK8XdHXTYiPYfGvE3=qD_BaGMK_=oBTLaV-VV8UsWHvXfqRQ@mail.gmail.com>
 <CAARXrtmsMO74xB-Cb3gsxBHGJCf=QtuZzuzRFo+FU1dWSKVvvw@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 19 Dec 2017 13:56:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtmsMO74xB-Cb3gsxBHGJCf=QtuZzuzRFo+FU1dWSKVvvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17121919-0012-0000-0000-0000157C73D2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008228; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00962623; UDB=6.00486921; IPR=6.00742617; 
 BA=6.00005752; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018629; XFM=3.00000015;
 UTC=2017-12-19 19:56:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121919-0013-0000-0000-000050B9ED25
Message-Id: <c07b8658-41a4-8e83-e4b5-f9dd262e9a45@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712190285
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 19:56:56 -0000



On 12/18/2017 08:27 PM, Lei YU wrote:
> Hi Eddie,
>
> Except for the values for power, the value used for temperature is u16
> and overflows
> as well.
> Powercore reports that if the temperature goes over 65 degrees, the
> value overflows
> obviously as long as it is over 65535.
>
> Could you fix this as well?

Yep, thanks for spotting that.

Eddie

>
> Thanks!
>
> --
> BRs,
> Lei YU
>
> On Mon, Dec 18, 2017 at 10:11 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Sat, Dec 9, 2017 at 8:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>>
>>> On 12/08/2017 12:16 AM, Joel Stanley wrote:
>>>> On Thu, Dec 7, 2017 at 5:49 AM, Eddie James <eajames@linux.vnet.ibm.com>
>>>> wrote:
>>>>> --- a/drivers/hwmon/occ/common.c
>>>>> +++ b/drivers/hwmon/occ/common.c
>>>>> @@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
>>>>>                                   struct device_attribute *attr, char
>>>>> *buf)
>>>>>    {
>>>>>           int rc;
>>>>> -       u32 val = 0;
>>>>> +       u64 val = 0;
>>>>>           struct power_sensor_1 *power;
>>>>>           struct occ *occ = dev_get_drvdata(dev);
>>>>>           struct occ_sensors *sensors = &occ->sensors;
>>>>> @@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
>>>>>                   val = get_unaligned_be32(&power->accumulator);
>>>>>                   break;
>>>>>           case 3:
>>>>> -               val = get_unaligned_be16(&power->value) * 1000000;
>>>>> +               val = (u64)get_unaligned_be16(&power->value) *
>>>>> 1000000ULL;
>>>> I don't think these casts are required, are they?
>>>
>>> I'm not at all sure. I didn't think adding ULL was required here, but
>>> apparently it is. I don't really trust GCC...
>> Sorry, I thought you were joking here. GCC is behaving as it should.
>> Hit me up on IRC for an explanation sometime.
>>
>> Can you resend without the casts?
>>
>> Cheers,
>>
>> Joel
