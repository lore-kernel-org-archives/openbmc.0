Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7GYF1hzSzDr8K
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 02:15:28 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95FA5G9145406
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 11:15:26 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddmqc8y2u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 11:15:25 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 11:15:23 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 11:15:21 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95FFKqZ53739754; Thu, 5 Oct 2017 15:15:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39C8EAC03A;
 Thu,  5 Oct 2017 11:15:58 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id A3967AC040;
 Thu,  5 Oct 2017 11:15:57 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2 2/9] drivers: fsi: SBEFIFO: Fix probe()
 and remove()
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-3-git-send-email-eajames@linux.vnet.ibm.com>
 <1507163549.5452.42.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2017 10:15:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507163549.5452.42.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100515-0024-0000-0000-000002DD5BFA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926856; UDB=6.00466314; IPR=6.00707096; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017407; XFM=3.00000015;
 UTC=2017-10-05 15:15:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100515-0025-0000-0000-000045A34CCF
Message-Id: <a333e35b-2dd6-e73d-9ee1-ef8e1c6d56bd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050213
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
X-List-Received-Date: Thu, 05 Oct 2017 15:15:29 -0000



On 10/04/2017 07:32 PM, Andrew Jeffery wrote:
> On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Probe didn't handle a failed misc device registration properly. Remove
>> had the potential for hangs. Also, remove the list of SBEFIFOs and
>> instead just use the device "driver data" pointer.
> What was the purpose of the list of SBEFIFOs? Are we losing something from the
> intended design here? The list could be stored in the driver data pointer
> right?

Right, originally we weren't sure if we could use the fsi device driver 
data pointer. The only purpose of the list is to be able to find our 
sbefifo device when given an fsi device pointer.

>
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/fsi-sbefifo.c | 109 ++++++++++++++++++++++------------------------
>>   1 file changed, 52 insertions(+), 57 deletions(-)
>>   
>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>> index a4cd353..fa34bd8 100644
>> --- a/drivers/fsi/fsi-sbefifo.c
>> +++ b/drivers/fsi/fsi-sbefifo.c
>> @@ -58,7 +58,6 @@ struct sbefifo {
>>   	struct fsi_device *fsi_dev;
>>   	struct miscdevice mdev;
>>   	wait_queue_head_t wait;
>> -	struct list_head link;
>>   	struct list_head xfrs;
>>   	struct kref kref;
>>   	spinlock_t lock;
>> @@ -96,8 +95,6 @@ struct sbefifo_client {
>>   	unsigned long f_flags;
>>   };
>>   
>> -static struct list_head sbefifo_fifos;
>> -
>>   static DEFINE_IDA(sbefifo_ida);
>>   
>>   static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
>> @@ -267,9 +264,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
>>   	struct sbefifo *sbefifo = client->dev;
>>   	struct sbefifo_xfr *xfr;
>>   
>> +	if (READ_ONCE(sbefifo->rc))
>> +		return ERR_PTR(sbefifo->rc);
>> +
>>   	xfr = kzalloc(sizeof(*xfr), GFP_KERNEL);
>>   	if (!xfr)
>> -		return NULL;
>> +		return ERR_PTR(-ENOMEM);
>>   
>>   	xfr->rbuf = &client->rbuf;
>>   	xfr->wbuf = &client->wbuf;
>> @@ -490,7 +490,7 @@ static void sbefifo_poll_timer(unsigned long data)
>>   	}
>>   
>>   	sbefifo_put(sbefifo);
>> -	wake_up(&sbefifo->wait);
>> +	wake_up_interruptible(&sbefifo->wait);
>>   
>>   out_unlock:
>>   	spin_unlock(&sbefifo->lock);
>> @@ -604,7 +604,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
>>   		} else {
>>   			kfree(xfr);
>>   			list_del(&xfr->client);
>> -			wake_up(&sbefifo->wait);
>> +			wake_up_interruptible(&sbefifo->wait);
>>   		}
>>   	}
>>   
>> @@ -664,7 +664,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>>   	}
>>   
>>   	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
>> -	if (!xfr) {
>> +	if (IS_ERR(xfr)) {
> Should this be in what is currently patch 0/9?

No. This patch set changes the return value of sbefifo_enq_xfr to return 
an appropriate error pointer.

>
>>   		spin_unlock_irq(&sbefifo->lock);
>>   		ret = PTR_ERR(xfr);
>>   		goto out;
>> @@ -766,18 +766,15 @@ static int sbefifo_release(struct inode *inode, struct file *file)
>>   struct sbefifo_client *sbefifo_drv_open(struct device *dev,
>>   					unsigned long flags)
>>   {
>> -	struct sbefifo_client *client = NULL;
>> -	struct sbefifo *sbefifo;
>> -	struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +	struct sbefifo_client *client;
>> +	struct sbefifo *sbefifo = dev_get_drvdata(dev);
>>   
>> -	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
>> -		if (sbefifo->fsi_dev != fsi_dev)
>> -			continue;
>> +	if (!sbefifo)
>> +		return NULL;
>>   
>> -		client = sbefifo_new_client(sbefifo);
>> -		if (client)
>> -			client->f_flags = flags;
>> -	}
>> +	client = sbefifo_new_client(sbefifo);
>> +	if (client)
>> +		client->f_flags = flags;
>>   
>>   	return client;
>>   }
>> @@ -850,69 +847,68 @@ static int sbefifo_probe(struct device *dev)
>>   		return -EIO;
>>   	}
>>   
>> -	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
>> -	sbefifo->mdev.fops = &sbefifo_fops;
>> -	sbefifo->mdev.name = sbefifo->name;
>> -	sbefifo->mdev.parent = dev;
>>   	spin_lock_init(&sbefifo->lock);
>>   	kref_init(&sbefifo->kref);
>> +	init_waitqueue_head(&sbefifo->wait);
>> +	INIT_LIST_HEAD(&sbefifo->xfrs);
>>   
>>   	sbefifo->idx = ida_simple_get(&sbefifo_ida, 1, INT_MAX, GFP_KERNEL);
>>   	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
>>   		 sbefifo->idx);
>> -	init_waitqueue_head(&sbefifo->wait);
>> -	INIT_LIST_HEAD(&sbefifo->xfrs);
>>   
>>   	/* This bit of silicon doesn't offer any interrupts... */
>>   	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
>>   		    (unsigned long)sbefifo);
>>   
>> -	if (dev->of_node) {
>> -		/* create platform devs for dts child nodes (occ, etc) */
>> -		for_each_child_of_node(dev->of_node, np) {
>> -			snprintf(child_name, sizeof(child_name), "%s-dev%d",
>> -				 sbefifo->name, child_idx++);
>> -			child = of_platform_device_create(np, child_name, dev);
>> -			if (!child)
>> -				dev_warn(dev,
>> -					 "failed to create child node dev\n");
>> -		}
>> +	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
>> +	sbefifo->mdev.fops = &sbefifo_fops;
>> +	sbefifo->mdev.name = sbefifo->name;
>> +	sbefifo->mdev.parent = dev;
>> +	ret = misc_register(&sbefifo->mdev);
>> +	if (ret) {
>> +		dev_err(dev, "failed to register miscdevice: %d\n", ret);
>> +		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>> +		sbefifo_put(sbefifo);
>> +		return ret;
>>   	}
>>   
>> -	list_add(&sbefifo->link, &sbefifo_fifos);
>> -	
>> -	return misc_register(&sbefifo->mdev);
>> +	/* create platform devs for dts child nodes (occ, etc) */
>> +	for_each_available_child_of_node(dev->of_node, np) {
>> +		snprintf(child_name, sizeof(child_name), "%s-dev%d",
>> +			 sbefifo->name, child_idx++);
>> +		child = of_platform_device_create(np, child_name, dev);
>> +		if (!child)
>> +			dev_warn(dev, "failed to create child %s dev\n",
>> +				 child_name);
>> +	}
>> +
>> +	dev_set_drvdata(dev, sbefifo);
>> +
>> +	return 0;
>>   }
>>   
>>   static int sbefifo_remove(struct device *dev)
>>   {
>> -	struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> -	struct sbefifo *sbefifo, *sbefifo_tmp;
>> +	struct sbefifo *sbefifo = dev_get_drvdata(dev);
>>   	struct sbefifo_xfr *xfr;
>>   
>> -	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
>> -		if (sbefifo->fsi_dev != fsi_dev)
>> -			continue;
>> +	WRITE_ONCE(sbefifo->rc, -ENODEV);
>> +	wake_up_interruptible_all(&sbefifo->wait);
> If we're removing, we want to wake up non-interruptible tasks as well, so I
> think wake_up_all() is more appropriate.

OK. Though there are no non-interruptible wait_event calls in this driver.

Thanks,
Eddie

>
>>   
>> -		device_for_each_child(dev, NULL, sbefifo_unregister_child);
>> +	misc_deregister(&sbefifo->mdev);
>> +	device_for_each_child(dev, NULL, sbefifo_unregister_child);
>>   
>> -		misc_deregister(&sbefifo->mdev);
>> -		list_del(&sbefifo->link);
>> -		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>> -
>> -		if (del_timer_sync(&sbefifo->poll_timer))
>> -			sbefifo_put(sbefifo);
>> +	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>>   
>> -		spin_lock(&sbefifo->lock);
>> -		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
>> -			kfree(xfr);
>> -		spin_unlock(&sbefifo->lock);
>> +	if (del_timer_sync(&sbefifo->poll_timer))
>> +		sbefifo_put(sbefifo);
>>   
>> -		WRITE_ONCE(sbefifo->rc, -ENODEV);
>> +	spin_lock(&sbefifo->lock);
>> +	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
>> +		kfree(xfr);
>> +	spin_unlock(&sbefifo->lock);
>>   
>> -		wake_up(&sbefifo->wait);
>> -		sbefifo_put(sbefifo);
>> -	}
>> +	sbefifo_put(sbefifo);
>>   
>>   	return 0;
>>   }
>> @@ -937,7 +933,6 @@ static int sbefifo_remove(struct device *dev)
>>   
>>   static int sbefifo_init(void)
>>   {
>> -	INIT_LIST_HEAD(&sbefifo_fifos);
>>   	return fsi_driver_register(&sbefifo_drv);
>>   }
>>   
