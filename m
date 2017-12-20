Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1zVx1WQbzF105
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 02:40:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBKFds8O101525
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 10:40:22 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2eyqxp2g4s-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 10:40:22 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 20 Dec 2017 08:40:21 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Dec 2017 08:40:18 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBKFeHWg9503228; Wed, 20 Dec 2017 08:40:17 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A96D2C6047;
 Wed, 20 Dec 2017 08:40:17 -0700 (MST)
Received: from [9.80.197.79] (unknown [9.80.197.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id EB64EC6037;
 Wed, 20 Dec 2017 08:40:16 -0700 (MST)
Subject: Re: [PATCH linux dev-4.10] drivers: fsi: SBEFIFO: switch to workqueue
 instead of timer
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1513628014-16656-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeFN63xR4BiGUM+xwVvMOf=sLUr81SJ-BQYVR_McPaASg@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 20 Dec 2017 09:40:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeFN63xR4BiGUM+xwVvMOf=sLUr81SJ-BQYVR_McPaASg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17122015-0016-0000-0000-000008008649
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008233; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00963011; UDB=6.00487153; IPR=6.00743004; 
 BA=6.00005752; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018643; XFM=3.00000015;
 UTC=2017-12-20 15:40:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17122015-0017-0000-0000-00003CB89235
Message-Id: <2a2cfa3a-7ccd-6445-0911-66986dd43b93@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712200225
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
X-List-Received-Date: Wed, 20 Dec 2017 15:40:25 -0000



On 12/19/2017 08:57 PM, Joel Stanley wrote:
> On Tue, Dec 19, 2017 at 6:43 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Some systems are experiencing scheduling problems; mod_timer can take up
>> to several seconds before the timer_function is executed, even if passed
>> the current jiffies.
> How did you work out that the timer wasn't firing?

Just tracking the time when mod_timer is called and the time when the 
poll_timer function begins executing.

>
> Can you describe the other tests you have done?

Did a bunch of OCC operations, some raw SCOM operations over SBE, 
repeated FSI scan/unscan, reboot the BMC while the host is up, and 
generated a checkstop on the host to see the SBEs stop working.

>
> It's not recommended to paper over something going wrong by changing
> over to a workqueue.

Agreed... But not sure what else can be done. My commit message does say 
that this "works around" the issue.

Thanks!
Eddie

>
> Cheers,
>
> Joel
>
>> Work around this by using sbefifo's own workqueue.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/fsi-sbefifo.c | 54 ++++++++++++++++++++++++++++-------------------
>>   1 file changed, 32 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>> index 0697a10..7b6842a 100644
>> --- a/drivers/fsi/fsi-sbefifo.c
>> +++ b/drivers/fsi/fsi-sbefifo.c
>> @@ -29,9 +29,9 @@
>>   #include <linux/sched.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>> -#include <linux/timer.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/wait.h>
>> +#include <linux/workqueue.h>
>>
>>   /*
>>    * The SBEFIFO is a pipe-like FSI device for communicating with
>> @@ -57,7 +57,7 @@
>>   #define SBEFIFO_MAX_RESCHDULE  msecs_to_jiffies(5000)
>>
>>   struct sbefifo {
>> -       struct timer_list poll_timer;
>> +       struct delayed_work work;
>>          struct fsi_device *fsi_dev;
>>          struct miscdevice mdev;
>>          wait_queue_head_t wait;
>> @@ -99,6 +99,8 @@ struct sbefifo_client {
>>          unsigned long f_flags;
>>   };
>>
>> +static struct workqueue_struct *sbefifo_wq;
>> +
>>   static DEFINE_IDA(sbefifo_ida);
>>
>>   static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
>> @@ -337,7 +339,7 @@ static void sbefifo_client_release(struct kref *kref)
>>                           */
>>                          set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>>                          sbefifo_get(sbefifo);
>> -                       if (mod_timer(&client->dev->poll_timer, jiffies))
>> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>                                  sbefifo_put(sbefifo);
>>                  }
>>          }
>> @@ -374,10 +376,11 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
>>          return NULL;
>>   }
>>
>> -static void sbefifo_poll_timer(unsigned long data)
>> +static void sbefifo_worker(struct work_struct *work)
>>   {
>>          static const unsigned long EOT_MASK = 0x000000ff;
>> -       struct sbefifo *sbefifo = (void *)data;
>> +       struct delayed_work *dwork = to_delayed_work(work);
>> +       struct sbefifo *sbefifo = container_of(dwork, struct sbefifo, work);
>>          struct sbefifo_buf *rbuf, *wbuf;
>>          struct sbefifo_xfr *xfr, *tmp;
>>          struct sbefifo_buf drain;
>> @@ -393,6 +396,7 @@ static void sbefifo_poll_timer(unsigned long data)
>>          if (!xfr)
>>                  goto out_unlock;
>>
>> +again:
>>          rbuf = xfr->rbuf;
>>          wbuf = xfr->wbuf;
>>
>> @@ -414,9 +418,8 @@ static void sbefifo_poll_timer(unsigned long data)
>>                  devn = sbefifo_dev_nwwriteable(sts);
>>                  if (devn == 0) {
>>                          /* No open slot for write.  Reschedule. */
>> -                       sbefifo->poll_timer.expires = jiffies +
>> -                               SBEFIFO_RESCHEDULE;
>> -                       add_timer(&sbefifo->poll_timer);
>> +                       queue_delayed_work(sbefifo_wq, &sbefifo->work,
>> +                                          SBEFIFO_RESCHEDULE);
>>                          goto out_unlock;
>>                  }
>>
>> @@ -468,9 +471,8 @@ static void sbefifo_poll_timer(unsigned long data)
>>                          }
>>
>>                          /* No data yet.  Reschedule. */
>> -                       sbefifo->poll_timer.expires = jiffies +
>> -                               SBEFIFO_RESCHEDULE;
>> -                       add_timer(&sbefifo->poll_timer);
>> +                       queue_delayed_work(sbefifo_wq, &sbefifo->work,
>> +                                          SBEFIFO_RESCHEDULE);
>>                          goto out_unlock;
>>                  } else {
>>                          xfr->wait_data_timeout = 0;
>> @@ -516,10 +518,12 @@ static void sbefifo_poll_timer(unsigned long data)
>>                  }
>>                  INIT_LIST_HEAD(&sbefifo->xfrs);
>>
>> -       } else if (eot && sbefifo_next_xfr(sbefifo)) {
>> -               sbefifo_get(sbefifo);
>> -               sbefifo->poll_timer.expires = jiffies;
>> -               add_timer(&sbefifo->poll_timer);
>> +       } else if (eot) {
>> +               xfr = sbefifo_next_xfr(sbefifo);
>> +               if (xfr) {
>> +                       wake_up_interruptible(&sbefifo->wait);
>> +                       goto again;
>> +               }
>>          }
>>
>>          sbefifo_put(sbefifo);
>> @@ -638,7 +642,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
>>                           * Fill the read buffer back up.
>>                           */
>>                          sbefifo_get(sbefifo);
>> -                       if (mod_timer(&client->dev->poll_timer, jiffies))
>> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>                                  sbefifo_put(sbefifo);
>>                  } else {
>>                          list_del(&xfr->client);
>> @@ -721,7 +725,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>                                                                   &n))) {
>>                          set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>>                          sbefifo_get(sbefifo);
>> -                       if (mod_timer(&sbefifo->poll_timer, jiffies))
>> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>                                  sbefifo_put(sbefifo);
>>
>>                          ret = -ERESTARTSYS;
>> @@ -741,7 +745,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>                              n)) {
>>                                  set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>>                                  sbefifo_get(sbefifo);
>> -                               if (mod_timer(&sbefifo->poll_timer, jiffies))
>> +                               if (!queue_work(sbefifo_wq,
>> +                                               &sbefifo->work.work))
>>                                          sbefifo_put(sbefifo);
>>                                  ret = -EFAULT;
>>                                  goto out;
>> @@ -768,7 +773,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>                   * Drain the write buffer.
>>                   */
>>                  sbefifo_get(sbefifo);
>> -               if (mod_timer(&client->dev->poll_timer, jiffies))
>> +               if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>                          sbefifo_put(sbefifo);
>>          }
>>
>> @@ -928,8 +933,7 @@ static int sbefifo_probe(struct device *dev)
>>                   sbefifo->idx);
>>
>>          /* This bit of silicon doesn't offer any interrupts... */
>> -       setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
>> -                   (unsigned long)sbefifo);
>> +       INIT_DELAYED_WORK(&sbefifo->work, sbefifo_worker);
>>
>>          sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
>>          sbefifo->mdev.fops = &sbefifo_fops;
>> @@ -982,7 +986,7 @@ static int sbefifo_remove(struct device *dev)
>>
>>          ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>>
>> -       if (del_timer_sync(&sbefifo->poll_timer))
>> +       if (cancel_delayed_work_sync(&sbefifo->work))
>>                  sbefifo_put(sbefifo);
>>
>>          sbefifo_put(sbefifo);
>> @@ -1010,11 +1014,17 @@ static int sbefifo_remove(struct device *dev)
>>
>>   static int sbefifo_init(void)
>>   {
>> +       sbefifo_wq = create_singlethread_workqueue("sbefifo");
>> +       if (!sbefifo_wq)
>> +               return -ENOMEM;
>> +
>>          return fsi_driver_register(&sbefifo_drv);
>>   }
>>
>>   static void sbefifo_exit(void)
>>   {
>> +       destroy_workqueue(sbefifo_wq);
>> +
>>          fsi_driver_unregister(&sbefifo_drv);
>>
>>          ida_destroy(&sbefifo_ida);
>> --
>> 1.8.3.1
>>
