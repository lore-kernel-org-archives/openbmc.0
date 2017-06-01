Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdrcC4Bj5zDq5j
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 01:19:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v51FJOMi125744
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jun 2017 11:19:36 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2atfwhtdxd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2017 11:19:32 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 1 Jun 2017 11:18:55 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 1 Jun 2017 11:18:53 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v51FIqr053018754; Thu, 1 Jun 2017 15:18:52 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07731112063;
 Thu,  1 Jun 2017 11:18:57 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 961A1112040;
 Thu,  1 Jun 2017 11:18:56 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 2/3] drivers: fsi: sbefifo: Add OCC driver
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bradleyb@fuzziesquirrel.com,
 cbostic@linux.vnet.ibm.com
References: <1494617900-32369-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1494617900-32369-3-git-send-email-eajames@linux.vnet.ibm.com>
 <e7cbf946-e10e-5868-10bc-5c56e0b9c25f@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 1 Jun 2017 10:18:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <e7cbf946-e10e-5868-10bc-5c56e0b9c25f@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17060115-0008-0000-0000-00000230E722
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007153; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00868723; UDB=6.00431752; IPR=6.00648597; 
 BA=6.00005393; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015670; XFM=3.00000015;
 UTC=2017-06-01 15:18:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060115-0009-0000-0000-0000357DF618
Message-Id: <facd6a25-e520-f45a-0f7f-844d4f84c87c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706010285
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
X-List-Received-Date: Thu, 01 Jun 2017 15:19:40 -0000



On 06/01/2017 01:55 AM, Jeremy Kerr wrote:
> Hi Eddie,
>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> This driver provides an atomic communications channel between the OCC on
>> the POWER9 processor and a service processor (a BMC). The driver is
>> dependent on the FSI SBEIFO driver to get hardware access to the OCC
>> SRAM.
>>
>> The format of the communication is a command followed by a response.
>> Since the command and response must be performed atomically, the driver
>> will perform this operations asynchronously. In this way, a write
>> operation starts the command, and a read will gather the response data
>> once it is complete.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Overall, this looks pretty good. The userspace ABI seems straightforward
> (which is the important part to get right early), which is great.
>
> I do have a few comments though, provided inline. However, most of these
> are fairly minor. We do need to sort out the DT representation though,
> as that's harder to change post-merge.

Hi, thanks for the review. I'm switching to a different way to access 
the OCC SRAM (SBE getSram/putSram calls), so some of this will be 
refactored.

>
>> --- a/drivers/fsi/Kconfig
>> +++ b/drivers/fsi/Kconfig
>> @@ -36,6 +36,15 @@ config FSI_SBEFIFO
>>   	---help---
>>   	This option enables an FSI based SBEFIFO device driver.
>>   
>> +if FSI_SBEFIFO
>> +
>> +config OCC
>> +	tristate "OCC SBEFIFO client device driver"
>> +	---help---
>> +	This option enables an SBEFIFO based OCC device driver.
>> +
>> +endif
>> +
>>   endif
> I don't think we need the `if FSI_SBEFIFO` there, as you've already got
> the `depends on FSI_SBEFIFO` (ie., there's no need to hide it from the
> menu).
>
>> +#define OCC_SRAM_BYTES		4096
>> +#define OCC_CMD_DATA_BYTES	4090
>> +#define OCC_RESP_DATA_BYTES	4089
>> +
>> +struct occ {
>> +	struct device *sbefifo;
>> +	char name[32];
>> +	int idx;
>> +	struct miscdevice mdev;
>> +	struct list_head xfrs;
>> +	spinlock_t list_lock;
>> +	spinlock_t occ_lock;
>> +	struct work_struct work;
>> +};
> Since you have two locks there, can you describe what each lock
> protects?
>
> Also, does occ_lock need to be a spin_lock? Looks like we're doing quite
> a lot with that held - can we change to a mutex instead?

Yes, we can probably use a mutex there. occ_lock controls access to the 
hardware, so clients don't step on each other. list_lock controls access 
to the list of xfrs when we're deleting and adding transfers. I'll add a 
comment.

>
>> +struct occ_xfr;
>> +
>> +enum {
>> +	CLIENT_NONBLOCKING,
>> +};
>> +
>> +struct occ_client {
>> +	struct occ *occ;
>> +	struct occ_xfr *xfr;
>> +	spinlock_t lock;
>> +	wait_queue_head_t wait;
>> +	size_t read_offset;
>> +	unsigned long flags;
>> +};
>> +
>> +enum {
>> +	XFR_IN_PROGRESS,
>> +	XFR_COMPLETE,
>> +	XFR_CANCELED,
>> +	XFR_WAITING,
>> +};
> This looks like a set of states; but you're storing them in a bitmask
> (so, you can have multiple states asserted at the same time). Is that
> necessary, or are these mutually exclusive (which would be much simple
> to follow)?
>
> If we do need to support multiple states, could you add a comment here
> indicating which combinations are valid, and the transitions between
> states?

XFR_WAITING can be combined with the others, and I'm planning another 
flag that will be in combination. I'll add a comment.

>
>> +static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
>> +			loff_t *offset)
>> +{
>> +	int rc;
>> +	size_t bytes;
>> +	struct occ_xfr *xfr;
>> +	struct occ_client *client = file->private_data;
>> +
>> +	if (!access_ok(VERIFY_WRITE, buf, len))
>> +		return -EFAULT;
> This is probably redundant, as you're (correctly) using copy_to_user
> below.
>
>> +
>> +	if (len > OCC_SRAM_BYTES)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irq(&client->lock);
>> +	if (!client->xfr) {
>> +		/* we just finished reading all data, return 0 */
>> +		if (client->read_offset) {
>> +			rc = 0;
>> +			client->read_offset = 0;
>> +		} else
>> +			rc = -ENOMSG;
> Super minor nit: closing curly brace and 'else' go on the same line.
>
>> +static ssize_t occ_write(struct file *file, const char __user *buf,
>> +			 size_t len, loff_t *offset)
>> +{
>> +	int rc;
>> +	struct occ_xfr *xfr;
>> +	struct occ_client *client = file->private_data;
>> +
>> +	if (!access_ok(VERIFY_READ, buf, len))
>> +		return -EFAULT;
>> +
>> +	if (len > OCC_SRAM_BYTES)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irq(&client->lock);
>> +	if (client->xfr) {
>> +		rc = -EDEADLK;
>> +		goto done;
>> +	}
> I think -EBUSY would be better here.
>
> In general, it looks like the code supports two separate processes
> performing independent writes. In that case, you already have the
> correct sequencing in the interface to the OCC, could we possibly
> support multiple queued writes on the one client? Assuming reads()
> return the responses in the order that they were written...
>
> Or is there no point in doing that?

The idea was to allow multiple clients on multiple devices to do their 
thing and get their results in the right order. I could try and figure 
out multiple transfers pending on one client, but I couldn't quite see a 
use case for it. I'll think about it a bit more.

>
>> +
>> +	xfr = kzalloc(sizeof(*xfr), GFP_KERNEL);
>> +	if (!xfr) {
>> +		rc = -ENOMEM;
>> +		goto done;
>> +	}
> Do we need to allocate xfr on every read/write? Could we just allocate
> this as part of struct occfifo_client, and re-use that?

Yea if we stick with one xfr per client, that make more sense.

>
>> +static int occ_getscom(struct device *sbefifo, u32 address, u8 *data)
>> +{
>> +	int rc;
>> +	u32 buf[4];
>> +	struct sbefifo_client *client;
>> +	const size_t len = sizeof(buf);
>> +
>> +	buf[0] = cpu_to_be32(0x4);
>> +	buf[1] = cpu_to_be32(0xa201);
>> +	buf[2] = 0;
>> +	buf[3] = cpu_to_be32(address);
> No endianness concerns there? I haven't had a thorough look at the
> sbefifo_drv_read/_write API, do they define an endianness for the
> buffers?

sbefifo driver just passes the data through to the actual SBE, which 
expects data in big endian.

>
>> +
>> +	client = sbefifo_drv_open(sbefifo, 0);
>> +	if (!client)
>> +		return -ENODEV;
>> +
>> +	rc = sbefifo_drv_write(client, (const char *)buf, len);
>> +	if (rc < 0)
>> +		goto done;
>> +	else if (rc != len) {
>> +		rc = -EMSGSIZE;
>> +		goto done;
>> +	}
> Using a compound statements for only one (but not all) branches of an
> conditional expression freaks me out a bit, mainly from the bugs that
> have arisen from subsequent changes to the code.
>
> Also, you're not passing on negative rc values to the caller?
>
>> +static int occ_putscom_u32(struct device *sbefifo, u32 address, u32 data0,
>> +			   u32 data1)
> Does that make sense to split into two u32s, instead of a single u64?
>
> I know a some of the existing scom interfaces split it up, but is there
> a particular reason we need to carry that over to this code?

Mostly due to the endian swapping, SBE expects things in words for some 
reason, so we have to swap them in 32 bit chunks.

>
>> +static int occ_probe(struct platform_device *pdev)
>> +{
>> +	int rc;
>> +	u32 reg;
>> +	struct occ *occ;
>> +	struct device *dev = &pdev->dev;
>> +
>> +	dev_info(dev, "Found occ device\n");
> This probably isn't necessary; the presence of the device itself is a
> pretty good indication that we probed one (and you have a log on the
> error case).
>
>> +	occ = devm_kzalloc(dev, sizeof(*occ), GFP_KERNEL);
>> +	if (!occ)
>> +		return -ENOMEM;
>> +
>> +	occ->sbefifo = dev->parent;
>> +	INIT_LIST_HEAD(&occ->xfrs);
>> +	spin_lock_init(&occ->list_lock);
>> +	spin_lock_init(&occ->occ_lock);
>> +	INIT_WORK(&occ->work, occ_worker);
>> +
>> +	if (dev->of_node) {
>> +		rc = of_property_read_u32(dev->of_node, "reg", &reg);
>> +		if (!rc) {
>> +			/* make sure we don't have a duplicate from dts */
>> +			occ->idx = ida_simple_get(&occ_ida, reg, reg + 1,
>> +						  GFP_KERNEL);
>> +			if (occ->idx < 0)
>> +				occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
>> +							  GFP_KERNEL);
>> +		} else
>> +			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
>> +						  GFP_KERNEL);
> We'll need a binding document for this. What is the reg property
> representing, hardware-wise?
>
> Traditionally, reg is the address of the device on the parent bus, and
> so it'd totally find to have multiple devices in the system to share reg
> values (provided they're on different busses). So, I'm not sure that
> this is the usage that we want here; perhaps another property name would
> be better...

reg just represents the processor index. Maybe "proc"?

>
>> +static int occ_remove(struct platform_device *pdev)
>> +{
>> +	struct occ_xfr *xfr, *tmp;
>> +	struct occ *occ = platform_get_drvdata(pdev);
>> +	struct occ_client *client;
>> +
>> +	misc_deregister(&occ->mdev);
>> +
>> +	spin_lock_irq(&occ->list_lock);
>> +	list_for_each_entry_safe(xfr, tmp, &occ->xfrs, link) {
> Do you ever hit this code? I'd have assumed that ->remove is going to be
> called once all open file descriptors have gone, and your ->release
> should have emptied the transfer lists at that point...

Good to know, I don't think this ever gets used, I was just worried 
about FSI going away and removing everything mid-transfer.

Thanks,
Eddie

>
> Cheers,
>
>
> Jeremy
>
