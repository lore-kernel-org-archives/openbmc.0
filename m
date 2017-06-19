Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ws3kM1Y3FzDqRW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 07:18:51 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5JLE78t139530
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 17:18:49 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b6cyemt6s-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 17:18:48 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 19 Jun 2017 17:18:47 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 19 Jun 2017 17:18:44 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5JLIiGb49217726; Mon, 19 Jun 2017 21:18:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FF8528048;
 Mon, 19 Jun 2017 17:18:38 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.1.249])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 8FEFB2804A;
 Mon, 19 Jun 2017 17:18:35 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2 3/3] drivers/hwmon: max31785 Set fan
 fault response based on dev tree
To: Joel Stanley <joel@jms.id.au>
References: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
 <20170615200033.67387-4-cbostic@linux.vnet.ibm.com>
 <CACPK8Xc-Sm1+jU3tXNnCqCFPCkojro75mtQm1+PkO7=ev2uz=w@mail.gmail.com>
 <97cde136-3c06-acc9-7f93-26f27fc50069@linux.vnet.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 19 Jun 2017 16:18:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <97cde136-3c06-acc9-7f93-26f27fc50069@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17061921-0044-0000-0000-00000355AE34
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007257; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877142; UDB=6.00436920; IPR=6.00657285; 
 BA=6.00005431; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015889; XFM=3.00000015;
 UTC=2017-06-19 21:18:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061921-0045-0000-0000-00000783B4D1
Message-Id: <0ccf139c-bb01-c48c-d04b-41517f7a636f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706190350
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
X-List-Received-Date: Mon, 19 Jun 2017 21:18:51 -0000



On 6/19/17 4:10 PM, Christopher Bostic wrote:
>
>
> On 6/16/17 1:18 AM, Joel Stanley wrote:
>> On Fri, Jun 16, 2017 at 5:30 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>>> Check for the optional device tree property 'fault-max-fan'.  If
>>> present, configure hardware for 100% PWM fan duty cycle on fault
>>> condition.
>>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>> ---
>>>   drivers/hwmon/max31785.c | 38 ++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
>>> index fc03b7c..a67d5e5 100644
>>> --- a/drivers/hwmon/max31785.c
>>> +++ b/drivers/hwmon/max31785.c
>>> @@ -38,6 +38,7 @@
>>>   #define MAX31785_REG_MFR_ID                    0x99
>>>   #define MAX31785_REG_MFR_MODEL                 0x9a
>>>   #define MAX31785_REG_MFR_REVISION              0x9b
>>> +#define MAX31785_REG_MFR_FAULT_RESP            0xd9
>>>   #define MAX31785_REG_MFR_FAN_CONFIG            0xf1
>>>   #define MAX31785_REG_READ_FAN_PWM              0xf3
>>>
>>> @@ -51,6 +52,9 @@
>>>   /* Fan Status register bits */
>>>   #define MAX31785_FAN_STATUS_FAULT_MASK         0x80
>>>
>>> +/* Fault response register bits */
>>> +#define MAX31785_FAULT_RESP_PIN_MONITOR                0x01
>> It's a bit, so use BIT(0).
>>
>> The bit is called "FAULT_PIN_MONITOR". Please use that naming in your 
>> code.
>
> Hi Joel,
>
> OK will make those updates.
>>
>>> +
>>>   /* Fan Command constants */
>>>   #define MAX31785_FAN_COMMAND_PWM_RATIO         40
>>>
>>> @@ -762,6 +766,36 @@ static int max31785_get_capabilities(struct 
>>> max31785 *data)
>>>          return 0;
>>>   }
>>>
>>> +static int max31785_init_fault_resp(struct i2c_client *client)
>>> +{
>>> +       struct device_node *np = client->dev.of_node;
>>> +       int page;
>>> +       int rc;
>>> +
>>> +       if (np && of_get_property(np, "fault-max-fan", NULL)) {
>>> +               /* TODO: number of fans/pages is platform dependent */
>>> +               for (page = 0; page < 4; page++) {
>> The datasheet says "this bit is only valid for pages 0 to 5. Other
>> pages return 0".
>>
>> Is there a reason you only apply it to the first four pages, and not
>> the fifth (index 4) and sixth (index 5)?
>
> Was thinking in terms of Witherspoon which only uses fans 0 - 3. 
> Clearly not a generic
> solution.
>>
>> If you intended to apply this for all 6 supported pages, you could set
>> page 255, and have the condition applied for all of the valid pages.
>
> I'll use this approach.
>

Hi Joel,

Actually, from the spec sheet I have on the max31785 it appears page 255 
doesn't allow access to the fault register, 0xd9.
My spec version is 19-5703; Rev 3; 8/12

Unless I missed something in a later revision I'll apply the fault mode 
for all 6 supported pages.

Thanks,
> Chris
>>
>> If you only set it for the first four pages on purpose then please add
>> a comment to say that. However, I think we should fix the binding so
>> the pages can be selected. I will review the bindings separately.
>>
>> Cheers,
>>
>> Joel
>>
>>
>>> +
>>> +                       /* set max fans on fault */
>>> +                       rc = max31785_set_page(client, page);
>>> +                       if (rc < 0)
>>> +                               return rc;
>>> +
>>> +                       rc = i2c_smbus_read_byte_data(client,
>>> + MAX31785_REG_MFR_FAULT_RESP);
>>> +                       if (rc < 0)
>>> +                               return rc;
>>> +
>>> +                       rc |= MAX31785_FAULT_RESP_PIN_MONITOR;
>>
>>
>>> +                       rc = i2c_smbus_write_byte_data(client,
>>> + MAX31785_REG_MFR_FAULT_RESP, rc);
>>> +               }
>>> +               return rc;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>   static int max31785_probe(struct i2c_client *client,
>>>                            const struct i2c_device_id *id)
>>>   {
>>> @@ -783,6 +817,10 @@ static int max31785_probe(struct i2c_client 
>>> *client,
>>>          data->client = client;
>>>          mutex_init(&data->lock);
>>>
>>> +       rc = max31785_init_fault_resp(client);
>>> +       if (rc)
>>> +               return rc;
>>> +
>>>          rc = max31785_init_fans(data);
>>>          if (rc)
>>>                  return rc;
>>> -- 
>>> 1.8.2.2
>>>
>
