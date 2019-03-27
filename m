Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Trpr0hZ9zDqLC
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 02:03:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2RF206F069496
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 11:03:10 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rgbf8g38d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 11:03:06 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 27 Mar 2019 15:02:40 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Mar 2019 15:02:38 -0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2RF2b9512189834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Mar 2019 15:02:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86CDF13606E;
 Wed, 27 Mar 2019 15:02:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB960136065;
 Wed, 27 Mar 2019 15:02:36 +0000 (GMT)
Received: from [9.85.177.180] (unknown [9.85.177.180])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Mar 2019 15:02:36 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 3/7] clk: aspeed: Setup video engine clocking
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-4-git-send-email-eajames@linux.ibm.com>
 <CACPK8XefZZiT5=XxMsTiwtfgea67TwaPiKoLithbQhAw_bNweQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 27 Mar 2019 10:02:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XefZZiT5=XxMsTiwtfgea67TwaPiKoLithbQhAw_bNweQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19032715-0020-0000-0000-00000ECEE03E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010823; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000282; SDB=6.01180447; UDB=6.00617762; IPR=6.00961164; 
 MB=3.00026180; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-27 15:02:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032715-0021-0000-0000-00006539ABE3
Message-Id: <c77b79e4-6e8a-3947-3537-ac6a44f866d8@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-27_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903270106
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2019 15:03:16 -0000


On 3/27/19 1:09 AM, Joel Stanley wrote:
> On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
>> Add the video engine reset bit. Add eclk mux and clock divider table.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Acked-by: Stephen Boyd <sboyd@kernel.org>
>> ---
>>   drivers/clk/clk-aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 5961367..f16ce7d 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -87,7 +87,7 @@ struct aspeed_clk_gate {
>>   /* TODO: ask Aspeed about the actual parent data */
>>   static const struct aspeed_gate_data aspeed_gates[] = {
>>          /*                               clk rst   name                 parent  flags */
>> -       [ASPEED_CLK_GATE_ECLK] =        {  0, -1, "eclk-gate",          "eclk", 0 }, /* Video Engine */
>> +       [ASPEED_CLK_GATE_ECLK] =        {  0,  6, "eclk-gate",          "eclk", 0 }, /* Video Engine */
> As I've said on previous reviews, it's incorrect to add the reset line
> to the clock, and have it be a separate reset device.
>
> When you add the reset bit to the clk device, we control both the
> clock gating (bit 0, SCU0C) and the reset line (bit 6, SCU04) with the
> clk device. You can see this happen in aspeed_clk_enable if
> gate->reset_idx >= 0.
>
> Assuming you are doing this on purpose, can you explain why you want
> to have the reset device and the clk device both control the one bit?

Yes. The reset line must be added to the clock device because it's an 
important part of the clock enable/disable operation, as required in the 
AST2500 spec.

The video driver has been written around the idea that the reset device 
is available by itself as well. I ran into a number of issues trying to 
remove that dependency. Firstly its much slower to toggle the clocks 
than to simply toggle the reset, and there are cases where we need to 
quickly reset the engine and reacquire the video signal. But mainly I 
saw issues with interrupts being unstoppable, since the clock driver 
doesn't enable the reset before the clocks turn off, and then the video 
engine registers can no longer be changed once the clocks are off.

I don't really understand what's so incorrect about having both things 
control the reset. Maybe we can chat tonight to resolve this.

Thanks,

Eddie

>
> Cheers,
>
> Joel
>
>
>>          [ASPEED_CLK_GATE_GCLK] =        {  1,  7, "gclk-gate",          NULL,   0 }, /* 2D engine */
>>          [ASPEED_CLK_GATE_MCLK] =        {  2, -1, "mclk-gate",          "mpll", CLK_IS_CRITICAL }, /* SDRAM */
>>          [ASPEED_CLK_GATE_VCLK] =        {  3,  6, "vclk-gate",          NULL,   0 }, /* Video Capture */
>> @@ -113,6 +113,24 @@ struct aspeed_clk_gate {
>>          [ASPEED_CLK_GATE_LHCCLK] =      { 28, -1, "lhclk-gate",         "lhclk", 0 }, /* LPC master/LPC+ */
>>   };
>>
>> +static const char * const eclk_parent_names[] = {
>> +       "mpll",
>> +       "hpll",
>> +       "dpll",
>> +};
>> +
>> +static const struct clk_div_table ast2500_eclk_div_table[] = {
>> +       { 0x0, 2 },
>> +       { 0x1, 2 },
>> +       { 0x2, 3 },
>> +       { 0x3, 4 },
>> +       { 0x4, 5 },
>> +       { 0x5, 6 },
>> +       { 0x6, 7 },
>> +       { 0x7, 8 },
>> +       { 0 }
>> +};
>> +
>>   static const struct clk_div_table ast2500_mac_div_table[] = {
>>          { 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>>          { 0x1, 4 },
>> @@ -192,18 +210,21 @@ static struct clk_hw *aspeed_ast2500_calc_pll(const char *name, u32 val)
>>
>>   struct aspeed_clk_soc_data {
>>          const struct clk_div_table *div_table;
>> +       const struct clk_div_table *eclk_div_table;
>>          const struct clk_div_table *mac_div_table;
>>          struct clk_hw *(*calc_pll)(const char *name, u32 val);
>>   };
>>
>>   static const struct aspeed_clk_soc_data ast2500_data = {
>>          .div_table = ast2500_div_table,
>> +       .eclk_div_table = ast2500_eclk_div_table,
>>          .mac_div_table = ast2500_mac_div_table,
>>          .calc_pll = aspeed_ast2500_calc_pll,
>>   };
>>
>>   static const struct aspeed_clk_soc_data ast2400_data = {
>>          .div_table = ast2400_div_table,
>> +       .eclk_div_table = ast2400_div_table,
>>          .mac_div_table = ast2400_div_table,
>>          .calc_pll = aspeed_ast2400_calc_pll,
>>   };
>> @@ -317,6 +338,7 @@ struct aspeed_reset {
>>          [ASPEED_RESET_PECI]     = 10,
>>          [ASPEED_RESET_I2C]      =  2,
>>          [ASPEED_RESET_AHB]      =  1,
>> +       [ASPEED_RESET_VIDEO]    =  6,
>>
>>          /*
>>           * SCUD4 resets start at an offset to separate them from
>> @@ -522,6 +544,22 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>                  return PTR_ERR(hw);
>>          aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
>>
>> +       hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
>> +                                ARRAY_SIZE(eclk_parent_names), 0,
>> +                                scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
>> +                                &aspeed_clk_lock);
>> +       if (IS_ERR(hw))
>> +               return PTR_ERR(hw);
>> +       aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
>> +
>> +       hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
>> +                                          scu_base + ASPEED_CLK_SELECTION, 28,
>> +                                          3, 0, soc_data->eclk_div_table,
>> +                                          &aspeed_clk_lock);
>> +       if (IS_ERR(hw))
>> +               return PTR_ERR(hw);
>> +       aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
>> +
>>          /*
>>           * TODO: There are a number of clocks that not included in this driver
>>           * as more information is required:
>> @@ -531,7 +569,6 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>           *   RGMII
>>           *   RMII
>>           *   UART[1..5] clock source mux
>> -        *   Video Engine (ECLK) mux and clock divider
>>           */
>>
>>          for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>> --
>> 1.8.3.1
>>
