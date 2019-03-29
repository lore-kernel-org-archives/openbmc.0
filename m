Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WJW919xFzDqX3
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 10:54:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Mar 2019 16:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,286,1549958400"; d="scan'208";a="146470251"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2019 16:54:40 -0700
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <41569937-f8bc-b391-8b19-c931a11e20d8@linux.intel.com>
Date: Fri, 29 Mar 2019 16:54:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
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
X-List-Received-Date: Fri, 29 Mar 2019 23:54:46 -0000

>   static void aspeed_video_off(struct aspeed_video *video)
>   {
> -	aspeed_video_reset(video);
> +	/* Disable interrupts */
> +	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>   
>   	/* Turn off the relevant clocks */
>   	clk_disable_unprepare(video->vclk);
> @@ -508,7 +497,13 @@ static void aspeed_video_on(struct aspeed_video *video)
>   	clk_prepare_enable(video->eclk);
>   	clk_prepare_enable(video->vclk);
>   
> -	aspeed_video_reset(video);
> +	/*
> +	 * Delay (and don't sleep in case in interrupt context) to let the
> +	 * clocks stabilize. Without this, mode detection sometimes fails.
> +	 * Possibly the registers don't update too soon after clocks are
> +	 * enabled.
> +	 */
> +	udelay(100);
>   }

aspeed_video_off() will be called from interrupt context too. Are you
sure that this 100us delay is needed at here? If it's actually needed,
would it be batter to use devm_request_threaded_irq() instead of
devm_request_irq() in aspeed_video_init() function?

Cheers,
Jae
