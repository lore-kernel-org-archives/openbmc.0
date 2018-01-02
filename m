Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zB1CJ2sFbzF0Wq
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2018 04:24:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 w02HOC3V019417
 for <openbmc@lists.ozlabs.org>; Tue, 2 Jan 2018 12:24:41 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2f88q0x67d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jan 2018 12:24:41 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 2 Jan 2018 12:24:40 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 Jan 2018 12:24:38 -0500
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w02HOcmO47775980; Tue, 2 Jan 2018 17:24:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D76B912403D;
 Tue,  2 Jan 2018 12:21:32 -0500 (EST)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 59113124037;
 Tue,  2 Jan 2018 12:21:32 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10] drivers: fsi: SBEFIFO: switch to workqueue
 instead of timer
To: Joel Stanley <joel@jms.id.au>, npiggin@gmail.com
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1513628014-16656-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeFN63xR4BiGUM+xwVvMOf=sLUr81SJ-BQYVR_McPaASg@mail.gmail.com>
 <CACPK8XcFMMippVPMuNvv_JnJjX4BTreNy28Ue01JSaiQSUNoQQ@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 2 Jan 2018 11:24:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcFMMippVPMuNvv_JnJjX4BTreNy28Ue01JSaiQSUNoQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18010217-2213-0000-0000-00000252B145
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008306; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00969245; UDB=6.00490780; IPR=6.00749220; 
 BA=6.00005764; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018833; XFM=3.00000015;
 UTC=2018-01-02 17:24:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18010217-2214-0000-0000-0000589CB781
Message-Id: <1a83aebf-5cde-9d4e-db6d-b48b80ea61be@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-02_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801020251
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
X-List-Received-Date: Tue, 02 Jan 2018 17:24:44 -0000



On 12/19/2017 09:06 PM, Joel Stanley wrote:
> On Wed, Dec 20, 2017 at 1:27 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Tue, Dec 19, 2017 at 6:43 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Some systems are experiencing scheduling problems; mod_timer can take up
>>> to several seconds before the timer_function is executed, even if passed
>>> the current jiffies.
>> How did you work out that the timer wasn't firing?
>>
>> Can you describe the other tests you have done?
>>
>> It's not recommended to paper over something going wrong by changing
>> over to a workqueue.
> Nick pointed me to this fix, which was merged in 4.13:
>
>   2fe59f507a6 ("timers: Fix excessive granularity of new timers after a
> nohz idle")
>
> Can you cherry pick that into your tree and report the numbers that
> you see before and after the patch?

Just tried the fix out. I didn't see any difference unfortunately. I 
still get at least 250ms between calling mod_timer and the timer 
function starting. Just measuring with ftrace.

Thanks for the suggestion. It's possible the IPMI latency improved with 
the patch, but I don't know how to test that part.

Thanks,
Eddie

>
>>> Work around this by using sbefifo's own workqueue.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> ---
>>>   drivers/fsi/fsi-sbefifo.c | 54 ++++++++++++++++++++++++++++-------------------
>>>   1 file changed, 32 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>>> index 0697a10..7b6842a 100644
>>> --- a/drivers/fsi/fsi-sbefifo.c
>>> +++ b/drivers/fsi/fsi-sbefifo.c
>>> @@ -29,9 +29,9 @@
>>>   #include <linux/sched.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/spinlock.h>
>>> -#include <linux/timer.h>
>>>   #include <linux/uaccess.h>
>>>   #include <linux/wait.h>
>>> +#include <linux/workqueue.h>
>>>
>>>   /*
>>>    * The SBEFIFO is a pipe-like FSI device for communicating with
>>> @@ -57,7 +57,7 @@
>>>   #define SBEFIFO_MAX_RESCHDULE  msecs_to_jiffies(5000)
>>>
>>>   struct sbefifo {
>>> -       struct timer_list poll_timer;
>>> +       struct delayed_work work;
>>>          struct fsi_device *fsi_dev;
>>>          struct miscdevice mdev;
>>>          wait_queue_head_t wait;
>>> @@ -99,6 +99,8 @@ struct sbefifo_client {
>>>          unsigned long f_flags;
>>>   };
>>>
>>> +static struct workqueue_struct *sbefifo_wq;
>>> +
>>>   static DEFINE_IDA(sbefifo_ida);
>>>
>>>   static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
>>> @@ -337,7 +339,7 @@ static void sbefifo_client_release(struct kref *kref)
>>>                           */
>>>                          set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>>>                          sbefifo_get(sbefifo);
>>> -                       if (mod_timer(&client->dev->poll_timer, jiffies))
>>> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>>                                  sbefifo_put(sbefifo);
>>>                  }
>>>          }
>>> @@ -374,10 +376,11 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
>>>          return NULL;
>>>   }
>>>
>>> -static void sbefifo_poll_timer(unsigned long data)
>>> +static void sbefifo_worker(struct work_struct *work)
>>>   {
>>>          static const unsigned long EOT_MASK = 0x000000ff;
>>> -       struct sbefifo *sbefifo = (void *)data;
>>> +       struct delayed_work *dwork = to_delayed_work(work);
>>> +       struct sbefifo *sbefifo = container_of(dwork, struct sbefifo, work);
>>>          struct sbefifo_buf *rbuf, *wbuf;
>>>          struct sbefifo_xfr *xfr, *tmp;
>>>          struct sbefifo_buf drain;
>>> @@ -393,6 +396,7 @@ static void sbefifo_poll_timer(unsigned long data)
>>>          if (!xfr)
>>>                  goto out_unlock;
>>>
>>> +again:
>>>          rbuf = xfr->rbuf;
>>>          wbuf = xfr->wbuf;
>>>
>>> @@ -414,9 +418,8 @@ static void sbefifo_poll_timer(unsigned long data)
>>>                  devn = sbefifo_dev_nwwriteable(sts);
>>>                  if (devn == 0) {
>>>                          /* No open slot for write.  Reschedule. */
>>> -                       sbefifo->poll_timer.expires = jiffies +
>>> -                               SBEFIFO_RESCHEDULE;
>>> -                       add_timer(&sbefifo->poll_timer);
>>> +                       queue_delayed_work(sbefifo_wq, &sbefifo->work,
>>> +                                          SBEFIFO_RESCHEDULE);
>>>                          goto out_unlock;
>>>                  }
>>>
>>> @@ -468,9 +471,8 @@ static void sbefifo_poll_timer(unsigned long data)
>>>                          }
>>>
>>>                          /* No data yet.  Reschedule. */
>>> -                       sbefifo->poll_timer.expires = jiffies +
>>> -                               SBEFIFO_RESCHEDULE;
>>> -                       add_timer(&sbefifo->poll_timer);
>>> +                       queue_delayed_work(sbefifo_wq, &sbefifo->work,
>>> +                                          SBEFIFO_RESCHEDULE);
>>>                          goto out_unlock;
>>>                  } else {
>>>                          xfr->wait_data_timeout = 0;
>>> @@ -516,10 +518,12 @@ static void sbefifo_poll_timer(unsigned long data)
>>>                  }
>>>                  INIT_LIST_HEAD(&sbefifo->xfrs);
>>>
>>> -       } else if (eot && sbefifo_next_xfr(sbefifo)) {
>>> -               sbefifo_get(sbefifo);
>>> -               sbefifo->poll_timer.expires = jiffies;
>>> -               add_timer(&sbefifo->poll_timer);
>>> +       } else if (eot) {
>>> +               xfr = sbefifo_next_xfr(sbefifo);
>>> +               if (xfr) {
>>> +                       wake_up_interruptible(&sbefifo->wait);
>>> +                       goto again;
>>> +               }
>>>          }
>>>
>>>          sbefifo_put(sbefifo);
>>> @@ -638,7 +642,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
>>>                           * Fill the read buffer back up.
>>>                           */
>>>                          sbefifo_get(sbefifo);
>>> -                       if (mod_timer(&client->dev->poll_timer, jiffies))
>>> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>>                                  sbefifo_put(sbefifo);
>>>                  } else {
>>>                          list_del(&xfr->client);
>>> @@ -721,7 +725,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>>                                                                   &n))) {
>>>                          set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>>>                          sbefifo_get(sbefifo);
>>> -                       if (mod_timer(&sbefifo->poll_timer, jiffies))
>>> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>>                                  sbefifo_put(sbefifo);
>>>
>>>                          ret = -ERESTARTSYS;
>>> @@ -741,7 +745,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>>                              n)) {
>>>                                  set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>>>                                  sbefifo_get(sbefifo);
>>> -                               if (mod_timer(&sbefifo->poll_timer, jiffies))
>>> +                               if (!queue_work(sbefifo_wq,
>>> +                                               &sbefifo->work.work))
>>>                                          sbefifo_put(sbefifo);
>>>                                  ret = -EFAULT;
>>>                                  goto out;
>>> @@ -768,7 +773,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>>                   * Drain the write buffer.
>>>                   */
>>>                  sbefifo_get(sbefifo);
>>> -               if (mod_timer(&client->dev->poll_timer, jiffies))
>>> +               if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>>>                          sbefifo_put(sbefifo);
>>>          }
>>>
>>> @@ -928,8 +933,7 @@ static int sbefifo_probe(struct device *dev)
>>>                   sbefifo->idx);
>>>
>>>          /* This bit of silicon doesn't offer any interrupts... */
>>> -       setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
>>> -                   (unsigned long)sbefifo);
>>> +       INIT_DELAYED_WORK(&sbefifo->work, sbefifo_worker);
>>>
>>>          sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
>>>          sbefifo->mdev.fops = &sbefifo_fops;
>>> @@ -982,7 +986,7 @@ static int sbefifo_remove(struct device *dev)
>>>
>>>          ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>>>
>>> -       if (del_timer_sync(&sbefifo->poll_timer))
>>> +       if (cancel_delayed_work_sync(&sbefifo->work))
>>>                  sbefifo_put(sbefifo);
>>>
>>>          sbefifo_put(sbefifo);
>>> @@ -1010,11 +1014,17 @@ static int sbefifo_remove(struct device *dev)
>>>
>>>   static int sbefifo_init(void)
>>>   {
>>> +       sbefifo_wq = create_singlethread_workqueue("sbefifo");
>>> +       if (!sbefifo_wq)
>>> +               return -ENOMEM;
>>> +
>>>          return fsi_driver_register(&sbefifo_drv);
>>>   }
>>>
>>>   static void sbefifo_exit(void)
>>>   {
>>> +       destroy_workqueue(sbefifo_wq);
>>> +
>>>          fsi_driver_unregister(&sbefifo_drv);
>>>
>>>          ida_destroy(&sbefifo_ida);
>>> --
>>> 1.8.3.1
>>>
