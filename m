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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gVZ95dhdzF1xk
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 05:54:40 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w48JrxAW043707
 for <openbmc@lists.ozlabs.org>; Tue, 8 May 2018 15:54:38 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hugwqc7tf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 15:54:38 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 8 May 2018 13:54:36 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 May 2018 13:54:35 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w48JsYbk22544692; Tue, 8 May 2018 12:54:34 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B016278037;
 Tue,  8 May 2018 13:54:34 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.80.194.186])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 3D95C78038;
 Tue,  8 May 2018 13:54:34 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 4/6] fsi/fsi-master-gpio: Add
 "no-gpio-delays" option
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-4-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 8 May 2018 14:54:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180508010640.14113-4-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18050819-0008-0000-0000-000009BCFDB6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008994; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029432; UDB=6.00526020; IPR=6.00808566; 
 MB=3.00020999; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 19:54:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050819-0009-0000-0000-0000472AF091
Message-Id: <c3c12f08-afc1-7937-68a1-dabd559382ad@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080187
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
X-List-Received-Date: Tue, 08 May 2018 19:54:42 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> This adds support for an optional device-tree property that
> makes the driver skip all the delays around clocking the
> GPIOs and set it in the device-tree of common POWER9 based
> OpenPower platforms.
>
> This useful on chips like the AST2500 where the GPIO block is
> running at a fairly low clock frequency (25Mhz typically). In
> this case, the delays are unnecessary and due to the low
> precision of the timers, actually quite harmful in terms of
> performance.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  1 +
>   .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  1 +
>   arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  1 +
>   drivers/fsi/fsi-master-gpio.c                 | 20 +++++++++++++++----
>   4 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index d746e562e8fd..0fdf08077ed3 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -59,6 +59,7 @@
>   		compatible = "fsi-master-gpio", "fsi-master";
>   		#address-cells = <2>;
>   		#size-cells = <0>;
> +		no-gpio-delays;
>
>   		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>   		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 596608f4b936..214718b7784d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -160,6 +160,7 @@
>   		compatible = "fsi-master-gpio", "fsi-master";
>   		#address-cells = <2>;
>   		#size-cells = <0>;
> +		no-gpio-delays;
>
>   		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>   		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 7f5a29566801..085926935574 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -91,6 +91,7 @@
>   		compatible = "fsi-master-gpio", "fsi-master";
>   		#address-cells = <2>;
>   		#size-cells = <0>;
> +		no-gpio-delays;
>
>   		trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
>   		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index d6508bbad1fb..c82bbd35276e 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -62,6 +62,7 @@ struct fsi_master_gpio {
>   	struct gpio_desc	*gpio_enable;	/* FSI enable */
>   	struct gpio_desc	*gpio_mux;	/* Mux control */
>   	bool			external_mode;
> +	bool			no_delays;
>   };
>
>   #define CREATE_TRACE_POINTS
> @@ -79,9 +80,11 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
>   	int i;
>
>   	for (i = 0; i < count; i++) {
> -		ndelay(FSI_GPIO_STD_DLY);
> +		if (!master->no_delays)
> +			ndelay(FSI_GPIO_STD_DLY);
>   		gpiod_set_value(master->gpio_clk, 0);
> -		ndelay(FSI_GPIO_STD_DLY);
> +		if (!master->no_delays)
> +			ndelay(FSI_GPIO_STD_DLY);
>   		gpiod_set_value(master->gpio_clk, 1);
>   	}
>   }
> @@ -90,10 +93,12 @@ static int sda_clock_in(struct fsi_master_gpio *master)
>   {
>   	int in;
>
> -	ndelay(FSI_GPIO_STD_DLY);
> +	if (!master->no_delays)
> +		ndelay(FSI_GPIO_STD_DLY);
>   	gpiod_set_value(master->gpio_clk, 0);
>   	in = gpiod_get_value(master->gpio_data);
> -	ndelay(FSI_GPIO_STD_DLY);
> +	if (!master->no_delays)
> +		ndelay(FSI_GPIO_STD_DLY);
>   	gpiod_set_value(master->gpio_clk, 1);
>   	return in ? 1 : 0;
>   }
> @@ -677,6 +682,13 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>   	}
>   	master->gpio_mux = gpio;
>
> +	/*
> +	 * Check if GPIO block is slow enought that no extra delays
> +	 * are necessary. This improves performance on ast2500 by
> +	 * an order of magnitude.
> +	 */
> +	master->no_delays = device_property_present(&pdev->dev, "no-gpio-delays");
> +
>   	master->master.n_links = 1;
>   	master->master.flags = FSI_MASTER_FLAG_SWCLOCK;
>   	master->master.read = fsi_master_gpio_read;
