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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rwsy59c4zDqnw
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 05:11:17 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7GJ9GSl080147
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 15:11:15 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kwd9ump9k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 15:11:12 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 16 Aug 2018 13:11:11 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Aug 2018 13:11:09 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7GJB8DV4260168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 16 Aug 2018 12:11:09 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF3D5136051;
 Thu, 16 Aug 2018 13:11:08 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45B50136059;
 Thu, 16 Aug 2018 13:11:07 -0600 (MDT)
Received: from oc6728276242.ibm.com (unknown [9.80.207.203])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Aug 2018 13:11:06 -0600 (MDT)
Subject: Re: [RFC 1/3] clock: aspeed: Setup video engine clocking
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1533676303-305-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1533676303-305-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1534121134.259933.1471868896.39D45EC1@webmail.messagingengine.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 16 Aug 2018 14:11:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534121134.259933.1471868896.39D45EC1@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18081619-0004-0000-0000-00001477BCB8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009556; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01074469; UDB=6.00553713; IPR=6.00854426; 
 MB=3.00022761; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-16 19:11:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081619-0005-0000-0000-0000887B634F
Message-Id: <9841c931-bfcb-ca51-37eb-18133fb237d9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808160196
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
X-List-Received-Date: Thu, 16 Aug 2018 19:11:19 -0000



On 08/12/2018 07:45 PM, Andrew Jeffery wrote:
> On Wed, 8 Aug 2018, at 06:41, Eddie James wrote:
>> Add the video engine reset bit and add the eclk clock divider table. The
>> eclk can be muxed, but for the sake of simplicity, force the eclk source
>> to be the mpll clock.
>>
>> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
>> ---
>>   drivers/clk/clk-aspeed.c                 | 61 +++++++++++++++++++++++++++++++-
>>   include/dt-bindings/clock/aspeed-clock.h |  1 +
>>   2 files changed, 61 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 8796b8a..c1a64ae 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -20,6 +20,7 @@
>>   
>>   #define ASPEED_RESET_CTRL	0x04
>>   #define ASPEED_CLK_SELECTION	0x08
>> +#define  ASPEED_CLK_SEL_VE	GENMASK(3, 2)
>>   #define ASPEED_CLK_STOP_CTRL	0x0c
>>   #define ASPEED_MPLL_PARAM	0x20
>>   #define ASPEED_HPLL_PARAM	0x24
>> @@ -87,7 +88,7 @@ struct aspeed_clk_gate {
>>   /* TODO: ask Aspeed about the actual parent data */
>>   static const struct aspeed_gate_data aspeed_gates[] = {
>>   	/*				 clk rst   name			parent	flags */
>> -	[ASPEED_CLK_GATE_ECLK] =	{  0, -1, "eclk-gate",		"eclk",	0 }, /* Video
>> Engine */
>> +	[ASPEED_CLK_GATE_ECLK] =	{  0,  6, "eclk-gate",		"eclk",	0 }, /* Video
>> Engine */
>>   	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
>>   	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	
>> CLK_IS_CRITICAL }, /* SDRAM */
>>   	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video
>> Capture */
>> @@ -113,6 +114,18 @@ struct aspeed_clk_gate {
>>   	[ASPEED_CLK_GATE_LHCCLK] =	{ 28, -1, "lhclk-gate",		"lhclk", 0 }, /* LPC
>> master/LPC+ */
>>   };
>>   
>> +static const struct clk_div_table ast2500_eclk_div_table[] = {
>> +	{ 0x0, 2 },
>> +	{ 0x1, 2 },
>> +	{ 0x2, 3 },
>> +	{ 0x3, 4 },
>> +	{ 0x4, 5 },
>> +	{ 0x5, 6 },
>> +	{ 0x6, 7 },
>> +	{ 0x7, 8 },
>> +	{ 0 }
>> +};
>> +
>>   static const struct clk_div_table ast2500_mac_div_table[] = {
>>   	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>>   	{ 0x1, 4 },
>> @@ -192,18 +205,21 @@ static struct clk_hw
>> *aspeed_ast2500_calc_pll(const char *name, u32 val)
>>   
>>   struct aspeed_clk_soc_data {
>>   	const struct clk_div_table *div_table;
>> +	const struct clk_div_table *eclk_div_table;
>>   	const struct clk_div_table *mac_div_table;
>>   	struct clk_hw *(*calc_pll)(const char *name, u32 val);
>>   };
>>   
>>   static const struct aspeed_clk_soc_data ast2500_data = {
>>   	.div_table = ast2500_div_table,
>> +	.eclk_div_table = ast2500_eclk_div_table,
>>   	.mac_div_table = ast2500_mac_div_table,
>>   	.calc_pll = aspeed_ast2500_calc_pll,
>>   };
>>   
>>   static const struct aspeed_clk_soc_data ast2400_data = {
>>   	.div_table = ast2400_div_table,
>> +	.eclk_div_table = ast2400_div_table,
>>   	.mac_div_table = ast2400_div_table,
>>   	.calc_pll = aspeed_ast2400_calc_pll,
>>   };
>> @@ -317,6 +333,7 @@ struct aspeed_reset {
>>   	[ASPEED_RESET_PECI]	= 10,
>>   	[ASPEED_RESET_I2C]	=  2,
>>   	[ASPEED_RESET_AHB]	=  1,
>> +	[ASPEED_RESET_VIDEO]	=  6,
>>   
>>   	/*
>>   	 * SCUD4 resets start at an offset to separate them from
>> @@ -522,6 +539,48 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>   		return PTR_ERR(hw);
>>   	aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
>>   
>> +	/* Video Engine (ECLK) clock divider (ignore mux; set parent MPLL) */
>> +	regmap_read(map, ASPEED_CLK_SELECTION, &val);
>> +	if (val & ASPEED_CLK_SEL_VE) {
>> +		/* ECLK clock select isn't MPLL; reset to MPLL */
>> +		u32 clk = BIT(aspeed_gates[ASPEED_CLK_GATE_ECLK].clock_idx);
>> +		u32 rst = BIT(aspeed_gates[ASPEED_CLK_GATE_ECLK].reset_idx);
>> +		u32 stop;
>> +
>> +		dev_info(dev, "setting eclk mux to mpll\n");
>> +
>> +		/* Put Video Engine in reset */
>> +		regmap_update_bits(map, ASPEED_RESET_CTRL, rst, rst);
>> +		udelay(100);
>> +
>> +		/* Stop the clock if it's running */
>> +		regmap_read(map, ASPEED_CLK_STOP_CTRL, &stop);
>> +		if (!(stop & clk))
>> +			regmap_update_bits(map, ASPEED_CLK_STOP_CTRL, clk,
>> +					   clk);
>> +
>> +		/* Set clock select to MPLL */
>> +		regmap_update_bits(map, ASPEED_CLK_SELECTION,
>> +				   ASPEED_VE_CLK_SEL, 0);
>> +
>> +		/* Start the clock if it was originally running */
>> +		if (!(stop & clk)) {
>> +			regmap_update_bits(map, ASPEED_CLK_STOP_CTRL, clk, 0);
>> +			mdelay(10);
>> +		}
>> +
>> +		/* Take Video Engine out of reset */
>> +		regmap_update_bits(map, ASPEED_RESET_CTRL, rst, 0);
>> +	}
> This seems like a bit of hack? Shouldn't we describe the clock tree
> including the mux and let it sort itself out?

Yes. I literally couldn't figure out how to do that... any help would be 
great :D

Thanks,
Eddie

>
>> +
>> +	hw = clk_hw_register_divider_table(dev, "eclk", "mpll", 0,
>> +			scu_base + ASPEED_CLK_SELECTION, 28, 3, 0,
>> +			soc_data->eclk_div_table,
>> +			&aspeed_clk_lock);
>> +	if (IS_ERR(hw))
>> +		return PTR_ERR(hw);
>> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
>> +
>>   	/*
>>   	 * TODO: There are a number of clocks that not included in this driver
>>   	 * as more information is required:
>> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-
>> bindings/clock/aspeed-clock.h
>> index 4476184..f1813db 100644
>> --- a/include/dt-bindings/clock/aspeed-clock.h
>> +++ b/include/dt-bindings/clock/aspeed-clock.h
>> @@ -50,5 +50,6 @@
>>   #define ASPEED_RESET_I2C		7
>>   #define ASPEED_RESET_AHB		8
>>   #define ASPEED_RESET_CRT1		9
>> +#define ASPEED_RESET_VIDEO		10
>>   
>>   #endif
>> -- 
>> 1.8.3.1
>>
