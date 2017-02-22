Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTC016ggwzDq5x
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 09:36:33 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MMTZFa020720
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 17:36:31 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28shbhvw59-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 17:36:31 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 15:36:30 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 15:36:28 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id CB5CB1FF0028;
 Wed, 22 Feb 2017 15:36:04 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MMaRjX11993376; Wed, 22 Feb 2017 15:36:27 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 586976A03B;
 Wed, 22 Feb 2017 15:36:27 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 21E2C6A042;
 Wed, 22 Feb 2017 15:36:27 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v2 5/7] drivers/fsi: Add retry on bus error
 detect
To: Joel Stanley <joel@jms.id.au>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
 <CACPK8Xfn=VJJ9POR3oAo5ShggAaD0Xg0jRGZu-YmiJZkZMjn9w@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 16:36:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xfn=VJJ9POR3oAo5ShggAaD0Xg0jRGZu-YmiJZkZMjn9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022222-0008-0000-0000-0000074EA859
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006665; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825686; UDB=6.00404313; IPR=6.00603141; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014399; XFM=3.00000011;
 UTC=2017-02-22 22:36:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022222-0009-0000-0000-000040244795
Message-Id: <4518e2f0-faf1-387a-87e0-41fead2661aa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220201
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
X-List-Received-Date: Wed, 22 Feb 2017 22:36:34 -0000



On 2/21/17 7:00 PM, Joel Stanley wrote:
> On Wed, Feb 22, 2017 at 8:20 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> After each gpio master read/write check for bus errors.  If
>> errors detected then clean it up and retry the original operation
>> again.  If second attempt succeeds then don't report original
>> error to caller.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c        |  4 ++++
>>   drivers/fsi/fsi-master-gpio.c | 24 ++++++++++++++++++++++--
>>   drivers/fsi/fsi-master.h      |  3 +++
>>   3 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 360c02a..428675f 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -639,6 +639,10 @@ static int fsi_master_break(struct fsi_master *master, int link)
>>          return 0;
>>   }
>>
>> +void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
>> +{
>> +}
>> +
>>   static int fsi_master_scan(struct fsi_master *master)
>>   {
>>          int link, slave_id, rc;
>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
>> index 8aec538..5b502eb 100644
>> --- a/drivers/fsi/fsi-master-gpio.c
>> +++ b/drivers/fsi/fsi-master-gpio.c
>> @@ -381,7 +381,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>>                  return -ENODEV;
>>
>>          build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
>> -       return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +       if (rc) {
>> +               fsi_master_handle_error(&master->master, addr);
>> +
>> +               /* Try again */
>> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +               if (rc)
>> +                       fsi_master_handle_error(&master->master, addr);
>> +       }
>> +
>> +       return rc;
>>   }
>>
>>   static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>> @@ -395,7 +405,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>>                  return -ENODEV;
>>
>>          build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
>> -       return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>> +       if (rc) {
>> +               fsi_master_handle_error(&master->master, addr);
>> +
>> +               /* Try again */
> It's obvious from the code that we're trying again. You could change
> the comment to indicate why we are trying again.
>
>> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>> +               if (rc)
>> +                       fsi_master_handle_error(&master->master, addr);
>> +       }
> You're repeating yourself here. Perhaps a loop?
>
> You have the same sequence in fsi_master_gpio_read. It would be nice
> to not repeat the sequence.
>
>> +
>> +       return rc;
>>   }
>>
>>   /*
>> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
>> index 4a3176b..4ed416c 100644
>> --- a/drivers/fsi/fsi-master.h
>> +++ b/drivers/fsi/fsi-master.h
>> @@ -19,6 +19,8 @@
>>
>>   #include <linux/device.h>
>>
>> +#include "fsi-master.h"
> This looks wrong.
>
>> +
>>   /* Control Registers */
>>   #define FSI_MMODE              0x0             /* R/W: mode */
>>   #define FSI_MDLYR              0x4             /* R/W: delay */
>> @@ -85,6 +87,7 @@ struct fsi_master {
>>   extern int fsi_master_register(struct fsi_master *master);
>>   extern void fsi_master_unregister(struct fsi_master *master);
>>   extern int fsi_master_start_ipoll(struct fsi_master *master);
>> +extern void fsi_master_handle_error(struct fsi_master *master, uint32_t addr);
> Does this need to be added to the header?

Hi Joel,

Yes, since the gpio master is requiring a core function,  similar to 
fsi_master_register()/unregister()

Thanks,
Chris
>>   /**
>>    * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
>> --
>> 1.8.2.2
>>
