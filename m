Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 435Rc20qrnzDrFD
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 05:57:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2018 10:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,295,1539673200"; d="scan'208";a="107342065"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.122.32.235])
 ([10.122.32.235])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2018 10:57:49 -0800
Subject: Re: [HELP] ipmi-kcs didn't work
To: Vijay Khemka <vijaykhemka@fb.com>, qianlihu <wangzhiqiang8906@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
Date: Thu, 29 Nov 2018 12:57:48 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 29 Nov 2018 18:57:55 -0000

On 11/29/2018 12:42 PM, Vijay Khemka wrote:
>      Try below fix on clk-aspeed.c
>      
>      diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>      index 596136793fc4..b55d35e3eb5e 100644
>      --- a/drivers/clk/clk-aspeed.c
>      +++ b/drivers/clk/clk-aspeed.c
>      @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>               [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate",
>      NULL,   CLK_IS_CRITICAL }, /* DAC */
>               [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate",
>      "clkin", CLK_IS_CRITICAL },
>               [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate",
>      NULL,   0 }, /* USB2.0 Host port 2 */
>      -       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",
>      NULL,   0 }, /* LPC */
>      +       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",
>      NULL,   CLK_IS_CRITICAL }, /* LPC */
>               [ASPEED_CLK_GATE_USBUHCICLK] =  {  9, 15, "usb-uhci-gate",
>      NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>               [ASPEED_CLK_GATE_D1CLK] =       { 10, 13, "d1clk-gate",
>      NULL,   0 }, /* GFX CRT */
>               [ASPEED_CLK_GATE_YCLK] =        { 13,  4, "yclk-gate",
>      NULL,   0 }, /* HAC */
>      
>      In my experiments on my system, LCLK was not enabled due to the null
>      parent dependency so I added CLK_IS_CRITICAL flag to enable the clk.
>      
>      LPC interface is default pin pad setting of AST2500 so you might not
>      need a pinctrl setting on it if you didn't change it's pin pads to GPIO
>      or eSPI.
>      
>      Cheers,
>      Jae
> 
> Jae,
> Are you planning to upstream this patch as it is needed for kcsbridge to work. Also aspeed-g5 dtsi file.

Okay, I'll submit this patch and dtsi patch to community.

Thanks,
Jae

> 
> Regards
> -Vijay
>      
> 
