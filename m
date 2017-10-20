Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJS9V3PqjzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 01:00:14 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9KDxk5w072871
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 10:00:11 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dqhss9s3r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 10:00:10 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 20 Oct 2017 10:00:09 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 20 Oct 2017 10:00:06 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9KE02ix57278690; Fri, 20 Oct 2017 14:00:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE3A9AC06C;
 Fri, 20 Oct 2017 10:00:48 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 464D3AC041;
 Fri, 20 Oct 2017 10:00:48 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers: i2c: fsi: Add proper abort method
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508476526.24322.36.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 20 Oct 2017 09:00:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1508476526.24322.36.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17102014-0052-0000-0000-00000274BBA2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007923; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00933879; UDB=6.00470421; IPR=6.00714167; 
 BA=6.00005651; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017624; XFM=3.00000015;
 UTC=2017-10-20 14:00:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102014-0053-0000-0000-000052614721
Message-Id: <aa146f45-4778-20c2-2ba8-447cc2901081@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710200197
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
X-List-Received-Date: Fri, 20 Oct 2017 14:00:15 -0000



On 10/20/2017 12:15 AM, Andrew Jeffery wrote:
> On Thu, 2017-10-12 at 15:42 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Driver wasn't cleaning up on timeout or in an error situation properly.
>> Need to do a full reset if we fail in order to re-stablish a good state
>> of the engine.
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/i2c/busses/i2c-fsi.c | 259 +++++++++++++++++++++++++++++++------------
>>   1 file changed, 191 insertions(+), 68 deletions(-)
>>   
>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
>> index 1af9c01..6c582d8 100644
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
>> +	set_current_state(TASK_INTERRUPTIBLE);
>> +	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
> Shouldn't we use the uninterruptible state to ensure we get at least
> I2C_LOCAL_WAIT_TIMEOUT in the face of signals?

Good point, I'll switch that.

Thanks!
Eddie

>
> Andrew
