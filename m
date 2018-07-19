Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WbNh5Gg3zDqCD
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 00:04:20 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6JDsPID031781
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 10:04:17 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kau2xk6aj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 10:04:17 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 19 Jul 2018 10:04:15 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Jul 2018 10:04:13 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6JE4Ctn19595566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Jul 2018 14:04:12 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66572B2067;
 Thu, 19 Jul 2018 10:04:02 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 113C4B2064;
 Thu, 19 Jul 2018 10:04:01 -0400 (EDT)
Received: from oc6728276242.ibm.com (unknown [9.80.217.217])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Jul 2018 10:04:00 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.17] i2c: fsi: Sync with v12 upstream submission
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20180719044258.11706-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 19 Jul 2018 09:04:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180719044258.11706-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18071914-2213-0000-0000-000002CD3D64
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009391; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01063073; UDB=6.00545876; IPR=6.00840925; 
 MB=3.00022202; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-19 14:04:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071914-2214-0000-0000-00005AE4B642
Message-Id: <c0da901d-f1ee-863d-13ef-9d9066f55105@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-19_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807190149
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2018 14:04:21 -0000



On 07/18/2018 11:42 PM, Joel Stanley wrote:
> This incorporates the changes made with the recent cycles of review on
> the linux-i2c mailing list.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Eddie, I've used your latest submission to update the openbmc tree. I
> think it makes sense to get it into the tree for testing as soon as
> possible.

Yep, agreed. Patch looks correct, thanks!

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> The patch was created bit removing the i2c-fsi changes, applying your
> series, and then squishing it all into one patch.
>
>   drivers/i2c/busses/i2c-fsi.c | 202 ++++++++++++++++++++---------------
>   1 file changed, 113 insertions(+), 89 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index ee219c7131a0..1e2be2219a60 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -247,7 +247,7 @@ static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   	if (stop || msg->flags & I2C_M_STOP)
>   		cmd |= I2C_CMD_WITH_STOP;
>
> -	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr >> 1);
> +	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr);
>   	cmd |= FIELD_PREP(I2C_CMD_LEN, msg->len);
>
>   	return fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, &cmd);
> @@ -326,72 +326,119 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   	return 0;
>   }
>
> -static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
> +static int fsi_i2c_get_scl(struct i2c_adapter *adap)
>   {
> -	int i, rc;
> -	u32 mode, stat, ext, dummy = 0;
> +	u32 stat = 0;
> +	struct fsi_i2c_port *port = adap->algo_data;
> +	struct fsi_i2c_master *i2c = port->master;
>
> -	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> -	if (rc)
> -		return rc;
> +	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>
> -	mode |= I2C_MODE_DIAG;
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> -	if (rc)
> -		return rc;
> +	return !!(stat & I2C_STAT_SCL_IN);
> +}
>
> -	for (i = 0; i < 9; i++) {
> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> -		if (rc)
> -			return rc;
> +static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
> +{
> +	u32 dummy = 0;
> +	struct fsi_i2c_port *port = adap->algo_data;
> +	struct fsi_i2c_master *i2c = port->master;
>
> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> -		if (rc)
> -			return rc;
> -	}
> +	if (val)
> +		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> +	else
> +		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> +}
>
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> -	if (rc)
> -		return rc;
> +static int fsi_i2c_get_sda(struct i2c_adapter *adap)
> +{
> +	u32 stat = 0;
> +	struct fsi_i2c_port *port = adap->algo_data;
> +	struct fsi_i2c_master *i2c = port->master;
>
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
> -	if (rc)
> -		return rc;
> +	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
> +
> +	return !!(stat & I2C_STAT_SDA_IN);
> +}
> +
> +static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
> +{
> +	u32 dummy = 0;
> +	struct fsi_i2c_port *port = adap->algo_data;
> +	struct fsi_i2c_master *i2c = port->master;
> +
> +	if (val)
> +		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
> +	else
> +		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
> +}
> +
> +static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
> +{
> +	int rc;
> +	u32 mode;
> +	struct fsi_i2c_port *port = adap->algo_data;
> +	struct fsi_i2c_master *i2c = port->master;
>
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>   	if (rc)
> -		return rc;
> +		return;
> +
> +	mode |= I2C_MODE_DIAG;
> +	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +}
>
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
> +static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
> +{
> +	int rc;
> +	u32 mode;
> +	struct fsi_i2c_port *port = adap->algo_data;
> +	struct fsi_i2c_master *i2c = port->master;
> +
> +	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
>   	if (rc)
> -		return rc;
> +		return;
>
>   	mode &= ~I2C_MODE_DIAG;
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +}
> +
> +static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
> +			     struct fsi_i2c_port *port)
> +{
> +	int rc;
> +	u32 stat, dummy = 0;
> +
> +	/* force bus reset, ignore errors */
> +	i2c_recover_bus(&port->adapter);
> +
> +	/* reset errors */
> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>   	if (rc)
>   		return rc;
>
> +	/* wait for command complete */
> +	usleep_range(I2C_RESET_SLEEP_MIN_US, I2C_RESET_SLEEP_MAX_US);
> +
>   	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
>   	if (rc)
>   		return rc;
>
> -	/* check for hardware fault */
> -	if (!(stat & I2C_STAT_SCL_IN) || !(stat & I2C_STAT_SDA_IN)) {
> -		rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_ESTAT, &ext);
> -		if (rc)
> -			return rc;
> +	if (stat & I2C_STAT_CMD_COMP)
> +		return 0;
>
> -		dev_err(&i2c->fsi->dev, "bus stuck status[%08X] ext[%08X]\n",
> -			stat, ext);
> -	}
> +	/* failed to get command complete; reset engine again */
> +	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> +	if (rc)
> +		return rc;
>
> -	return 0;
> +	/* re-init engine again */
> +	return fsi_i2c_dev_init(i2c);
>   }
>
> -static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> +static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
>   {
>   	int rc;
> -	u32 mode, stat, dummy = 0;
> +	u32 mode, dummy = 0;
>
>   	/* reset engine */
>   	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> @@ -422,34 +469,7 @@ static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
>   	if (rc)
>   		return rc;
>
> -	/* force bus reset */
> -	rc = fsi_i2c_reset_bus(i2c);
> -	if (rc)
> -		return rc;
> -
> -	/* reset errors */
> -	dummy = 0;
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> -	if (rc)
> -		return rc;
> -
> -	/* wait for command complete */
> -	usleep_range(I2C_RESET_SLEEP_MIN_US, I2C_RESET_SLEEP_MAX_US);
> -
> -	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
> -	if (rc)
> -		return rc;
> -
> -	if (stat & I2C_STAT_CMD_COMP)
> -		return rc;
> -
> -	/* failed to get command complete; reset engine again */
> -	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> -	if (rc)
> -		return rc;
> -
> -	/* re-init engine again */
> -	return fsi_i2c_dev_init(i2c);
> +	return 0;
>   }
>
>   static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
> @@ -457,12 +477,25 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
>   	int rc;
>   	unsigned long start;
>   	u32 cmd = I2C_CMD_WITH_STOP;
> -	struct fsi_device *fsi = port->master->fsi;
> +	u32 stat;
> +	struct fsi_i2c_master *i2c = port->master;
> +	struct fsi_device *fsi = i2c->fsi;
> +
> +	rc = fsi_i2c_reset_engine(i2c, port->port);
> +	if (rc)
> +		return rc;
>
> -	rc = fsi_i2c_reset(port->master, port->port);
> +	rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &stat);
>   	if (rc)
>   		return rc;
>
> +	/* if sda is low, peform full bus reset */
> +	if (!(stat & I2C_STAT_SDA_IN)) {
> +		rc = fsi_i2c_reset_bus(i2c, port);
> +		if (rc)
> +			return rc;
> +	}
> +
>   	/* skip final stop command for these errors */
>   	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
>   		return 0;
> @@ -607,26 +640,17 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
>   {
>   	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING |
> -		I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL |
> -		I2C_FUNC_SMBUS_BLOCK_DATA;
> -}
> -
> -static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
> -{
> -	int rc;
> -	struct fsi_i2c_port *port = adap->algo_data;
> -	struct fsi_i2c_master *master = port->master;
> -
> -	mutex_lock(&master->lock);
> -
> -	rc = fsi_i2c_reset(master, port->port);
> -
> -	mutex_unlock(&master->lock);
> -	return rc;
> +		I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>   }
>
>   static struct i2c_bus_recovery_info fsi_i2c_bus_recovery_info = {
> -	.recover_bus = fsi_i2c_recover_bus,
> +	.recover_bus = i2c_generic_scl_recovery,
> +	.get_scl = fsi_i2c_get_scl,
> +	.set_scl = fsi_i2c_set_scl,
> +	.get_sda = fsi_i2c_get_sda,
> +	.set_sda = fsi_i2c_set_sda,
> +	.prepare_recovery = fsi_i2c_prepare_recovery,
> +	.unprepare_recovery = fsi_i2c_unprepare_recovery,
>   };
>
>   static const struct i2c_algorithm fsi_i2c_algorithm = {
> @@ -697,7 +721,7 @@ static int fsi_i2c_remove(struct device *dev)
>   	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
>   	struct fsi_i2c_port *port, *tmp;
>
> -	list_for_each_entry_safe(port,tmp, &i2c->ports, list) {
> +	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
>   		list_del(&port->list);
>   		i2c_del_adapter(&port->adapter);
>   		kfree(port);
