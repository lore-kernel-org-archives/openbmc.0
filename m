Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YCBw4MkczDqL2
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 13:02:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x321x2ZZ124936
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 22:02:14 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rktuas9p4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 22:02:13 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 2 Apr 2019 03:02:13 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 03:02:10 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x32229WL51708096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 02:02:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 390637805E;
 Tue,  2 Apr 2019 02:02:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACB847805C;
 Tue,  2 Apr 2019 02:02:08 +0000 (GMT)
Received: from [9.85.199.153] (unknown [9.85.199.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Apr 2019 02:02:08 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v3 4/7] clk: Aspeed: Setup video engine clocking
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, openbmc@lists.ozlabs.org
References: <1554150230-24335-1-git-send-email-eajames@linux.ibm.com>
 <1554150230-24335-5-git-send-email-eajames@linux.ibm.com>
 <8d21b65e-f70d-c44e-6153-fb966137cff1@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 1 Apr 2019 21:02:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <8d21b65e-f70d-c44e-6153-fb966137cff1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040202-8235-0000-0000-00000E783594
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010858; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01183041; UDB=6.00619329; IPR=6.00963783; 
 MB=3.00026250; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-02 02:02:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040202-8236-0000-0000-000044FE4FDC
Message-Id: <7a680695-821f-4602-73bc-0b5fc6b5f4a9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020013
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
X-List-Received-Date: Tue, 02 Apr 2019 02:02:17 -0000


On 4/1/19 3:48 PM, Jae Hyun Yoo wrote:
> On 4/1/2019 1:23 PM, Eddie James wrote:
>> Add eclk mux and clock divider table.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/clk/clk-aspeed.c | 40 ++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 5961367..133e80c 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -87,7 +87,7 @@ struct aspeed_clk_gate {
>>   /* TODO: ask Aspeed about the actual parent data */
>>   static const struct aspeed_gate_data aspeed_gates[] = {
>>       /*                 clk rst   name            parent flags */
>> -    [ASPEED_CLK_GATE_ECLK] =    {  0, -1, "eclk-gate", "eclk",    0 
>> }, /* Video Engine */
>> +    [ASPEED_CLK_GATE_ECLK] =    {  0,  6, "eclk-gate", "eclk",    0 
>> }, /* Video Engine */
>>       [ASPEED_CLK_GATE_GCLK] =    {  1,  7, "gclk-gate", NULL,    0 
>> }, /* 2D engine */
>>       [ASPEED_CLK_GATE_MCLK] =    {  2, -1, "mclk-gate", "mpll",    
>> CLK_IS_CRITICAL }, /* SDRAM */
>>       [ASPEED_CLK_GATE_VCLK] =    {  3,  6, "vclk-gate", NULL,    0 
>> }, /* Video Capture */
>
> Hi Eddie,
>
> I already left a comment on it but you probably didn't see that.
> With this change, both eclk and vclk will be coupled with reset bit '6'.
> Actually, the reset bit 6 is for video engine so this change seems
> correct, but you should replace reset bit of vclk with -1 instead
> otherwise the video engine reset will be triggered twice and it will
> take at least total 20ms of delay time which is a bad idea in case if
> aspeed_clk_enable is called from interrupt context.
>
> Test it again after changing the vclk rst setting to '-1' on top of this
> patch series. It worked well in my H/W.


Sorry, I had seen it and then forgotten about it... thanks Jae, will 
include.

Eddie


>
> Cheers,
> Jae
>
>> @@ -113,6 +113,24 @@ struct aspeed_clk_gate {
>>       [ASPEED_CLK_GATE_LHCCLK] =    { 28, -1, "lhclk-gate",        
>> "lhclk", 0 }, /* LPC master/LPC+ */
>>   };
>>   +static const char * const eclk_parent_names[] = {
>> +    "mpll",
>> +    "hpll",
>> +    "dpll",
>> +};
>> +
>> +static const struct clk_div_table ast2500_eclk_div_table[] = {
>> +    { 0x0, 2 },
>> +    { 0x1, 2 },
>> +    { 0x2, 3 },
>> +    { 0x3, 4 },
>> +    { 0x4, 5 },
>> +    { 0x5, 6 },
>> +    { 0x6, 7 },
>> +    { 0x7, 8 },
>> +    { 0 }
>> +};
>> +
>>   static const struct clk_div_table ast2500_mac_div_table[] = {
>>       { 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>>       { 0x1, 4 },
>> @@ -192,18 +210,21 @@ static struct clk_hw 
>> *aspeed_ast2500_calc_pll(const char *name, u32 val)
>>     struct aspeed_clk_soc_data {
>>       const struct clk_div_table *div_table;
>> +    const struct clk_div_table *eclk_div_table;
>>       const struct clk_div_table *mac_div_table;
>>       struct clk_hw *(*calc_pll)(const char *name, u32 val);
>>   };
>>     static const struct aspeed_clk_soc_data ast2500_data = {
>>       .div_table = ast2500_div_table,
>> +    .eclk_div_table = ast2500_eclk_div_table,
>>       .mac_div_table = ast2500_mac_div_table,
>>       .calc_pll = aspeed_ast2500_calc_pll,
>>   };
>>     static const struct aspeed_clk_soc_data ast2400_data = {
>>       .div_table = ast2400_div_table,
>> +    .eclk_div_table = ast2400_div_table,
>>       .mac_div_table = ast2400_div_table,
>>       .calc_pll = aspeed_ast2400_calc_pll,
>>   };
>> @@ -522,6 +543,22 @@ static int aspeed_clk_probe(struct 
>> platform_device *pdev)
>>           return PTR_ERR(hw);
>>       aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
>>   +    hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
>> +                 ARRAY_SIZE(eclk_parent_names), 0,
>> +                 scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
>> +                 &aspeed_clk_lock);
>> +    if (IS_ERR(hw))
>> +        return PTR_ERR(hw);
>> +    aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
>> +
>> +    hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
>> +                       scu_base + ASPEED_CLK_SELECTION, 28,
>> +                       3, 0, soc_data->eclk_div_table,
>> +                       &aspeed_clk_lock);
>> +    if (IS_ERR(hw))
>> +        return PTR_ERR(hw);
>> +    aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
>> +
>>       /*
>>        * TODO: There are a number of clocks that not included in this 
>> driver
>>        * as more information is required:
>> @@ -531,7 +568,6 @@ static int aspeed_clk_probe(struct 
>> platform_device *pdev)
>>        *   RGMII
>>        *   RMII
>>        *   UART[1..5] clock source mux
>> -     *   Video Engine (ECLK) mux and clock divider
>>        */
>>         for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>>
>
