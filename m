Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w24f04ZhxzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 08:31:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3AMT9Ju018737
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 18:30:52 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29rh45bt0b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 18:30:52 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 18:30:51 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 18:30:50 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3AMUnNo60096714; Mon, 10 Apr 2017 22:30:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8932112060;
 Mon, 10 Apr 2017 18:30:49 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 4B7CB112051;
 Mon, 10 Apr 2017 18:30:49 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.7 v2 4/4] drivers/fsi: Set IRQ masks along hub
 path
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
 <20170410212651.65499-5-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 10 Apr 2017 17:30:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170410212651.65499-5-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17041022-0040-0000-0000-0000030F865B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006913; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845744; UDB=6.00417090; IPR=6.00624178; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014999; XFM=3.00000013;
 UTC=2017-04-10 22:30:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041022-0041-0000-0000-000007038E12
Message-Id: <c361c412-e63c-9941-c795-3731c0f9a2d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100178
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
X-List-Received-Date: Mon, 10 Apr 2017 22:31:05 -0000



On 04/10/2017 04:26 PM, Christopher Bostic wrote:
> Enable/disable client engine IRQ masks including those along
> the hub path to a particular engine. This includes slave
> MMODE i-poll, Si1M, SRSIM, and hub master MSIEP.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2 - fsi_disable_irq remove double inversion of bit mask.
> ---
>   drivers/fsi/fsi-core.c   | 138 +++++++++++++++++++++++++++++++++++++++++++++--
>   drivers/fsi/fsi-master.h |   4 ++
>   2 files changed, 137 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 72f3a35..9f55d69 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -1086,17 +1086,140 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
>   }
>   EXPORT_SYMBOL_GPL(fsi_driver_unregister);
>
> +static uint32_t link_to_srsim_mask(int link)
> +{
> +	return ((0x80000000 >> 6) >> FSI_SRSIX_BITS_PER_LINK*link);
> +}
> +
> +static uint32_t link_to_msiep_mask(int link)
> +{
> +	return (0xf0000000 >> (FSI_MSIEP_BITS_PER_LINK*link));
> +}
> +
> +static int set_si1m(struct fsi_slave *slave, uint32_t mask, int on)
> +{
> +	int rc;
> +	uint32_t si1m;
> +
> +	rc = fsi_slave_read(slave, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +			sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&slave->dev, "Failed to read SI1M\n");
> +		return rc;
> +	}
> +
> +	if (on)
> +		si1m |= mask;
> +	else
> +		si1m &= ~mask;
> +
> +	return fsi_slave_write(slave, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +			sizeof(si1m));
> +}
> +
> +static int set_upstream_irq_masks(struct fsi_master *master,
> +				struct fsi_slave *slave, int on)
> +{
> +	struct fsi_slave *upstream_slave;
> +	struct fsi_master *upstream_master;
> +	uint32_t mask, si1m;
> +	int rc;
> +
> +	if (!master->idx)
> +		return 0;
> +
> +	upstream_slave = to_fsi_slave(slave->master->dev->parent);
> +	if (!upstream_slave) {
> +		dev_dbg(&slave->dev, "No upstream slave found\n");
> +		return -ENODEV;
> +	}
> +
> +	rc = fsi_slave_read(upstream_slave, FSI_SLAVE_BASE + FSI_SRSIM0, &si1m,
> +			sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&slave->dev, "Failed to read SRSIM0\n");
> +		return rc;
> +	}
> +
> +	mask = link_to_srsim_mask(slave->link);
> +	if (on)
> +		si1m |= mask;
> +	else
> +		si1m &= ~mask;
> +	rc = fsi_slave_write(upstream_slave, FSI_SLAVE_BASE + FSI_SRSIM0, &si1m,
> +			sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&slave->dev, "Failed to write SRSIM0\n");
> +		return rc;
> +	}
> +
> +	upstream_master = upstream_slave->master;
> +	if (!upstream_master) {
> +		dev_dbg(&upstream_slave->dev, "Cannot find master\n");
> +		return -ENODEV;
> +	}
> +
> +	rc = upstream_master->read(upstream_master, 0, 0,
> +				FSI_HUB_CONTROL + FSI_MSIEP0, &si1m,
> +				sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&upstream_slave->dev,
> +			"Could not read master's MSIEP\n");
> +		return rc;
> +	}
> +
> +	/* TODO: merge this into above on/off check */
> +	mask = link_to_msiep_mask(slave->link);
> +	if (on) {
> +		upstream_master->ipoll |= FSI_SI1_HUB_SRC;
> +		si1m |= mask;
> +	} else {
> +		upstream_master->ipoll &= ~FSI_SI1_HUB_SRC;
> +		si1m &= ~mask;
> +	}
> +
> +	rc = upstream_master->write(upstream_master, 0, 0,
> +				FSI_HUB_CONTROL + FSI_MSIEP0, &si1m,
> +				sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&upstream_slave->dev,
> +			"Failed to write to master's MSIEP\n");
> +		return rc;
> +	}
> +	si1m = 0xd0040410;
> +	rc = upstream_master->write(upstream_master, 0, 0,
> +				FSI_HUB_CONTROL + FSI_MMODE, &si1m,
> +				sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&upstream_slave->dev,
> +			"Failed to set hub I POLL\n");
> +	}
> +
> +	si1m = FSI_SI1_HUB_SRC;
> +	rc = upstream_master->write(upstream_master, 0, 0,
> +				FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +				sizeof(si1m));
> +	if (rc) {
> +		dev_dbg(&upstream_slave->dev,
> +			"Failed to set hub mask in SI1M\n");
> +	}
> +
> +	return set_si1m(upstream_slave, FSI_SI1_HUB_SRC, on);
> +}
> +
>   int fsi_enable_irq(struct fsi_device *dev)
>   {
>   	int rc;
>   	u32 si1m;
>   	u32 bit = 0x80000000 >> dev->si1s_bit;
>   	struct fsi_master *master = dev->slave->master;
> +	struct fsi_slave *slave = dev->slave;
> +	int link = slave->link;
>
>   	if (!dev->irq_handler)
>   		return -EINVAL;
>
> -	rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +	rc = master->read(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
>   			sizeof(u32));
>   	if (rc) {
>   		dev_err(master->dev, "couldn't read si1m:%d\n", rc);
> @@ -1104,7 +1227,7 @@ int fsi_enable_irq(struct fsi_device *dev)
>   	}
>
>   	si1m |= bit;
> -	rc = master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +	rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
>   			sizeof(u32));
>   	if (rc) {
>   		dev_err(master->dev, "couldn't write si1m:%d\n", rc);
> @@ -1112,7 +1235,7 @@ int fsi_enable_irq(struct fsi_device *dev)
>   	}
>
>   	master->ipoll |= bit;
> -	return 0;
> +	return set_upstream_irq_masks(master, slave, 1);
>   }
>   EXPORT_SYMBOL_GPL(fsi_enable_irq);
>
> @@ -1122,10 +1245,12 @@ void fsi_disable_irq(struct fsi_device *dev)
>   	u32 si1m;
>   	u32 bits = ~(0x80000000 >> dev->si1s_bit);
>   	struct fsi_master *master = dev->slave->master;
> +	struct fsi_slave *slave = dev->slave;
> +	int link = dev->slave->link;
>
>   	master->ipoll &= bits;
>
> -	rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +	rc = master->read(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
>   			sizeof(u32));
>   	if (rc) {
>   		dev_err(master->dev, "couldn't read si1m:%d\n", rc);
> @@ -1133,12 +1258,15 @@ void fsi_disable_irq(struct fsi_device *dev)
>   	}
>
>   	si1m &= bits;
> -	rc = master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
> +	rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
>   			sizeof(u32));
>   	if (rc) {
>   		dev_err(master->dev, "couldn't write si1m:%d\n", rc);
>   		return;
>   	}
> +
> +	if (!master->ipoll)
> +		set_upstream_irq_masks(master, slave, 0);
>   }
>
>   struct bus_type fsi_bus_type = {
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 54723a7..7c9c3fa 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -27,6 +27,7 @@
>   #define FSI_MLEVP0		0x18		/* R: plug detect */
>   #define FSI_MSENP0		0x18		/* S: Set enable */
>   #define FSI_MCENP0		0x20		/* C: Clear enable */
> +#define FSI_MSIEP0		0x30		/* R/W: Slave IRQ enable */
>   #define FSI_MAEB		0x70		/* R: Error address */
>   #define FSI_MVER		0x74		/* R: master version/type */
>   #define FSI_MRESP0		0xd0		/* W: Port reset */
> @@ -47,6 +48,9 @@
>   #define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
>   #define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
>
> +/* MSIEP: Slave interrupt enable */
> +#define FSI_MSIEP_BITS_PER_LINK	4
> +
>   /* MRESB: Reset brindge */
>   #define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
>   #define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */

Thanks for making that fix.

All looks good.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
