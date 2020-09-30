Return-Path: <SRS0=bToe=DH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5BFC4727E
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2020 09:33:05 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A47CF2067D
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2020 09:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A47CF2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1WJZ25hYzDqWq
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2020 19:33:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1WGt2FsSzDqTC
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 19:31:29 +1000 (AEST)
IronPort-SDR: 3Uzn5kLCD5IHQP920VHmIOoFFcT6I4EB2ABEDvxZCdgbUZzdnPiXiB+wuLUbyQ/w1HMEBfRTD9
 sczqF8PFt+Yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="162462305"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="162462305"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 02:31:26 -0700
IronPort-SDR: xM4l5HUa0fzsNcmwYCuoLVFZ4VJugXXLFy+dgQtO9JiJE1j1t0MlMojIv7DqrAByHNDoXmalVX
 FooC7wFH5Zdg==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="308096666"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 02:31:23 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kNYSD-002z0o-I0; Wed, 30 Sep 2020 12:31:17 +0300
Date: Wed, 30 Sep 2020 12:31:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
Message-ID: <20200930093117.GY3956970@smile.fi.intel.com>
References: <20200930071342.98691-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930071342.98691-1-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: xqiu@google.com, benjaminfair@google.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org,
 linux-i2c@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> Systems that can dinamically add and remove slave devices

dynamically

> often need to change the bus speed in runtime.

> This patch exposes the bus frequency to the user.

Expose the bus frequency to the user.

> This feature can also be used for test automation.

In general I think that DT overlays or so should be user rather than this.
If we allow to change bus speed settings for debugging purposes it might make
sense to do this on framework level for all drivers which support that (via
additional callback or so).

> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9..44e2340c1893 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2208,6 +2208,41 @@ static const struct i2c_algorithm npcm_i2c_algo = {
>  /* i2c debugfs directory: used to keep health monitor of i2c devices */
>  static struct dentry *npcm_i2c_debugfs_dir;
>  
> +static int i2c_speed_get(void *data, u64 *val)
> +{
> +	struct npcm_i2c *bus = data;
> +
> +	*val = (u64)bus->bus_freq;
> +	return 0;
> +}
> +
> +static int i2c_speed_set(void *data, u64 val)
> +{
> +	struct npcm_i2c *bus = data;
> +	int ret;
> +
> +	if (val < (u64)I2C_FREQ_MIN_HZ || val > (u64)I2C_FREQ_MAX_HZ)
> +		return -EINVAL;
> +
> +	if (val == (u64)bus->bus_freq)
> +		return 0;
> +
> +	i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	npcm_i2c_int_enable(bus, false);
> +
> +	ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> +
> +	i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);

While all these explicit castings?

> +
> +	if (ret)
> +		return -EAGAIN;
> +
> +	return 0;
> +}

> +

No need to have this blank line

> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%lld\n");
> +
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  				  struct npcm_i2c *bus)
>  {
> @@ -2223,6 +2258,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
>  	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>  	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +	debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
>  
>  	bus->debugfs = d;
>  }

-- 
With Best Regards,
Andy Shevchenko


