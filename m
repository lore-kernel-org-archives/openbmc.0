Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vK1V127xtzDqBn
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 02:00:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v19ExSrN004249
 for <openbmc@lists.ozlabs.org>; Thu, 9 Feb 2017 10:00:39 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28gqghrntw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 10:00:38 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 9 Feb 2017 08:00:36 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Feb 2017 08:00:34 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id CCEFC3E40054;
 Thu,  9 Feb 2017 08:00:33 -0700 (MST)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v19F000L9961886; Thu, 9 Feb 2017 08:00:33 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA33CBE03B;
 Thu,  9 Feb 2017 08:00:33 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.5.200])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id EADD8BE056;
 Thu,  9 Feb 2017 08:00:31 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Adjust slave ID based on
 address in command send
To: Alistair Popple <alistair@popple.id.au>, Joel Stanley <joel@jms.id.au>
References: <20170208233350.56069-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XdP-imVAz1Jo+1pk-7HK0+xkqDswjK7nH+p02XoZh5RRA@mail.gmail.com>
 <12493797.UHNVbxk1rO@new-mexico>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 9 Feb 2017 09:00:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <12493797.UHNVbxk1rO@new-mexico>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020915-0016-0000-0000-0000061DC75B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006585; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819463; UDB=6.00400561; IPR=6.00596917; 
 BA=6.00005130; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014234; XFM=3.00000011;
 UTC=2017-02-09 15:00:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020915-0017-0000-0000-0000373F7B0A
Message-Id: <645a4ecb-ce9f-5218-6b26-a0dc6d5cfc3e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702090135
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
X-List-Received-Date: Thu, 09 Feb 2017 15:00:41 -0000



On 2/8/17 8:54 PM, Alistair Popple wrote:
> On Thu, 9 Feb 2017 10:48:13 AM Joel Stanley wrote:
>> On Thu, Feb 9, 2017 at 10:03 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>>> In order to access slave address ranges > 0x1FFFFF the slave ID
>>> must be adjusted accordingly in the command encoding:
>>>
>>> ID 0: 0x00000000 - 0x001FFFFF
>>> ID 1: 0x00200000 - 0x003FFFFF
>>> ID 2: 0x00400000 - 0x005FFFFF
>>> ID 3: 0x00600000 - 0x007FFFFF
>> Alistair and Eddie, can I please get an ack from both of you on this?
>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>> ---
>>>   drivers/fsi/fsi-master-gpio.c | 20 ++++++++++++++++----
>>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
>>> index 73d9985..428f3db 100644
>>> --- a/drivers/fsi/fsi-master-gpio.c
>>> +++ b/drivers/fsi/fsi-master-gpio.c
>>> @@ -30,7 +30,9 @@
>>>   #define        FSI_GPIO_CMD_READ       0x0400000000000000ULL
>>>   #define        FSI_GPIO_CMD_SLAVE_MASK 0xC000000000000000ULL
>>>   #define        FSI_GPIO_CMD_ADDR_SHIFT 37
>>> -#define        FSI_GPIO_CMD_ADDR_MASK  0x001FFFFF
>>> +#define        FSI_GPIO_CMD_ADR8_MASK  0x001FFFFF
>>> +#define        FSI_GPIO_CMD_ADR16_MASK 0x001FFFFE
>>> +#define        FSI_GPIO_CMD_ADR32_MASK 0x001FFFFC
>>>   #define        FSI_GPIO_CMD_SLV_SHIFT  62
>>>   #define        FSI_GPIO_CMD_SIZE_16    0x0000001000000000ULL
>>>   #define        FSI_GPIO_CMD_SIZE_32    0x0000003000000000ULL
>>> @@ -40,6 +42,9 @@
>>>   #define        FSI_GPIO_CMD_DFLT_LEN   28
>>>   #define        FSI_GPIO_CMD_CRC_SHIFT  60
>>>
>>> +#define        FSI_SLAVE_SHIFT         21
>>> +#define        FSI_SLAVE_MASK          0x3
>>> +
>>>   /* Bus errors */
>>>   #define        FSI_GPIO_ERR_BUSY       1       /* Slave stuck in busy state */
>>>   #define        FSI_GPIO_RESP_ERRA      2       /* Any (misc) Error */
>>> @@ -301,15 +306,17 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> Do we need to expose the slave-id outside of this function? Ie. does
> anything currently (or is expected to in future) pass anything other
> than slave=0 to this function? If not we should drop slave-id from the
> function parameters imho.
>
There are cases where the core scan code will need to pass in slave-id 3 
during
link initialization.  Also the core is structured to deal with the 
eventual case
where we may have multiple CFAMs per link so I think it makes sense to
keep it as a parameter.

>>>                  const void *data)
>>>   {
>>>          uint8_t crc;
>>> +       uint32_t addr_mask;
>>>
>>>          cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
>>>          cmd->msg = FSI_GPIO_CMD_DEFAULT;
>>>          cmd->msg |= mode;
>>> -       cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
>>> +       if (!slave)
>>> +               slave = (addr >> FSI_SLAVE_SHIFT) & FSI_SLAVE_MASK;
>>>          cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
>>> -       addr &= FSI_GPIO_CMD_ADDR_MASK;
>>> -       cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
>>> +
>>>          if (size == sizeof(uint8_t)) {
>>> +               addr_mask = FSI_GPIO_CMD_ADR8_MASK;
>>>                  if (data) {
>>>                          uint8_t cmd_data = *((uint8_t *)data);
>>>
>>> @@ -317,6 +324,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>>>                                  ((uint64_t)cmd_data) << FSI_GPIO_CMD_DT8_SHIFT;
>>>                  }
>>>          } else if (size == sizeof(uint16_t)) {
>>> +               addr_mask = FSI_GPIO_CMD_ADR16_MASK;
>>>                  cmd->msg |= FSI_GPIO_CMD_SIZE_16;
>>>                  if (data) {
>>>                          uint16_t cmd_data;
>>> @@ -326,6 +334,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>>>                                  ((uint64_t)cmd_data) << FSI_GPIO_CMD_DT16_SHIFT;
>>>                  }
>>>          } else {
>>> +               addr_mask = FSI_GPIO_CMD_ADR32_MASK;
>>>                  cmd->msg |= FSI_GPIO_CMD_SIZE_32;
>>>                  if (data) {
>>>                          uint32_t cmd_data;
>>> @@ -336,6 +345,9 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>>>                  }
>>>          }
>>>
>>> +       addr &= addr_mask;
> How is the masking of the address different now that you are setting
> the slave-id? Ie. this change looks more general than just setting the
> slave-id so is it fixing a different probelm? Or is somehow related to
> setting the slave-id?
>
Its not directly related to the slave ID.  I added this to ensure that 
any callers
that request odd alignments, i.e.  32 bit write aligned on address 0xFFFF is
properly masked.

Since it is separate conceptually I'll break this part out into a 
separate patch.

Thanks,
Chris

> Regards,
>
> Alistair
>
>>> +       cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
>>> +
>>>          if (mode == FSI_GPIO_CMD_WRITE)
>>>                  cmd->bits += (8 * size);
>>>
>>> --
>>> 1.8.2.2
>>>
