Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCJWW5GVPzDrWD
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 23:57:43 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6JDshUo056628
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 09:57:41 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bt7xbapeq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 09:57:41 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 19 Jul 2017 09:57:39 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 19 Jul 2017 09:57:38 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6JDvbKL18874392; Wed, 19 Jul 2017 13:57:37 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2117FB204D;
 Wed, 19 Jul 2017 09:55:07 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id A0079B2046;
 Wed, 19 Jul 2017 09:55:06 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] i2c: fsi: Add SMBUS emulation
From: Eddie James <eajames@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames.ibm@gmail.com>, Edward James <eajames@us.ibm.com>
References: <20170706064443.16972-1-joel@jms.id.au>
 <CACPK8XfxufScBjxK5_V9Hz3aerZLxg6WFvK_eZfhB0nH1NAs1g@mail.gmail.com>
 <ed70c991-112f-265d-8712-4a28173ebc97@linux.vnet.ibm.com>
Date: Wed, 19 Jul 2017 08:57:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <ed70c991-112f-265d-8712-4a28173ebc97@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17071913-0024-0000-0000-000002B294C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007387; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889827; UDB=6.00444510; IPR=6.00669999; 
 BA=6.00005479; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016274; XFM=3.00000015;
 UTC=2017-07-19 13:57:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071913-0025-0000-0000-000044CE5009
Message-Id: <30c2195d-3767-e0ff-e28c-91af9839d389@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-19_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707190226
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
X-List-Received-Date: Wed, 19 Jul 2017 13:57:44 -0000



On 07/19/2017 08:40 AM, Eddie James wrote:
>
>
> On 07/19/2017 04:45 AM, Joel Stanley wrote:
>> On Thu, Jul 6, 2017 at 4:14 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> Userspace expects this to be enabled. For example, it is required for
>>> using i2cdetect.

FYI, i2cget/i2cset don't seem to work with these i2c busses, as those 
tools don't have 10-bit address support... Not sure how i2cdetect 
behaves with that. I have been using 
https://github.com/eddiejames/fsidbg to access those devices for debug 
purposes.

Thanks,
Eddie

>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> What do you think Eddie?
>
> Sorry, forgot about this one. Looks good, thanks.
>
> Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
>
>>
>>> ---
>>>   drivers/i2c/busses/i2c-fsi.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-fsi.c 
>>> b/drivers/i2c/busses/i2c-fsi.c
>>> index d5135b4bc607..952cf8f392b4 100644
>>> --- a/drivers/i2c/busses/i2c-fsi.c
>>> +++ b/drivers/i2c/busses/i2c-fsi.c
>>> @@ -467,7 +467,8 @@ static int fsi_i2c_xfer(struct i2c_adapter 
>>> *adap, struct i2c_msg *msgs,
>>>
>>>   static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
>>>   {
>>> -       return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | 
>>> I2C_FUNC_10BIT_ADDR;
>>> +       return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | 
>>> I2C_FUNC_10BIT_ADDR
>>> +               | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>>>   }
>>>
>>>   static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
>>> -- 
>>> 2.13.2
>>>
>
