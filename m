Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gPlY3x08zF14v
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 02:17:29 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w48GHNT6141942
 for <openbmc@lists.ozlabs.org>; Tue, 8 May 2018 12:17:26 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2huf2dgq2e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 12:17:26 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 8 May 2018 12:17:21 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 May 2018 12:17:18 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w48GHInF46072016; Tue, 8 May 2018 16:17:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABD17112062;
 Tue,  8 May 2018 12:17:11 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.178.108])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 76D8411205E;
 Tue,  8 May 2018 12:17:11 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 2/6] gpio/aspeed: Use a cache of output
 data registers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-2-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 8 May 2018 11:17:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180508010640.14113-2-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18050816-0048-0000-0000-0000026A0BF3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008993; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029360; UDB=6.00525977; IPR=6.00808494; 
 MB=3.00020996; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 16:17:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050816-0049-0000-0000-0000450C6FD4
Message-Id: <12eed627-c789-c118-4b28-88f70eea3777@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080156
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2018 16:17:30 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> The current driver does a read/modify/write of the output
> registers when changing a bit in __aspeed_gpio_set().
>
> This is sub-optimal for a couple of reasons:
>
>    - If any of the neighbouring GPIOs (sharing the shared
> register) isn't (yet) configured as an output, it will
> read the current input value, and then apply it to the
> output latch, which may not be what the user expects. There
> should be no bug in practice as aspeed_gpio_dir_out() will
> establish a new value but it's not great either.
>
>    - The GPIO block in the aspeed chip is clocked rather
> slowly (typically 25Mhz). That extra MMIO read halves the maximum
> speed at which we can toggle the GPIO.
>
> This provides a significant performance improvement to the GPIO
> based FSI master.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/gpio/gpio-aspeed.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index ac54b9b25f74..a62cbf3ed4a8 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -54,6 +54,8 @@ struct aspeed_gpio {
>   	u8 *offset_timer;
>   	unsigned int timer_users[4];
>   	struct clk *clk;
> +
> +	u32 *dcache;
>   };
>
>   struct aspeed_gpio_bank {
> @@ -231,12 +233,13 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
>   	u32 reg;
>
>   	addr = bank_val_reg(gpio, bank, GPIO_DATA);
> -	reg = ioread32(addr);
> +	reg = gpio->dcache[GPIO_BANK(offset)];
>
>   	if (val)
>   		reg |= GPIO_BIT(offset);
>   	else
>   		reg &= ~GPIO_BIT(offset);
> +	gpio->dcache[GPIO_BANK(offset)] = reg;
>
>   	iowrite32(reg, addr);
>   }
> @@ -848,7 +851,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>   	const struct of_device_id *gpio_id;
>   	struct aspeed_gpio *gpio;
>   	struct resource *res;
> -	int rc;
> +	int rc, i, banks;
>
>   	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>   	if (!gpio)
> @@ -889,6 +892,20 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>   	gpio->chip.base = -1;
>   	gpio->chip.irq_need_valid_mask = true;
>
> +	/* Allocate a cache of the output registers */
> +	banks = gpio->config->nr_gpios >> 5;
> +	gpio->dcache = devm_kzalloc(&pdev->dev,
> +				    sizeof(u32) * banks, GFP_KERNEL);
> +	if (!gpio->dcache)
> +		return -ENOMEM;
> +
> +	/* Populate it with initial values read from the HW */
> +	for (i = 0; i < banks; i++) {
> +		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
> +		gpio->dcache[i] = ioread32(gpio->base + bank->val_regs +
> +					   GPIO_DATA);
> +	}
> +
>   	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
>   	if (rc < 0)
>   		return rc;
