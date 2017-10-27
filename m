Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNr482sPlzDqfh
 for <openbmc@lists.ozlabs.org>; Sat, 28 Oct 2017 04:10:45 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9RH6dXK121506
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 13:10:42 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dv55dd02x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 13:10:42 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 27 Oct 2017 11:10:41 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 27 Oct 2017 11:10:38 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9RHAcmd63897686; Fri, 27 Oct 2017 10:10:38 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48CD8C6051;
 Fri, 27 Oct 2017 11:10:38 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id F3A09C6042;
 Fri, 27 Oct 2017 11:10:37 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort
 method
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508718675.6013.3.camel@aj.id.au>
 <de884d77-04a2-1095-8198-89f2ce93e029@linux.vnet.ibm.com>
 <1508893417.13477.1.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 27 Oct 2017 12:10:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1508893417.13477.1.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17102717-0016-0000-0000-000007B834BE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007962; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00937295; UDB=6.00472401; IPR=6.00717557; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017745; XFM=3.00000015;
 UTC=2017-10-27 17:10:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102717-0017-0000-0000-00003C066124
Message-Id: <57eb4d71-3db5-d3ec-7a67-db3013c872d8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-27_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710270222
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
X-List-Received-Date: Fri, 27 Oct 2017 17:10:50 -0000



On 10/24/2017 08:03 PM, Andrew Jeffery wrote:
>>>> +static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
>>>> +{
>>>   
>>> I can't see that this (the whole reset sequence) is called with pre-emption
>>> disabled, perhaps we should do so? It looks like this will be called in process
>>> context through fsi_i2c_xfer(). Stalling the recovery will just hold up other
>>> processes wanting to use the bus as we'll hold the bus mutex across the task
>>> switch.
>>   
>> Well, presumably we want to block other access to the bus? We need to
>> get the master back in a good state before releasing it for other transfers.
> Right, that's my point. By disabling pre-emption we do that as fast as
> possible by avoiding switching to other process contexts whilst holding the
> mutex. This would happen at the cost of processes that don't care about the
> bus (those that do are, or will, be waiting on the mutex anyway), but as we're
> performing a hardware recovery sequence I feel it should be prioritised. Only
> the context owning the mutex can recover the bus, therefore I think it's more
> useful to avoid switching to other process contexts until we finish the
> recovery.
>
> I guess we need to think about system robustness in that case though. Can we
> get stuck in this recovery sequence? fsi_*() calls time out if I recall
> correctly, so the answer would appear to be no, in which case this shouldn't be
> problematic. The system might be "sticky" if we start hitting FSI timeouts but
> beyond that things should continue (aside from either FSI or the I2C bus being
> broken).
>
> So this is all coming from my gut feeling that things like bus recovery would
> usually happen under a spinlock, which disables pre-emption. Maybe we should
> discuss that before getting down in the weeds like we are.

Yea, that makes sense, I can add a spinlock here. I don't think FSI will 
hang. If it does, we will have similar
problems in spinlocks in the SBEFIFO driver.

>
>>   
>>>   
>>>> +	int rc;
>>>> +	u32 mode, stat, dummy = 0;
>>>> +
>>>> +	/* reset engine */
>>>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* re-init engine */
>>>> +	rc = fsi_i2c_dev_init(i2c);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* set port; default after reset is 0 */
>>>> +	if (port) {
>>>> +		mode = SETFIELD(I2C_MODE_PORT, mode, port);
>>>> +		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>>>> +		if (rc)
>>>> +			return rc;
>>>> +	}
>>>> +
>>>> +	/* reset busy register; hw workaround */
>>>> +	dummy = I2C_PORT_BUSY_RESET;
>>>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* force bus reset */
>>>> +	rc = fsi_i2c_reset_bus(i2c);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* reset errors */
>>>> +	dummy = 0;
>>>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* wait for command complete */
>>>> +	set_current_state(TASK_UNINTERRUPTIBLE);
>>>> +	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
>>>> +
>>>> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	if (stat & I2C_STAT_CMD_COMP)
>>>> +		return 0;
>>>> +
>>>> +	/* failed to get command complete; reset engine again */
>>>> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* re-init engine again */
>>>> +	rc = fsi_i2c_dev_init(i2c);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
>>>> +{
>>>> +	int rc;
>>>> +	unsigned long start;
>>>> +	u32 cmd = I2C_CMD_WITH_STOP;
>>>> +	struct fsi_device *fsi = port->master->fsi;
>>>> +
>>>> +	rc = fsi_i2c_reset(port->master, port->port);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	/* skip final stop command for these errors */
>>>> +	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
>>>> +		return 0;
>>>> +
>>>> +	rc = fsi_i2c_write_reg(fsi, I2C_FSI_CMD, &cmd);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +
>>>> +	start = jiffies;
>>>> +
>>>> +	do {
>>>> +		rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &status);
>>>> +		if (rc)
>>>> +			return rc;
>>>> +
>>>> +		if (status & I2C_STAT_CMD_COMP)
>>>> +			return 0;
>>>> +
>>>> +		set_current_state(TASK_INTERRUPTIBLE);
>>>> +		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0)
>>>> +			return -EINTR;
>>>> +
>>>> +	} while (time_after(start + I2C_ABORT_TIMEOUT, jiffies));
>>>   
>>> I'm a bit ignorant here, but why do we expect the abort operation to take up to
>>> 100ms? You mentioned you invented the numbers, but it's not clear what the
>>> justification is.
>>   
>> I used the same timeout used in the FSP driver, which seems to work. I
>> really have no other justification for this value.
> That's probably worth a comment in the code.
>
>>   
>>>   
>>>> +
>>>> +	return -ETIME;
>>>> +}
>>>> +
>>>>    static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>>>>    				 struct i2c_msg *msg, u32 status)
>>>>    {
>>>>    	int rc;
>>>>    	u8 fifo_count;
>>>> -	struct fsi_i2c_master *i2c = port->master;
>>>> -	u32 dummy = 0;
>>>>    
>>>>    	if (status & I2C_STAT_ERR) {
>>>> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>>>> +		rc = fsi_i2c_abort(port, status);
>>>>    		if (rc)
>>>>    			return rc;
>>>>    
>>>> +		if (status & I2C_STAT_INV_CMD)
>>>> +			return -EINVAL;
>>>> +
>>>> +		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
>>>> +		    I2C_STAT_BE_ACCESS))
>>>> +			return -EPROTO;
>>>> +
>>>>    		if (status & I2C_STAT_NACK)
>>>>    			return -EFAULT;
>>>   
>>> EFAULT is "Bad address", but slaves can NACK things that aren't addresses.
>>> As an example i2c-aspeed calls a NACK an EIO.
>>   
>> True, but I dislike returning EIO as it's somewhat of a default option
>> and makes it very difficult to determine what actually went wrong. How
>> about ENXIO?
> What does userspace do with that knowledge? Is it worth differentiating? I
> can't immediately see that it is. Maybe it's worth a dev_dbg() or something?
> I feel ENXIO doesn't address my point either, as it means "No such device or
> address", which is still inappropriate for data NACKs.

Well, when someone sees an i2c failure and opens a defect and assigns it 
to me, I would like to know if it was a NACK or something else :) If I 
see EIO, it could be either some other I2C error, an FSI bus error, o 
probably even a GPIO error. And dev_dbg probably won't help in the field 
since it'll be compiled out.

>
>>   
>>>   
>>>>    
>>>> +		if (status & I2C_STAT_LOST_ARB)
>>>> +			return -ECANCELED;
>>>   
>>> So checking around the tree, all of i2c-aspeed, i2c-designware-core,
>>> i2c-hix5hd2, i2c-kempld to name a few (I stopped checking at that point) use
>>> -EAGAIN for arbitration loss. I don't think -ECANCELLED is appropriate, and
>>> certainly think that -EAGAIN is what we want: Nothing went wrong aside from
>>> this master lost the arbitration race, so the caller should really just retry.
>>   
>> Good point, however, for this master, it can often return arbitration
>> lost if the clock or data line is stuck, and retries will not work. I'll
>> switch it to EAGAIN, callers shouldn't try too many times hopefully...
> Can we test status again when a new transfer is starting to see if we need to
> recover the bus before proceeding?

Well with this change, bus should be recovered after any failure, if 
recovery is possible. I more meant the case when the clock or data line 
is really stuck such that the master cannot recover them.

Thanks for the review!
Eddie
>
> Cheers,
>
> Andrew
