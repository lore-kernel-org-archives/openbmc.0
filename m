Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQ0pc1jsfzDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 04:47:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HHhgBb065790
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 12:47:18 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28p5js0qs7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 12:47:17 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 10:47:17 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 10:47:15 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 5C5EF1FF0026;
 Fri, 17 Feb 2017 10:46:52 -0700 (MST)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HHlE0B14877162; Fri, 17 Feb 2017 10:47:14 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B517BE040;
 Fri, 17 Feb 2017 10:47:14 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 0AC9DBE047;
 Fri, 17 Feb 2017 10:47:13 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 4/5] drivers/fsi: Add FSI bus error cleanup
To: Joel Stanley <joel@jms.id.au>, Edward James <eajames@us.ibm.com>
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-5-cbostic@linux.vnet.ibm.com>
 <CACPK8Xf39MwbGQeHNQAGnqZn-tdroOhvMtuSkuE7yPxi9XXabQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 17 Feb 2017 11:47:13 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf39MwbGQeHNQAGnqZn-tdroOhvMtuSkuE7yPxi9XXabQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021717-0028-0000-0000-000007138DA2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006634; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00823344; UDB=6.00402892; IPR=6.00600790; 
 BA=6.00005148; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014326; XFM=3.00000011;
 UTC=2017-02-17 17:47:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021717-0029-0000-0000-000033A9BEB0
Message-Id: <ad8a67a7-5b39-843f-d5d4-2eb9c928e0f2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170164
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
X-List-Received-Date: Fri, 17 Feb 2017 17:47:20 -0000



On 2/17/17 6:55 AM, Joel Stanley wrote:
> On Fri, Feb 17, 2017 at 8:34 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> On detect of bus fails attempt to clean them up and try the
>> command again.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/fsi/fsi-master-gpio.c | 100 +++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 85 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
>> index 92af53d..bb3983c 100644
>> --- a/drivers/fsi/fsi-master-gpio.c
>> +++ b/drivers/fsi/fsi-master-gpio.c
>> @@ -67,8 +67,16 @@
>>
>>   #define        FSI_MASTER_GPIO_LINK_SIZE       0x00800000
>>
>> +static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>> +               uint8_t slave, uint32_t addr, void *val, size_t size);
>> +static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>> +               uint8_t slave, uint32_t addr, const void *val, size_t size);
>> +static int fsi_master_gpio_break(struct fsi_master *_master, int link);
>> +
>>   static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);     /* lock around fsi commands */
>>
>> +uint8_t in_err_cleanup;
>> +
>>   struct fsi_master_gpio {
>>          struct fsi_master       master;
>>          struct gpio_desc        *gpio_clk;
>> @@ -358,24 +366,85 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
>>          cmd->msg >>= (64 - cmd->bits);
>>   }
>>
>> +/*
>> + * Clean up the FSI bus path on detection of error.
>> + * todo: get rid of magic numbers
>> + */
>> +static void fsi_master_gpio_handle_error(struct fsi_master_gpio *master,
>> +                                       uint32_t addr)
>> +{
>> +       uint32_t smode = 0xa0ff0100;
> I was wondering what a smode is?
Hi Joel,

smode is the Slave Mode register.   I know, its a hack to directly 
access the slave registers from the hub code.  The next revision I'll 
put a bit more thought into how to manage this.

>> +
>> +       /* Avoid nested error handling */
>> +       if (in_err_cleanup)
>> +               return;
>> +
>> +       in_err_cleanup = 1;
> This locking is racy. Instead use a atomic type for in_err_cleanup,
> declared in the scope of fsi_master_gpio_handle_error.

Will change.
>> +       fsi_master_gpio_break(&master->master, 0);
>> +       udelay(200);
>> +
>> +       /* Set slave ID in smode */
>> +       fsi_master_gpio_write(&master->master, 0, 0, 0x800, &smode,
>> +                               sizeof(smode));
>> +
>> +       /* Reset the MFSI bridge */
>> +       smode = 0xc0000000;
>> +       fsi_master_gpio_write(&master->master, 0, 0, 0x35D0, &smode,
>> +                               sizeof(smode));
>> +
>> +       if (addr >= 0x80000) {
>> +
>> +               /*
>> +                * Break to hub link 1
>> +                * todo: make this handle more arbitrary link topologies
>> +                */
>> +               smode = 0xc0de0000;
>> +               fsi_master_gpio_write(&master->master, 0, 0, 0x100004, &smode,
>> +                                       sizeof(smode));
>> +
>> +               smode = 0xa0ff0100;
>> +               fsi_master_gpio_write(&master->master, 0, 0, 0x100800, &smode,
>> +                                       sizeof(smode));
>> +       }
>> +       in_err_cleanup = 0;
>> +}
>> +
>> +static int send_command(struct fsi_master_gpio *master,
>> +                       struct fsi_gpio_msg *cmd, uint8_t expected,
>> +                       size_t size, void *val)
>> +{
>> +       unsigned long flags;
>> +       int rc;
>> +
>> +       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
>> +       serial_out(master, cmd);
>> +       echo_delay(master);
>> +       rc = poll_for_response(master, expected, size, val);
>> +       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
>> +
>> +       return rc;
>> +}
>> +
>>   static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>>                  uint8_t slave, uint32_t addr, void *val, size_t size)
>>   {
>>          struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>>          struct fsi_gpio_msg cmd;
>>          int rc;
>> -       unsigned long flags;
>>
>>          if (link != 0)
>>                  return -ENODEV;
>>
>>          build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
>> -
>> -       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
>> -       serial_out(master, &cmd);
>> -       echo_delay(master);
>> -       rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
>> -       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
> I see you've pulled the guts of this function out into send_command.
> It would have made it easier to follow if that refactoring was in it's
> own patch, and the error handling was introduced afterwards.
One reason I left the send_command refactor in with the rest of this 
patch is that if I didn't then I'd have several locations in the file 
that do the same sequence of steps - itself a cause for a review 
comment.  Guess breaking it out in a separate patch is a preferable 
approach in the interest of making the code more review friendly, will 
change.

>> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +       if (rc) {
>> +               fsi_master_gpio_handle_error(master, addr);
>> +
>> +               /* Try again */
>> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +               if (rc)
>> +                       fsi_master_gpio_handle_error(master, addr);
>> +       }
>>
>>          return rc;
>>   }
>> @@ -386,18 +455,20 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>>          struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>>          struct fsi_gpio_msg cmd;
>>          int rc;
>> -       unsigned long flags;
>>
>>          if (link != 0)
>>                  return -ENODEV;
>>
>>          build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
>> -
>> -       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
>> -       serial_out(master, &cmd);
>> -       echo_delay(master);
>> -       rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
>> -       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
>> +       rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>> +       if (rc) {
>> +               fsi_master_gpio_handle_error(master, addr);
>> +
>> +               /* Try again */
>> +               rc = send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>> +               if (rc)
>> +                       fsi_master_gpio_handle_error(master, addr);
>> +       }
>>
>>          return rc;
>>   }
>> @@ -480,7 +551,6 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>>          master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>>          if (!master)
>>                  return -ENOMEM;
>> -       master->master.dev = &pdev->dev;
> I'm not sure why you're making this change?

This was related to a change earlier in the patch set.  It doesn't 
belong in this one.  Will fix.

Thanks,

Chris
>
>>          gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
>>          if (IS_ERR(gpio)) {
>> --
>> 1.8.2.2
>>
