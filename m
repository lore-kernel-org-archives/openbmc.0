Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7GqG0B6pzDr8K
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 02:27:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95FRQOE136511
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 11:27:35 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddpys16jd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 11:27:34 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 11:27:32 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 11:27:30 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95FRTkZ39583852; Thu, 5 Oct 2017 15:27:29 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D08EAC040;
 Thu,  5 Oct 2017 11:28:07 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 75746AC03A;
 Thu,  5 Oct 2017 11:28:06 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2 4/9] drivers: fsi: occ: General clean-up
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-5-git-send-email-eajames@linux.vnet.ibm.com>
 <1507163874.5452.45.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2017 10:27:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507163874.5452.45.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100515-0036-0000-0000-00000276452C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926859; UDB=6.00466316; IPR=6.00707101; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017407; XFM=3.00000015;
 UTC=2017-10-05 15:27:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100515-0037-0000-0000-000041FC006B
Message-Id: <4caaec7f-18a7-b1c0-e8ed-0c1a6898a902@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050215
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
X-List-Received-Date: Thu, 05 Oct 2017 15:27:38 -0000



On 10/04/2017 07:37 PM, Andrew Jeffery wrote:
> On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Fix include files. Cleanup formatting and add some comments. Fix an
>> errant kfree in an error case. Fix some errnos. Add OCC response
>> definitions to the header file.
> Unlike the SBEFIFO patch I haven't studied the diff here, but I also don't
> intend on ack'ing this as it stands. There's just too much going on to judge
> that it's reasonable.

We can just drop this one too. It's just formatting changes and changing 
some errnos. Except for the kfree thing, which I can separate out.

I guess the problem here is that normally this is the kind of stuff that 
would be different in a v1 and v2 of a patchset, just cleaning stuff up. 
And in that case, it wouldn't be a problem to make these kinds of 
changes. But since this is already in our tree, it comes out to a big 
diff. I'd love to have 4.10 be nice and clean and match with what goes 
upstream, but it's quite time consuming to break everything up into such 
small chunks.

Thanks,
Eddie

>
> Andrew
>
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/occ.c   | 145 ++++++++++++++++++++++++++++------------------------
>>   include/linux/occ.h |  20 ++++++--
>>   2 files changed, 96 insertions(+), 69 deletions(-)
>>   
>> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
>> index 621fbf0..3313e35 100644
>> --- a/drivers/fsi/occ.c
>> +++ b/drivers/fsi/occ.c
>> @@ -10,16 +10,21 @@
>>   #include <asm/unaligned.h>
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/fs.h>
>>   #include <linux/fsi-sbefifo.h>
>> -#include <linux/init.h>
>> +#include <linux/idr.h>
>>   #include <linux/kernel.h>
>> +#include <linux/list.h>
>>   #include <linux/miscdevice.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>> +#include <linux/occ.h>
>>   #include <linux/of.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/slab.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/wait.h>
>>   #include <linux/workqueue.h>
>> @@ -34,43 +39,35 @@ struct occ {
>>   	int idx;
>>   	struct miscdevice mdev;
>>   	struct list_head xfrs;
>> -	spinlock_t list_lock;
>> -	struct mutex occ_lock;
>> +	spinlock_t list_lock;		/* lock access to the xfrs list */
>> +	struct mutex occ_lock;		/* lock access to the hardware */
>>   	struct work_struct work;
>>   };
>>   
>>   #define to_occ(x)	container_of((x), struct occ, mdev)
>>   
>> -struct occ_command {
>> -	u8 seq_no;
>> -	u8 cmd_type;
>> -	u16 data_length;
>> -	u8 data[OCC_CMD_DATA_BYTES];
>> -	u16 checksum;
>> -} __packed;
>> -
>>   struct occ_response {
>>   	u8 seq_no;
>>   	u8 cmd_type;
>>   	u8 return_status;
>> -	u16 data_length;
>> +	__be16 data_length;
>>   	u8 data[OCC_RESP_DATA_BYTES];
>> -	u16 checksum;
>> +	__be16 checksum;
>>   } __packed;
>>   
>>   /*
>>    * transfer flags are NOT mutually exclusive
>> - *
>> + *
>>    * Initial flags are none; transfer is created and queued from write(). All
>> - * 	flags are cleared when the transfer is completed by closing the file or
>> - * 	reading all of the available response data.
>> + *  flags are cleared when the transfer is completed by closing the file or
>> + *  reading all of the available response data.
>>    * XFR_IN_PROGRESS is set when a transfer is started from occ_worker_putsram,
>> - * 	and cleared if the transfer fails or occ_worker_getsram completes.
>> + *  and cleared if the transfer fails or occ_worker_getsram completes.
>>    * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
>>    * XFR_CANCELED is set when the transfer's client is released.
>>    * XFR_WAITING is set from read() if the transfer isn't complete and
>> - * 	NONBLOCKING wasn't specified. Cleared in read() when transfer completes
>> - * 	or fails.
>> + *  O_NONBLOCK wasn't specified. Cleared in read() when transfer completes or
>> + *  fails.
>>    */
>>   enum {
>>   	XFR_IN_PROGRESS,
>> @@ -92,9 +89,9 @@ struct occ_xfr {
>>    * client flags
>>    *
>>    * CLIENT_NONBLOCKING is set during open() if the file was opened with the
>> - * 	O_NONBLOCKING flag.
>> + *  O_NONBLOCK flag.
>>    * CLIENT_XFR_PENDING is set during write() and cleared when all data has been
>> - * 	read.
>> + *  read.
>>    */
>>   enum {
>>   	CLIENT_NONBLOCKING,
>> @@ -104,7 +101,7 @@ enum {
>>   struct occ_client {
>>   	struct occ *occ;
>>   	struct occ_xfr xfr;
>> -	spinlock_t lock;
>> +	spinlock_t lock;		/* lock access to the client state */
>>   	wait_queue_head_t wait;
>>   	size_t read_offset;
>>   	unsigned long flags;
>> @@ -135,9 +132,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
>>   
>>   static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
>>   {
>> -	struct occ_client *client;
>> +	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
>>   
>> -	client = kzalloc(sizeof(*client), GFP_KERNEL);
>>   	if (!client)
>>   		return NULL;
>>   
>> @@ -183,8 +179,9 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>>   		if (client->read_offset) {
>>   			rc = 0;
>>   			client->read_offset = 0;
>> -		} else
>> +		} else {
>>   			rc = -ENOMSG;
>> +		}
>>   
>>   		goto done;
>>   	}
>> @@ -200,8 +197,10 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>>   		spin_unlock_irq(&client->lock);
>>   
>>   		rc = wait_event_interruptible(client->wait,
>> -			test_bit(XFR_COMPLETE, &xfr->flags) ||
>> -			test_bit(XFR_CANCELED, &xfr->flags));
>> +					      test_bit(XFR_COMPLETE,
>> +						       &xfr->flags) ||
>> +					      test_bit(XFR_CANCELED,
>> +						       &xfr->flags));
>>   
>>   		spin_lock_irq(&client->lock);
>>   
>> @@ -225,12 +224,14 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>>   
>>   	bytes = min(len, xfr->resp_data_length - client->read_offset);
>>   	if (ubuf) {
>> -		if (copy_to_user(ubuf, &xfr->buf[client->read_offset], bytes)) {
>> +		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
>> +				 bytes)) {
>>   			rc = -EFAULT;
>>   			goto done;
>>   		}
>> -	} else
>> +	} else {
>>   		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
>> +	}
>>   
>>   	client->read_offset += bytes;
>>   
>> @@ -250,12 +251,6 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
>>   {
>>   	struct occ_client *client = file->private_data;
>>   
>> -	/* check this ahead of time so we don't go changing the xfr state
>> -	 * needlessly
>> -	 */
>> -	if (!access_ok(VERIFY_WRITE, buf, len))
>> -		return -EFAULT;
>> -
>>   	return occ_read_common(client, buf, NULL, len);
>>   }
>>   
>> @@ -272,28 +267,31 @@ static ssize_t occ_write_common(struct occ_client *client,
>>   		return -EINVAL;
>>   
>>   	spin_lock_irq(&client->lock);
>> +
>>   	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
>>   		rc = -EBUSY;
>>   		goto done;
>>   	}
>>   
>> -	/* clear out the transfer */
>> -	memset(xfr, 0, sizeof(*xfr));
>> -
>> -	xfr->buf[0] = 1;
>> +	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
>> +	xfr->buf[0] = 1;		/* occ sequence number */
>>   
>> +	/* Assume user data follows the occ command format.
>> +	 * byte 0: command type
>> +	 * bytes 1-2: data length (msb first)
>> +	 * bytes 3-n: data
>> +	 */
>>   	if (ubuf) {
>>   		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
>> -			kfree(xfr);
>>   			rc = -EFAULT;
>>   			goto done;
>>   		}
>> -	} else
>> +	} else {
>>   		memcpy(&xfr->buf[1], kbuf, len);
>> +	}
>>   
>>   	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
>>   	if (data_length > OCC_CMD_DATA_BYTES) {
>> -		kfree(xfr);
>>   		rc = -EINVAL;
>>   		goto done;
>>   	}
>> @@ -321,12 +319,6 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
>>   {
>>   	struct occ_client *client = file->private_data;
>>   
>> -	/* check this ahead of time so we don't go changing the xfr state
>> -	 * needlessly
>> -	 */
>> -	if (!access_ok(VERIFY_READ, buf, len))
>> -		return -EFAULT;
>> -
>>   	return occ_write_common(client, buf, NULL, len);
>>   }
>>   
>> @@ -366,7 +358,7 @@ static int occ_release_common(struct occ_client *client)
>>   		return 0;
>>   	}
>>   
>> -	/* operation is in progress; let worker clean up*/
>> +	/* operation is in progress; let worker clean up */
>>   	spin_unlock_irq(&occ->list_lock);
>>   	spin_unlock_irq(&client->lock);
>>   	return 0;
>> @@ -403,7 +395,7 @@ static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
>>   		total += rc;
>>   	} while (total < len);
>>   
>> -	return (total == len) ? 0 : -EMSGSIZE;
>> +	return (total == len) ? 0 : -ENOSPC;
>>   }
>>   
>>   static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
>> @@ -422,7 +414,7 @@ static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
>>   		total += rc;
>>   	} while (total < len);
>>   
>> -	return (total == len) ? 0 : -EMSGSIZE;
>> +	return (total == len) ? 0 : -ENODATA;
>>   }
>>   
>>   static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>> @@ -430,10 +422,13 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>>   {
>>   	int rc;
>>   	u8 *resp;
>> -	u32 buf[5];
>> -	u32 data_len = ((len + 7) / 8) * 8;
>> +	__be32 buf[5];
>> +	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>>   	struct sbefifo_client *client;
>>   
>> +	/* Magic sequence to do SBE getsram command. SBE will fetch data from
>> +	 * specified SRAM address.
>> +	 */
>>   	buf[0] = cpu_to_be32(0x5);
>>   	buf[1] = cpu_to_be32(0xa403);
>>   	buf[2] = cpu_to_be32(1);
>> @@ -447,7 +442,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>>   	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
>>   	if (rc)
>>   		goto done;
>> -	
>> +
>>   	resp = kzalloc(data_len, GFP_KERNEL);
>>   	if (!resp) {
>>   		rc = -ENOMEM;
>> @@ -467,7 +462,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>>   	    (be32_to_cpu(buf[1]) == 0xC0DEA403))
>>   		memcpy(data, resp, len);
>>   	else
>> -		rc = -EFAULT;
>> +		rc = -EBADMSG;
>>   
>>   free:
>>   	kfree(resp);
>> @@ -481,8 +476,8 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>>   		       ssize_t len)
>>   {
>>   	int rc;
>> -	u32 *buf;
>> -	u32 data_len = ((len + 7) / 8) * 8;
>> +	__be32 *buf;
>> +	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>>   	size_t cmd_len = data_len + 20;
>>   	struct sbefifo_client *client;
>>   
>> @@ -490,6 +485,9 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>>   	if (!buf)
>>   		return -ENOMEM;
>>   
>> +	/* Magic sequence to do SBE putsram command. SBE will transfer
>> +	 * data to specified SRAM address.
>> +	 */
>>   	buf[0] = cpu_to_be32(0x5 + (data_len / 4));
>>   	buf[1] = cpu_to_be32(0xa404);
>>   	buf[2] = cpu_to_be32(1);
>> @@ -515,7 +513,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>>   	/* check for good response */
>>   	if ((be32_to_cpu(buf[0]) != data_len) ||
>>   	    (be32_to_cpu(buf[1]) != 0xC0DEA404))
>> -		rc = -EFAULT;
>> +		rc = -EBADMSG;
>>   
>>   done:
>>   	sbefifo_drv_release(client);
>> @@ -527,14 +525,17 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>>   static int occ_trigger_attn(struct device *sbefifo)
>>   {
>>   	int rc;
>> -	u32 buf[6];
>> +	__be32 buf[6];
>>   	struct sbefifo_client *client;
>>   
>> +	/* Magic sequence to do SBE putscom command. SBE will write 8 bytes to
>> +	 * specified SCOM address.
>> +	 */
>>   	buf[0] = cpu_to_be32(0x6);
>>   	buf[1] = cpu_to_be32(0xa202);
>>   	buf[2] = 0;
>>   	buf[3] = cpu_to_be32(0x6D035);
>> -	buf[4] = cpu_to_be32(0x20010000);
>> +	buf[4] = cpu_to_be32(0x20010000);	/* trigger occ attention */
>>   	buf[5] = 0;
>>   
>>   	client = sbefifo_drv_open(sbefifo, 0);
>> @@ -552,7 +553,7 @@ static int occ_trigger_attn(struct device *sbefifo)
>>   	/* check for good response */
>>   	if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
>>   	    (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
>> -		rc = -EFAULT;
>> +		rc = -EBADMSG;
>>   
>>   done:
>>   	sbefifo_drv_release(client);
>> @@ -565,6 +566,7 @@ static void occ_worker(struct work_struct *work)
>>   	int rc = 0, empty, waiting, canceled;
>>   	u16 resp_data_length;
>>   	struct occ_xfr *xfr;
>> +	struct occ_response *resp;
>>   	struct occ_client *client;
>>   	struct occ *occ = container_of(work, struct occ, work);
>>   	struct device *sbefifo = occ->sbefifo;
>> @@ -578,11 +580,13 @@ static void occ_worker(struct work_struct *work)
>>   		return;
>>   	}
>>   
>> +	resp = (struct occ_response *)xfr->buf;
>>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>>   
>>   	spin_unlock_irq(&occ->list_lock);
>>   	mutex_lock(&occ->occ_lock);
>>   
>> +	/* write occ command */
>>   	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
>>   			 xfr->cmd_data_length);
>>   	if (rc)
>> @@ -592,13 +596,14 @@ static void occ_worker(struct work_struct *work)
>>   	if (rc)
>>   		goto done;
>>   
>> +	/* read occ response */
>>   	rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
>>   	if (rc)
>>   		goto done;
>>   
>> -	resp_data_length = (xfr->buf[3] << 8) + xfr->buf[4];
>> +	resp_data_length = get_unaligned_be16(&resp->data_length);
>>   	if (resp_data_length > OCC_RESP_DATA_BYTES) {
>> -		rc = -EDOM;
>> +		rc = -EMSGSIZE;
>>   		goto done;
>>   	}
>>   
>> @@ -657,18 +662,27 @@ struct occ_client *occ_drv_open(struct device *dev, unsigned long flags)
>>   
>>   int occ_drv_read(struct occ_client *client, char *buf, size_t len)
>>   {
>> +	if (!client)
>> +		return -ENODEV;
>> +
>>   	return occ_read_common(client, NULL, buf, len);
>>   }
>>   EXPORT_SYMBOL_GPL(occ_drv_read);
>>   
>>   int occ_drv_write(struct occ_client *client, const char *buf, size_t len)
>>   {
>> +	if (!client)
>> +		return -ENODEV;
>> +
>>   	return occ_write_common(client, NULL, buf, len);
>>   }
>>   EXPORT_SYMBOL_GPL(occ_drv_write);
>>   
>>   void occ_drv_release(struct occ_client *client)
>>   {
>> +	if (!client)
>> +		return;
>> +
>>   	occ_release_common(client);
>>   }
>>   EXPORT_SYMBOL_GPL(occ_drv_release);
>> @@ -704,9 +718,6 @@ static int occ_probe(struct platform_device *pdev)
>>   	mutex_init(&occ->occ_lock);
>>   	INIT_WORK(&occ->work, occ_worker);
>>   
>> -	/* ensure NULL before we probe children, so they don't hang FSI */
>> -	platform_set_drvdata(pdev, NULL);
>> -
>>   	if (dev->of_node) {
>>   		rc = of_property_read_u32(dev->of_node, "reg", &reg);
>>   		if (!rc) {
>> @@ -789,6 +800,8 @@ static void occ_exit(void)
>>   	destroy_workqueue(occ_wq);
>>   
>>   	platform_driver_unregister(&occ_driver);
>> +
>> +	ida_destroy(&occ_ida);
>>   }
>>   
>>   module_init(occ_init);
>> diff --git a/include/linux/occ.h b/include/linux/occ.h
>> index d78332c..0a4a54a 100644
>> --- a/include/linux/occ.h
>> +++ b/include/linux/occ.h
>> @@ -11,12 +11,26 @@
>>    * GNU General Public License for more details.
>>    */
>>   
>> -#ifndef __OCC_H__
>> -#define __OCC_H__
>> +#ifndef LINUX_FSI_OCC_H
>> +#define LINUX_FSI_OCC_H
>>   
>>   struct device;
>>   struct occ_client;
>>   
>> +#define OCC_RESP_CMD_IN_PRG		0xFF
>> +#define OCC_RESP_SUCCESS		0
>> +#define OCC_RESP_CMD_INVAL		0x11
>> +#define OCC_RESP_CMD_LEN_INVAL		0x12
>> +#define OCC_RESP_DATA_INVAL		0x13
>> +#define OCC_RESP_CHKSUM_ERR		0x14
>> +#define OCC_RESP_INT_ERR		0x15
>> +#define OCC_RESP_BAD_STATE		0x16
>> +#define OCC_RESP_CRIT_EXCEPT		0xE0
>> +#define OCC_RESP_CRIT_INIT		0xE1
>> +#define OCC_RESP_CRIT_WATCHDOG		0xE2
>> +#define OCC_RESP_CRIT_OCB		0xE3
>> +#define OCC_RESP_CRIT_HW		0xE4
>> +
>>   extern struct occ_client *occ_drv_open(struct device *dev,
>>   				       unsigned long flags);
>>   extern int occ_drv_read(struct occ_client *client, char *buf, size_t len);
>> @@ -24,4 +38,4 @@ extern int occ_drv_write(struct occ_client *client, const char *buf,
>>   			 size_t len);
>>   extern void occ_drv_release(struct occ_client *client);
>>   
>> -#endif /* __OCC_H__ */
>> +#endif /* LINUX_FSI_OCC_H */
