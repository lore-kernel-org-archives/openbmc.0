Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn81h5mXkzDqZR
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 08:18:16 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2KLDw0Y089157
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 17:18:06 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29af6esbnn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 17:18:05 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 20 Mar 2017 17:18:05 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Mar 2017 17:18:04 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2KLI3en40697868; Mon, 20 Mar 2017 21:18:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B7B0AE051;
 Mon, 20 Mar 2017 17:17:56 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.0.205])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 8E2CAAE043;
 Mon, 20 Mar 2017 17:17:52 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.7] fsi: i2c: Remove noisy printks
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170317023411.13045-1-joel@jms.id.au>
Cc: "Edward A . James" <eajames@linux.vnet.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 20 Mar 2017 16:17:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170317023411.13045-1-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17032021-2213-0000-0000-0000016A6110
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006818; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00836515; UDB=6.00411139; IPR=6.00614285; 
 BA=6.00005224; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014731; XFM=3.00000013;
 UTC=2017-03-20 21:18:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032021-2214-0000-0000-000054D50A9C
Message-Id: <30268faa-5c95-4295-35ba-f5bc4ccff68a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-20_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703200180
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
X-List-Received-Date: Mon, 20 Mar 2017 21:18:17 -0000



On 3/16/17 9:34 PM, Joel Stanley wrote:
> These create a lot of noise in the kernel log. Hide them behind dev_dbg.
>
>    PROBE    eng[00f5112c]
>    Adding ports[0x0000000000007fff] to eng[0x00f5112c]
>    bus[0000000f] created
>    bus[00000010] created
>    bus[00000011] created
>    bus[00000012] created
>    bus[00000013] created
>    bus[00000014] created
>    bus[00000015] created
>    bus[00000016] created
>    bus[00000017] created
>    bus[00000018] created
>    bus[00000019] created
>    bus[0000001a] created
>    bus[0000001b] created
>    bus[0000001c] created
>    bus[0000001d] created
>    RESUME   eng[00f5112c]
>    iic_boe_reset
>    iic_boe_eng_init: P8/Z7PLUS mode
>    clean port busy port_busy[0001ffff]
>    iic_boe_eng_init: P8/Z7PLUS mode
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>
> Tested on Romulus
>
>   drivers/fsi/i2c/iic-boe.c  | 12 ++++++------
>   drivers/fsi/i2c/iic-fsi.c  | 12 ++++++------
>   drivers/fsi/i2c/iic-mstr.c |  6 ++----
>   3 files changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/fsi/i2c/iic-boe.c b/drivers/fsi/i2c/iic-boe.c
> index e7196c0115b1..5b90a856c4fd 100644
> --- a/drivers/fsi/i2c/iic-boe.c
> +++ b/drivers/fsi/i2c/iic-boe.c
> @@ -697,23 +697,23 @@ int iic_boe_eng_init(iic_eng_t* eng, iic_ffdc_t** ffdc)
>   	clk_div = IIC_BOE_HZ2DIV(eng->bus_speed, IIC_BOE_DFLT_SPEED);
>   	if(!clk_div)
>   	{
> -		IFLDi(2, "eng[%08x], max speed = %ld\n",
> +		dev_dbg(eng->dev, "eng[%08x], max speed = %ld\n",
>   				eng->id, eng->bus_speed / 5);
>   	}
>   	if(clk_div & ~IIC_BOE_MAX_CLKDIV)
>   		clk_div = IIC_BOE_MAX_CLKDIV;
> -	IFLDd(3, "eng[%08x] speed[%ld] divisor[%ld]\n", eng->id,
> +	dev_dbg(eng->dev, "eng[%08x] speed[%ld] divisor[%ld]\n", eng->id,
>   			IIC_BOE_DIV2HZ(eng->bus_speed, clk_div), clk_div);
>
>   	if(test_bit(IIC_ENG_Z7PLUS, &eng->flags) ||
>   	   test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags))
>   	{
> -		IFLDi(0, "iic_boe_eng_init: P8/Z7PLUS mode\n");
> +		dev_dbg(eng->dev, "iic_boe_eng_init: P8/Z7PLUS mode\n");
>   		mode = IIC_BOE_Z7_MK_CLKDIV(clk_div);
>   	}
>   	else
>   	{
> -		IFLDi(0, "iic_boe_eng_init: Normal mode\n");
> +		dev_dbg(eng->dev, "iic_boe_eng_init: Normal mode\n");
>   		mode = IIC_BOE_MK_CLKDIV(clk_div);
>   	}
>
> @@ -1362,7 +1362,7 @@ int iic_boe_reset(iic_eng_t* eng, int type, iic_ffdc_t** ffdc)
>
>   	IENTER();
>   	/* issue an immediate reset i2c command */
> -	IFLDi(0, "iic_boe_reset\n");
> +	dev_dbg(eng->dev, "iic_boe_reset\n");
>   	rc = iic_writew(eng, IIC_BOE_RESET_I2C, 0, ffdc);
>   	if(rc)
>   		goto exit;
> @@ -1413,7 +1413,7 @@ int iic_boe_reset(iic_eng_t* eng, int type, iic_ffdc_t** ffdc)
>   				ffdc);
>   		if (rc)
>   			goto exit;
> -		IFLDi(1, "clean port busy port_busy[%08lx]\n", port_busy);
> +		dev_dbg(eng->dev, "clean port busy port_busy[%08lx]\n", port_busy);
>   	}
>
>   	/* Test for stuck lines */
> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
> index 1f85e91232fd..5592a1441c54 100644
> --- a/drivers/fsi/i2c/iic-fsi.c
> +++ b/drivers/fsi/i2c/iic-fsi.c
> @@ -195,7 +195,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>
>   	IENTER();
>
> -	IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]\n",
> +	dev_dbg(eng->dev, "Adding ports[0x%08x%08x] to eng[0x%08x]\n",
>   	      (uint32_t)(ports >> 32),
>   	      (uint32_t)ports,
>   	      eng->id);
> @@ -271,7 +271,7 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
>
>   	IENTER();
>
> -	IFLDi(3, "removing ports[0x%08x%08x] from eng[0x%08x]",
> +	dev_dbg(eng->dev, "removing ports[0x%08x%08x] from eng[0x%08x]",
>   	      (uint32_t)(ports >> 32),
>   	      (uint32_t)ports,
>   	      eng->id);
> @@ -333,7 +333,7 @@ int iic_fsi_probe(struct device *dev)
>   	set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
>   	eng->id = 0x00F5112C;
>   	eng->idx = ida_simple_get(&iic_ida, 1, INT_MAX, GFP_KERNEL);
> -	IFLDi(1, "PROBE    eng[%08x]\n", eng->id);
> +	dev_dbg(dev, "PROBE    eng[%08x]\n", eng->id);
>   	eng->ra = &fsi_reg_access;
>   	IFLDd(1, "vaddr=%#08lx\n", eng->base);
>   	eng->dev = dev;
> @@ -414,7 +414,7 @@ int iic_fsi_remove(struct device* dev)
>
>   	iic_fsi_suspend(dev); //ignore rc
>
> -	IFLDi(1, "REMOVE   eng[%08x]\n", eng->id);
> +	dev_dbg(dev, "REMOVE   eng[%08x]\n", eng->id);
>
>   	/* Clean up device files immediately, don't wait for ref count */
>   	iic_del_ports(eng, IIC_FSI_PORTS);
> @@ -451,7 +451,7 @@ int iic_fsi_suspend(struct device *dev)
>   		goto error;
>   	}
>
> -	IFLDi(2, "SUSPEND  eng[%08x]\n", eng->id);
> +	dev_dbg(dev,"SUSPEND  eng[%08x]\n", eng->id);
>
>   	/* Prohibit new engine operations until resumed*/
>   	set_bit(IIC_ENG_BLOCK, &eng->flags);
> @@ -504,7 +504,7 @@ int iic_fsi_resume(struct device *dev)
>   		goto error;
>   	}
>
> -	IFLDi(1, "RESUME   eng[%08x]\n", eng->id);
> +	dev_dbg(eng->dev, "RESUME   eng[%08x]\n", eng->id);
>
>   	eng->bus_speed = 20833333;
>   	IFLDd(1, "eng->bus_speed=%ld\n", eng->bus_speed);
> diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
> index f968c2040dc3..a5881fb795f4 100644
> --- a/drivers/fsi/i2c/iic-mstr.c
> +++ b/drivers/fsi/i2c/iic-mstr.c
> @@ -2157,7 +2157,7 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>   		goto exit_class_add;
>   	}
>
> -	IFLDi(1, "bus[%08lx] created\n", bus->bus_id);
> +	dev_dbg(bus->class_dev, "bus[%08lx] created\n", bus->bus_id);
>   	goto exit;
>
>   	device_destroy(classp, bus->devnum);
> @@ -2180,7 +2180,7 @@ void iic_delete_bus(struct class* classp, iic_bus_t* bus)
>   	{
>   		goto exit;
>   	}
> -	IFLDi(1, "cleanup bus[%08lx]\n", bus->bus_id);
> +	dev_dbg(bus->class_dev, "cleanup bus[%08lx]\n", bus->bus_id);
>   	device_destroy(classp, bus->devnum);
>   	cdev_del(&bus->cdev);
>   	kfree(bus);
> @@ -2195,7 +2195,6 @@ static int __init iic_init(void)
>   	int rc = 0;
>
>   	IENTER();
> -	printk("IIC: base support loaded  ver. %s\n", iic_mstr_version);
>   	IEXIT(rc);
>   	return rc;
>   }
> @@ -2203,7 +2202,6 @@ static int __init iic_init(void)
>   static void __exit iic_exit(void)
>   {
>   	IENTER();
> -	printk("IIC: base support unloaded.\n");
>   	IEXIT(0);
>   }
Hi Joel,

Looks good - thanks

Acked-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
