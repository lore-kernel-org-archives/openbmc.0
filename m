Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xysfW5FtmzDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 09:05:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8LN4StS043639
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 19:05:53 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d4pnfrc3y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 19:05:53 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 21 Sep 2017 16:55:47 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Sep 2017 16:55:44 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8LMthql65208540; Thu, 21 Sep 2017 15:55:43 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1269BE03A;
 Thu, 21 Sep 2017 16:55:43 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 7BD38BE038;
 Thu, 21 Sep 2017 16:55:43 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 2/3] drivers/fsi/occ: refactor to upstream
 list state
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506033838-2078-3-git-send-email-eajames@linux.vnet.ibm.com>
Date: Thu, 21 Sep 2017 17:55:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1506033838-2078-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17092122-0016-0000-0000-0000078D4A81
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007775; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920433; UDB=6.00462504; IPR=6.00700655; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017240; XFM=3.00000015;
 UTC=2017-09-21 22:55:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092122-0017-0000-0000-00003B90CFBC
Message-Id: <48977008-8d05-fb2e-411f-3d4c2fc1a4c5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709210310
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
X-List-Received-Date: Thu, 21 Sep 2017 23:05:56 -0000



On 09/21/2017 05:43 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Includes various fixes:
>   - Fix probe failure scenario
>   - General cleanup
>   - Reorder remove() operations for safety
>   - Add cancel boolean to prevent further xfrs when we're removing

And with this one, hasn't been sent upstream yet.

Eddie

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/fsi/occ.c   | 227 ++++++++++++++++++++++++++++++++--------------------
>   include/linux/occ.h |  20 ++++-
>   2 files changed, 155 insertions(+), 92 deletions(-)
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 621fbf0..4dd5048 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -10,16 +10,22 @@
>   #include <asm/unaligned.h>
>   #include <linux/device.h>
>   #include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
>   #include <linux/fsi-sbefifo.h>
> -#include <linux/init.h>
> +#include <linux/idr.h>
>   #include <linux/kernel.h>
> +#include <linux/list.h>
>   #include <linux/miscdevice.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/occ.h>
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/sched.h>
>   #include <linux/slab.h>
> +#include <linux/spinlock.h>
>   #include <linux/uaccess.h>
>   #include <linux/wait.h>
>   #include <linux/workqueue.h>
> @@ -28,49 +34,45 @@
>   #define OCC_CMD_DATA_BYTES	4090
>   #define OCC_RESP_DATA_BYTES	4089
>
> +#define OCC_TIMEOUT_MS		1000
> +#define OCC_CMD_IN_PRG_WAIT_MS	50
> +
>   struct occ {
>   	struct device *sbefifo;
>   	char name[32];
>   	int idx;
>   	struct miscdevice mdev;
>   	struct list_head xfrs;
> -	spinlock_t list_lock;
> -	struct mutex occ_lock;
> +	spinlock_t list_lock;		/* lock access to the xfrs list */
> +	struct mutex occ_lock;		/* lock access to the hardware */
>   	struct work_struct work;
> +	bool cancel;
>   };
>
>   #define to_occ(x)	container_of((x), struct occ, mdev)
>
> -struct occ_command {
> -	u8 seq_no;
> -	u8 cmd_type;
> -	u16 data_length;
> -	u8 data[OCC_CMD_DATA_BYTES];
> -	u16 checksum;
> -} __packed;
> -
>   struct occ_response {
>   	u8 seq_no;
>   	u8 cmd_type;
>   	u8 return_status;
> -	u16 data_length;
> +	__be16 data_length;
>   	u8 data[OCC_RESP_DATA_BYTES];
> -	u16 checksum;
> +	__be16 checksum;
>   } __packed;
>
>   /*
>    * transfer flags are NOT mutually exclusive
> - *
> + *
>    * Initial flags are none; transfer is created and queued from write(). All
> - * 	flags are cleared when the transfer is completed by closing the file or
> - * 	reading all of the available response data.
> + *  flags are cleared when the transfer is completed by closing the file or
> + *  reading all of the available response data.
>    * XFR_IN_PROGRESS is set when a transfer is started from occ_worker_putsram,
> - * 	and cleared if the transfer fails or occ_worker_getsram completes.
> + *  and cleared if the transfer fails or occ_worker_getsram completes.
>    * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
>    * XFR_CANCELED is set when the transfer's client is released.
>    * XFR_WAITING is set from read() if the transfer isn't complete and
> - * 	NONBLOCKING wasn't specified. Cleared in read() when transfer completes
> - * 	or fails.
> + *  O_NONBLOCK wasn't specified. Cleared in read() when transfer completes or
> + *  fails.
>    */
>   enum {
>   	XFR_IN_PROGRESS,
> @@ -92,9 +94,9 @@ struct occ_xfr {
>    * client flags
>    *
>    * CLIENT_NONBLOCKING is set during open() if the file was opened with the
> - * 	O_NONBLOCKING flag.
> + *  O_NONBLOCK flag.
>    * CLIENT_XFR_PENDING is set during write() and cleared when all data has been
> - * 	read.
> + *  read.
>    */
>   enum {
>   	CLIENT_NONBLOCKING,
> @@ -104,7 +106,7 @@ enum {
>   struct occ_client {
>   	struct occ *occ;
>   	struct occ_xfr xfr;
> -	spinlock_t lock;
> +	spinlock_t lock;		/* lock access to the client state */
>   	wait_queue_head_t wait;
>   	size_t read_offset;
>   	unsigned long flags;
> @@ -116,12 +118,15 @@ struct occ_client {
>
>   static DEFINE_IDA(occ_ida);
>
> -static void occ_enqueue_xfr(struct occ_xfr *xfr)
> +static int occ_enqueue_xfr(struct occ_xfr *xfr)
>   {
>   	int empty;
>   	struct occ_client *client = to_client(xfr);
>   	struct occ *occ = client->occ;
>
> +	if (occ->cancel)
> +		return -ECANCELED;
> +
>   	spin_lock_irq(&occ->list_lock);
>
>   	empty = list_empty(&occ->xfrs);
> @@ -131,14 +136,15 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
>
>   	if (empty)
>   		queue_work(occ_wq, &occ->work);
> +
> +	return 0;
>   }
>
>   static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
>   {
> -	struct occ_client *client;
> +	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
>
> -	client = kzalloc(sizeof(*client), GFP_KERNEL);
> -	if (!client)
> +	if (!client || occ->cancel)
>   		return NULL;
>
>   	client->occ = occ;
> @@ -172,6 +178,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   	int rc;
>   	size_t bytes;
>   	struct occ_xfr *xfr = &client->xfr;
> +	struct occ *occ = client->occ;
>
>   	if (len > OCC_SRAM_BYTES)
>   		return -EINVAL;
> @@ -183,8 +190,9 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   		if (client->read_offset) {
>   			rc = 0;
>   			client->read_offset = 0;
> -		} else
> +		} else {
>   			rc = -ENOMSG;
> +		}
>
>   		goto done;
>   	}
> @@ -200,8 +208,11 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   		spin_unlock_irq(&client->lock);
>
>   		rc = wait_event_interruptible(client->wait,
> -			test_bit(XFR_COMPLETE, &xfr->flags) ||
> -			test_bit(XFR_CANCELED, &xfr->flags));
> +					      test_bit(XFR_COMPLETE,
> +						       &xfr->flags) ||
> +					      test_bit(XFR_CANCELED,
> +						       &xfr->flags) ||
> +					      occ->cancel);
>
>   		spin_lock_irq(&client->lock);
>
> @@ -225,12 +236,14 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>
>   	bytes = min(len, xfr->resp_data_length - client->read_offset);
>   	if (ubuf) {
> -		if (copy_to_user(ubuf, &xfr->buf[client->read_offset], bytes)) {
> +		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
> +				 bytes)) {
>   			rc = -EFAULT;
>   			goto done;
>   		}
> -	} else
> +	} else {
>   		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
> +	}
>
>   	client->read_offset += bytes;
>
> @@ -250,12 +263,6 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
>   {
>   	struct occ_client *client = file->private_data;
>
> -	/* check this ahead of time so we don't go changing the xfr state
> -	 * needlessly
> -	 */
> -	if (!access_ok(VERIFY_WRITE, buf, len))
> -		return -EFAULT;
> -
>   	return occ_read_common(client, buf, NULL, len);
>   }
>
> @@ -272,28 +279,31 @@ static ssize_t occ_write_common(struct occ_client *client,
>   		return -EINVAL;
>
>   	spin_lock_irq(&client->lock);
> -	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> +
> +	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
>   		rc = -EBUSY;
>   		goto done;
>   	}
>
> -	/* clear out the transfer */
> -	memset(xfr, 0, sizeof(*xfr));
> -
> -	xfr->buf[0] = 1;
> +	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
> +	xfr->buf[0] = 1;		/* occ sequence number */
>
> +	/* Assume user data follows the occ command format.
> +	 * byte 0: command type
> +	 * bytes 1-2: data length (msb first)
> +	 * bytes 3-n: data
> +	 */
>   	if (ubuf) {
>   		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
> -			kfree(xfr);
>   			rc = -EFAULT;
>   			goto done;
>   		}
> -	} else
> +	} else {
>   		memcpy(&xfr->buf[1], kbuf, len);
> +	}
>
>   	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
>   	if (data_length > OCC_CMD_DATA_BYTES) {
> -		kfree(xfr);
>   		rc = -EINVAL;
>   		goto done;
>   	}
> @@ -306,9 +316,11 @@ static ssize_t occ_write_common(struct occ_client *client,
>
>   	xfr->cmd_data_length = data_length + 6;
>   	client->read_offset = 0;
> +	rc = occ_enqueue_xfr(xfr);
> +	if (rc)
> +		goto done;
>
> -	occ_enqueue_xfr(xfr);
> -
> +	set_bit(CLIENT_XFR_PENDING, &client->flags);
>   	rc = len;
>
>   done:
> @@ -321,12 +333,6 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
>   {
>   	struct occ_client *client = file->private_data;
>
> -	/* check this ahead of time so we don't go changing the xfr state
> -	 * needlessly
> -	 */
> -	if (!access_ok(VERIFY_READ, buf, len))
> -		return -EFAULT;
> -
>   	return occ_write_common(client, buf, NULL, len);
>   }
>
> @@ -366,7 +372,7 @@ static int occ_release_common(struct occ_client *client)
>   		return 0;
>   	}
>
> -	/* operation is in progress; let worker clean up*/
> +	/* operation is in progress; let worker clean up */
>   	spin_unlock_irq(&occ->list_lock);
>   	spin_unlock_irq(&client->lock);
>   	return 0;
> @@ -403,7 +409,7 @@ static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
>   		total += rc;
>   	} while (total < len);
>
> -	return (total == len) ? 0 : -EMSGSIZE;
> +	return (total == len) ? 0 : -ENODATA;
>   }
>
>   static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
> @@ -422,7 +428,7 @@ static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
>   		total += rc;
>   	} while (total < len);
>
> -	return (total == len) ? 0 : -EMSGSIZE;
> +	return (total == len) ? 0 : -ENODATA;
>   }
>
>   static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
> @@ -430,10 +436,13 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>   {
>   	int rc;
>   	u8 *resp;
> -	u32 buf[5];
> -	u32 data_len = ((len + 7) / 8) * 8;
> +	__be32 buf[5];
> +	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>   	struct sbefifo_client *client;
>
> +	/* Magic sequence to do SBE getsram command. SBE will fetch data from
> +	 * specified SRAM address.
> +	 */
>   	buf[0] = cpu_to_be32(0x5);
>   	buf[1] = cpu_to_be32(0xa403);
>   	buf[2] = cpu_to_be32(1);
> @@ -447,7 +456,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>   	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
>   	if (rc)
>   		goto done;
> -	
> +
>   	resp = kzalloc(data_len, GFP_KERNEL);
>   	if (!resp) {
>   		rc = -ENOMEM;
> @@ -467,7 +476,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>   	    (be32_to_cpu(buf[1]) == 0xC0DEA403))
>   		memcpy(data, resp, len);
>   	else
> -		rc = -EFAULT;
> +		rc = -EBADMSG;
>
>   free:
>   	kfree(resp);
> @@ -481,8 +490,8 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>   		       ssize_t len)
>   {
>   	int rc;
> -	u32 *buf;
> -	u32 data_len = ((len + 7) / 8) * 8;
> +	__be32 *buf;
> +	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>   	size_t cmd_len = data_len + 20;
>   	struct sbefifo_client *client;
>
> @@ -490,6 +499,9 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>   	if (!buf)
>   		return -ENOMEM;
>
> +	/* Magic sequence to do SBE putsram command. SBE will transfer
> +	 * data to specified SRAM address.
> +	 */
>   	buf[0] = cpu_to_be32(0x5 + (data_len / 4));
>   	buf[1] = cpu_to_be32(0xa404);
>   	buf[2] = cpu_to_be32(1);
> @@ -515,7 +527,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>   	/* check for good response */
>   	if ((be32_to_cpu(buf[0]) != data_len) ||
>   	    (be32_to_cpu(buf[1]) != 0xC0DEA404))
> -		rc = -EFAULT;
> +		rc = -EBADMSG;
>
>   done:
>   	sbefifo_drv_release(client);
> @@ -527,14 +539,17 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>   static int occ_trigger_attn(struct device *sbefifo)
>   {
>   	int rc;
> -	u32 buf[6];
> +	__be32 buf[6];
>   	struct sbefifo_client *client;
>
> +	/* Magic sequence to do SBE putscom command. SBE will write 8 bytes to
> +	 * specified SCOM address.
> +	 */
>   	buf[0] = cpu_to_be32(0x6);
>   	buf[1] = cpu_to_be32(0xa202);
>   	buf[2] = 0;
>   	buf[3] = cpu_to_be32(0x6D035);
> -	buf[4] = cpu_to_be32(0x20010000);
> +	buf[4] = cpu_to_be32(0x20010000);	/* trigger occ attention */
>   	buf[5] = 0;
>
>   	client = sbefifo_drv_open(sbefifo, 0);
> @@ -552,7 +567,7 @@ static int occ_trigger_attn(struct device *sbefifo)
>   	/* check for good response */
>   	if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
>   	    (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
> -		rc = -EFAULT;
> +		rc = -EBADMSG;
>
>   done:
>   	sbefifo_drv_release(client);
> @@ -564,12 +579,19 @@ static void occ_worker(struct work_struct *work)
>   {
>   	int rc = 0, empty, waiting, canceled;
>   	u16 resp_data_length;
> +	unsigned long start;
> +	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
> +	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
>   	struct occ_xfr *xfr;
> +	struct occ_response *resp;
>   	struct occ_client *client;
>   	struct occ *occ = container_of(work, struct occ, work);
>   	struct device *sbefifo = occ->sbefifo;
>
>   again:
> +	if (occ->cancel)
> +		return;
> +
>   	spin_lock_irq(&occ->list_lock);
>
>   	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
> @@ -578,11 +600,14 @@ static void occ_worker(struct work_struct *work)
>   		return;
>   	}
>
> +	resp = (struct occ_response *)xfr->buf;
>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>
>   	spin_unlock_irq(&occ->list_lock);
>   	mutex_lock(&occ->occ_lock);
>
> +	/* write occ command */
> +	start = jiffies;
>   	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
>   			 xfr->cmd_data_length);
>   	if (rc)
> @@ -592,13 +617,26 @@ static void occ_worker(struct work_struct *work)
>   	if (rc)
>   		goto done;
>
> -	rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> -	if (rc)
> -		goto done;
> +	/* read occ response */
> +	do {
> +		rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> +		if (rc)
> +			goto done;
> +
> +		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
> +			rc = -EALREADY;
> +
> +			if (time_after(jiffies, start + timeout))
> +				break;
>
> -	resp_data_length = (xfr->buf[3] << 8) + xfr->buf[4];
> +			set_current_state(TASK_INTERRUPTIBLE);
> +			schedule_timeout(wait_time);
> +		}
> +	} while (rc);
> +
> +	resp_data_length = get_unaligned_be16(&resp->data_length);
>   	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> -		rc = -EDOM;
> +		rc = -EMSGSIZE;
>   		goto done;
>   	}
>
> @@ -704,9 +742,6 @@ static int occ_probe(struct platform_device *pdev)
>   	mutex_init(&occ->occ_lock);
>   	INIT_WORK(&occ->work, occ_worker);
>
> -	/* ensure NULL before we probe children, so they don't hang FSI */
> -	platform_set_drvdata(pdev, NULL);
> -
>   	if (dev->of_node) {
>   		rc = of_property_read_u32(dev->of_node, "reg", &reg);
>   		if (!rc) {
> @@ -716,23 +751,13 @@ static int occ_probe(struct platform_device *pdev)
>   			if (occ->idx < 0)
>   				occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
>   							  GFP_KERNEL);
> -		} else
> +		} else {
>   			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
>   						  GFP_KERNEL);
> -
> -		/* create platform devs for dts child nodes (hwmon, etc) */
> -		for_each_child_of_node(dev->of_node, np) {
> -			snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> -				 occ->idx, child_idx++);
> -			child = of_platform_device_create(np, child_name, dev);
> -			if (!child)
> -				dev_warn(dev,
> -					 "failed to create child node dev\n");
>   		}
> -	} else
> +	} else {
>   		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
> -
> -	platform_set_drvdata(pdev, occ);
> +	}
>
>   	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
>   	occ->mdev.fops = &occ_fops;
> @@ -742,20 +767,42 @@ static int occ_probe(struct platform_device *pdev)
>
>   	rc = misc_register(&occ->mdev);
>   	if (rc) {
> -		dev_err(dev, "failed to register miscdevice\n");
> +		dev_err(dev, "failed to register miscdevice: %d\n", rc);
> +		ida_simple_remove(&occ_ida, occ->idx);
>   		return rc;
>   	}
>
> +	/* create platform devs for dts child nodes (hwmon, etc) */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> +			 occ->idx, child_idx++);
> +		child = of_platform_device_create(np, child_name, dev);
> +		if (!child)
> +			dev_warn(dev, "failed to create child node dev\n");
> +	}
> +
> +	platform_set_drvdata(pdev, occ);
> +
>   	return 0;
>   }
>
>   static int occ_remove(struct platform_device *pdev)
>   {
>   	struct occ *occ = platform_get_drvdata(pdev);
> +	struct occ_xfr *xfr;
> +	struct occ_client *client;
> +
> +	occ->cancel = true;
> +	list_for_each_entry(xfr, &occ->xfrs, link) {
> +		client = to_client(xfr);
> +		wake_up_interruptible(&client->wait);
> +	}
>
> -	flush_work(&occ->work);
>   	misc_deregister(&occ->mdev);
>   	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
> +
> +	flush_work(&occ->work);
> +
>   	ida_simple_remove(&occ_ida, occ->idx);
>
>   	return 0;
> @@ -789,6 +836,8 @@ static void occ_exit(void)
>   	destroy_workqueue(occ_wq);
>
>   	platform_driver_unregister(&occ_driver);
> +
> +	ida_destroy(&occ_ida);
>   }
>
>   module_init(occ_init);
> diff --git a/include/linux/occ.h b/include/linux/occ.h
> index d78332c..0a4a54a 100644
> --- a/include/linux/occ.h
> +++ b/include/linux/occ.h
> @@ -11,12 +11,26 @@
>    * GNU General Public License for more details.
>    */
>
> -#ifndef __OCC_H__
> -#define __OCC_H__
> +#ifndef LINUX_FSI_OCC_H
> +#define LINUX_FSI_OCC_H
>
>   struct device;
>   struct occ_client;
>
> +#define OCC_RESP_CMD_IN_PRG		0xFF
> +#define OCC_RESP_SUCCESS		0
> +#define OCC_RESP_CMD_INVAL		0x11
> +#define OCC_RESP_CMD_LEN_INVAL		0x12
> +#define OCC_RESP_DATA_INVAL		0x13
> +#define OCC_RESP_CHKSUM_ERR		0x14
> +#define OCC_RESP_INT_ERR		0x15
> +#define OCC_RESP_BAD_STATE		0x16
> +#define OCC_RESP_CRIT_EXCEPT		0xE0
> +#define OCC_RESP_CRIT_INIT		0xE1
> +#define OCC_RESP_CRIT_WATCHDOG		0xE2
> +#define OCC_RESP_CRIT_OCB		0xE3
> +#define OCC_RESP_CRIT_HW		0xE4
> +
>   extern struct occ_client *occ_drv_open(struct device *dev,
>   				       unsigned long flags);
>   extern int occ_drv_read(struct occ_client *client, char *buf, size_t len);
> @@ -24,4 +38,4 @@ extern int occ_drv_write(struct occ_client *client, const char *buf,
>   			 size_t len);
>   extern void occ_drv_release(struct occ_client *client);
>
> -#endif /* __OCC_H__ */
> +#endif /* LINUX_FSI_OCC_H */
