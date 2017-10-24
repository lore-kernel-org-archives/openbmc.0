Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLyB45r7MzDqfh
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 02:39:23 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9OFba0f067200
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 11:39:21 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dt5jefsk9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 11:39:20 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 24 Oct 2017 11:39:20 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 24 Oct 2017 11:39:17 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9OFdHoF59048068; Tue, 24 Oct 2017 15:39:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9968CAC048;
 Tue, 24 Oct 2017 11:40:01 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 197E5AC040;
 Tue, 24 Oct 2017 11:40:01 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort
 method
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508718675.6013.3.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 24 Oct 2017 10:39:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1508718675.6013.3.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17102415-0040-0000-0000-000003B73D90
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007946; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00935824; UDB=6.00471522; IPR=6.00716090; 
 BA=6.00005658; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017689; XFM=3.00000015;
 UTC=2017-10-24 15:39:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102415-0041-0000-0000-000007AC4982
Message-Id: <de884d77-04a2-1095-8198-89f2ce93e029@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710240215
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
X-List-Received-Date: Tue, 24 Oct 2017 15:39:25 -0000



On 10/22/2017 07:31 PM, Andrew Jeffery wrote:
> Hi Eddie,
>
> Apologies for not being more thorough initially, I'm back again with comments.
>
> On Fri, 2017-10-20 at 15:02 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Driver wasn't cleaning up on timeout or in an error situation properly.
>> Need to do a full reset if we fail in order to re-stablish a good state
>> of the engine.
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   
>> Changes since v1:
>>   * switch to TASK_UNINTERRUPTIBLE for waiting for command complete
>>   
>>   drivers/i2c/busses/i2c-fsi.c | 259 +++++++++++++++++++++++++++++++------------
>>   1 file changed, 191 insertions(+), 68 deletions(-)
>>   
>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
>> index 1af9c01..fa44017 100644
>> --- a/drivers/i2c/busses/i2c-fsi.c
>> +++ b/drivers/i2c/busses/i2c-fsi.c
>> @@ -133,6 +133,11 @@
>>   #define I2C_ESTAT_SELF_BUSY	0x00000040
>>   #define I2C_ESTAT_VERSION	0x0000001f
>>   
>> +#define I2C_PORT_BUSY_RESET	0x80000000
>> +
>> +#define I2C_LOCAL_WAIT_TIMEOUT	2		/* jiffies */
>> +#define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
>> +
>>   struct fsi_i2c_master {
>>   	struct fsi_device	*fsi;
>>   	u8			fifo_size;
>> @@ -351,22 +356,185 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
>>   	return rc;
>>   }
>>   
>> +static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
>> +{
>> +	int i, rc;
>> +	u32 mode, dummy = 0;
>> +
>> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> +	if (rc)
>> +		return rc;
>> +
>> +	mode |= I2C_MODE_DIAG;
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> +	if (rc)
>> +		return rc;
>> +
>> +	for (i = 0; i < 9; ++i) {
>> +		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
>> +		if (rc)
>> +			return rc;
> I take it we're okay with cycling the bus as fast as we can, and not try to
> maintain any particular rate? Not suggesting you need to change anything, just
> asking the question.

Yep, the spec doesn't give any indication of needing to rate-limit this 
toggling. This is always how it's been done for this master, and it 
seems to work.

>
>> +	}
>> +
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	mode &= ~I2C_MODE_DIAG;
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> +
>> +	return rc;
>> +}
>> +
>> +static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
>> +{
> I can't see that this (the whole reset sequence) is called with pre-emption
> disabled, perhaps we should do so? It looks like this will be called in process
> context through fsi_i2c_xfer(). Stalling the recovery will just hold up other
> processes wanting to use the bus as we'll hold the bus mutex across the task
> switch.

Well, presumably we want to block other access to the bus? We need to 
get the master back in a good state before releasing it for other transfers.

>
>> +	int rc;
>> +	u32 mode, stat, dummy = 0;
>> +
>> +	/* reset engine */
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* re-init engine */
>> +	rc = fsi_i2c_dev_init(i2c);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* set port; default after reset is 0 */
>> +	if (port) {
>> +		mode = SETFIELD(I2C_MODE_PORT, mode, port);
>> +		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	/* reset busy register; hw workaround */
>> +	dummy = I2C_PORT_BUSY_RESET;
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* force bus reset */
>> +	rc = fsi_i2c_reset_bus(i2c);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* reset errors */
>> +	dummy = 0;
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* wait for command complete */
>> +	set_current_state(TASK_UNINTERRUPTIBLE);
>> +	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
>> +
>> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (stat & I2C_STAT_CMD_COMP)
>> +		return 0;
>> +
>> +	/* failed to get command complete; reset engine again */
>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* re-init engine again */
>> +	rc = fsi_i2c_dev_init(i2c);
>> +	if (rc)
>> +		return rc;
>> +
>> +	return 0;
>> +}
>> +
>> +static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
>> +{
>> +	int rc;
>> +	unsigned long start;
>> +	u32 cmd = I2C_CMD_WITH_STOP;
>> +	struct fsi_device *fsi = port->master->fsi;
>> +
>> +	rc = fsi_i2c_reset(port->master, port->port);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* skip final stop command for these errors */
>> +	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
>> +		return 0;
>> +
>> +	rc = fsi_i2c_write_reg(fsi, I2C_FSI_CMD, &cmd);
>> +	if (rc)
>> +		return rc;
>> +
>> +	start = jiffies;
>> +
>> +	do {
>> +		rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &status);
>> +		if (rc)
>> +			return rc;
>> +
>> +		if (status & I2C_STAT_CMD_COMP)
>> +			return 0;
>> +
>> +		set_current_state(TASK_INTERRUPTIBLE);
>> +		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0)
>> +			return -EINTR;
>> +
>> +	} while (time_after(start + I2C_ABORT_TIMEOUT, jiffies));
> I'm a bit ignorant here, but why do we expect the abort operation to take up to
> 100ms? You mentioned you invented the numbers, but it's not clear what the
> justification is.

I used the same timeout used in the FSP driver, which seems to work. I 
really have no other justification for this value.

>
>> +
>> +	return -ETIME;
>> +}
>> +
>>   static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>>   				 struct i2c_msg *msg, u32 status)
>>   {
>>   	int rc;
>>   	u8 fifo_count;
>> -	struct fsi_i2c_master *i2c = port->master;
>> -	u32 dummy = 0;
>>   
>>   	if (status & I2C_STAT_ERR) {
>> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>> +		rc = fsi_i2c_abort(port, status);
>>   		if (rc)
>>   			return rc;
>>   
>> +		if (status & I2C_STAT_INV_CMD)
>> +			return -EINVAL;
>> +
>> +		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
>> +		    I2C_STAT_BE_ACCESS))
>> +			return -EPROTO;
>> +
>>   		if (status & I2C_STAT_NACK)
>>   			return -EFAULT;
> EFAULT is "Bad address", but slaves can NACK things that aren't addresses.
> As an example i2c-aspeed calls a NACK an EIO.

True, but I dislike returning EIO as it's somewhat of a default option 
and makes it very difficult to determine what actually went wrong. How 
about ENXIO?

>
>>   
>> +		if (status & I2C_STAT_LOST_ARB)
>> +			return -ECANCELED;
> So checking around the tree, all of i2c-aspeed, i2c-designware-core,
> i2c-hix5hd2, i2c-kempld to name a few (I stopped checking at that point) use
> -EAGAIN for arbitration loss. I don't think -ECANCELLED is appropriate, and
> certainly think that -EAGAIN is what we want: Nothing went wrong aside from
> this master lost the arbitration race, so the caller should really just retry.

Good point, however, for this master, it can often return arbitration 
lost if the clock or data line is stuck, and retries will not work. I'll 
switch it to EAGAIN, callers shouldn't try too many times hopefully...

Thanks!
Eddie

>
>> +
>> +		if (status & I2C_STAT_STOP_ERR)
>> +			return -EBADMSG;
>> +
>>   		return -EIO;
>>   	}
>>   
>> @@ -396,9 +564,9 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>>   static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
>>   			unsigned long timeout)
>>   {
>> -	const unsigned long local_timeout = 2; /* jiffies */
>>   	u32 status = 0;
>> -	int rc;
>> +	int rc, rc_abort;
>> +	unsigned long start = jiffies;
>>   
>>   	do {
>>   		rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
>> @@ -419,13 +587,21 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
>>   			continue;
>>   		}
>>   
>> -		set_current_state(TASK_UNINTERRUPTIBLE);
>> -		schedule_timeout(local_timeout);
>> -		timeout = (timeout < local_timeout) ? 0 :
>> -			timeout - local_timeout;
>> -	} while (timeout);
>> +		set_current_state(TASK_INTERRUPTIBLE);
>> +		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0) {
>> +			rc = -EINTR;
>> +			goto abort;
>> +		}
>> +	} while (time_after(start + timeout, jiffies));
>>   
>> -	return -ETIME;
>> +	rc = -ETIME;
>> +
>> +abort:
>> +	rc_abort = fsi_i2c_abort(port, status);
>> +	if (rc_abort)
>> +		return rc_abort;
>> +
>> +	return rc;
>>   }
>>   
>>   static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>> @@ -469,72 +645,19 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
>>   		| I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>>   }
>>   
>> -static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
>> -{
>> -	int i, rc;
>> -	u32 mode, dummy = 0;
>> -
>> -	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> -	if (rc)
>> -		return rc;
>> -
>> -	mode |= I2C_MODE_DIAG;
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> -	if (rc)
>> -		return rc;
>> -
>> -	for (i = 0; i < 9; ++i) {
>> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
>> -		if (rc)
>> -			return rc;
>> -
>> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
>> -		if (rc)
>> -			return rc;
>> -	}
>> -
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
>> -	if (rc)
>> -		return rc;
>> -
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
>> -	if (rc)
>> -		return rc;
>> -
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
>> -	if (rc)
>> -		return rc;
>> -
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
>> -	if (rc)
>> -		return rc;
>> -
>> -	mode &= ~I2C_MODE_DIAG;
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>> -
>> -	return rc;
>> -}
>> -
>>   static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
>>   {
>>   	int rc;
>> -	u32 dummy = 0;
>>   	struct fsi_i2c_port *port = adap->algo_data;
>> -	struct fsi_i2c_master *i2c = port->master;
>> +	struct fsi_i2c_master *master = port->master;
>>   
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
>> +	rc = fsi_i2c_lock_master(master, adap->timeout);
>>   	if (rc)
>>   		return rc;
>>   
>> -	rc = fsi_i2c_dev_init(i2c);
>> -	if (rc)
>> -		return rc;
>> +	rc = fsi_i2c_reset(master, port->port);
>>   
>> -	rc = fsi_i2c_low_level_recover_bus(i2c);
>> -	if (rc)
>> -		return rc;
>> -
>> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>> +	fsi_i2c_unlock_master(master);
>>   
>>   	return rc;
>>   }
> Cheers,
>
> Andrew
