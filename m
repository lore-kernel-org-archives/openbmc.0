Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WGKG0lwPzDqQ9
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 09:16:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Mar 2019 15:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,286,1549958400"; d="scan'208";a="146454186"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2019 15:15:58 -0700
Subject: Re: [PATCH dev-5.0 v2 2/5] clk: Aspeed: Setup video engine clocking
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-3-git-send-email-eajames@linux.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d30b303f-e0ae-d8bd-f457-22db780075f4@linux.intel.com>
Date: Fri, 29 Mar 2019 15:15:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1553894143-559-3-git-send-email-eajames@linux.ibm.com>
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
X-List-Received-Date: Fri, 29 Mar 2019 22:16:03 -0000

Hi Eddie,

On 3/29/2019 2:15 PM, Eddie James wrote:
>   static const struct aspeed_gate_data aspeed_gates[] = {
>   	/*				 clk rst   name			parent	flags */
> -	[ASPEED_CLK_GATE_ECLK] =	{  0, -1, "eclk-gate",		"eclk",	0 }, /* Video Engine */
> +	[ASPEED_CLK_GATE_ECLK] =	{  0,  6, "eclk-gate",		"eclk",	0 }, /* Video Engine */
>   	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
>   	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	CLK_IS_CRITICAL }, /* SDRAM */
>   	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video Capture */

With this change, both eclk and vclk will be coupled with reset bit '6'.
Actually, the reset bit 6 is for video engine so this change seems
correct to me, but I think you should replace reset bit of vclk with -1
instead.

Cheers,
Jae
