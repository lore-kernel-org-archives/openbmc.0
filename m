Return-Path: <openbmc+bounces-1811-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA74F9D0C9
	for <openbmc@archiver.kernel.org>; Tue, 14 Apr 2026 12:11:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fw36568Q0z2yVL;
	Tue, 14 Apr 2026 22:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776168685;
	cv=none; b=JX8K8+xTjyVM57DcIKNllrx+sK7DYQyKoaxCL6roKukFujqCaFeLGXxYE/+VpIhUOMBSoAZcpdSqra8VkOglmrI+OT8eMY0R58QXfd8keSEwitA7G/0WAgtGZU6lDuiHpItxXIlhR8qNTzysTem1iq3YB4YXLURsMy1Vrbaxej8H8jk5aBJ9ChMMX+Nx+VoSzsrOvvUWyKwIyNsuLsxRbloB3XrCqOaa3GS2LROmQNWoy45nzs+i0mj+G0rT9ixzXC+x9mZ0WvIG8B1YffGDuFLEBHEi0kdOirQ/RfuHBGxhWDoRDI6blJtpoVXWvwWc+6ohmyRyGNDp4y1+Gc9puQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776168685; c=relaxed/relaxed;
	bh=Sqbt7ULv8InVtbZ9inZngrRvozBPOlAzIBpV42jkdaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgdJ9NsacPIec5M1XIHouJmm3MhWT/IiRxTYybkZ4/z1QUE+0w2nwkGenm+/EuPKpQ+3jbCTB0iQP2frkUoeyNdBlBnNKmuqoJ8FU4QbRlKtZBRno1W8IapipfIXupBwZgjS0DZOdgxbYcl4G83FrfrR+tLZIcxODE5PNt0pLVN2m/cGbv57Ppjz65fA7Ttor6nDpNyIFLJsM2xQQCs0G7lOctJUbRf4Wz9MofY5vNZNAayZdX45pXp9nYzCLSG/T2KzMRU4kGMFuduYhISq5SHuXyi0ZwcDPVxv24srK5hq11jv9nVjI+U3m6xK7nCcv+eq+9+6mz5Z/dgRBo+bOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MthjoDqE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MthjoDqE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 14 Apr 2026 22:11:22 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fw36258XJz2ySS
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 22:11:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168683; x=1807704683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u5kb03nvZ48mxdSo6PxIOY6V9LAhwq9og0vesRHxseU=;
  b=MthjoDqECSAWph72Mknb0IJmr+Xn6CDyZDt6f/H0rcvgsFyqvzpSi975
   o1Zzt+pXpW/UhPhVya3WiIRJRlBIefQMrxwcEpmcQ7aDeVy2Qzhlthsey
   xupqaBfaTQVpGqgdcdScPhujuq7JWUdrQIbjGburLZvUKhdvh4PvoTM17
   d7+QOdAp4zWDzsTeL5jB4zdpF0z34naZc8sFA6qbWRmwU05VkfRHw1dL2
   seTD+oOlB053sLGD/jc0jUqDejv1thagK3vsnxLzj25cZxmIuD/nFsxbZ
   EaOhFXtoCErBy7Y6U10j8s/1t+qJ+iVulIOjdrFlbnifos/H4sVBWds71
   A==;
X-CSE-ConnectionGUID: MToa1ddzQveHR9KReZ08/A==
X-CSE-MsgGUID: L3mdpTCqSu2+36B/WV0Tvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77194671"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77194671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:10:11 -0700
X-CSE-ConnectionGUID: 6tYP6XptRzKG2BhUPwDnUw==
X-CSE-MsgGUID: 8InQsNzPTPOZgxiqmMsucA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:10:08 -0700
Date: Tue, 14 Apr 2026 15:10:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Carlier <devnexen@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
Message-ID: <ad4unjKuC6Ff_yse@ashevche-desk.local>
References: <20260414095929.11257-1-devnexen@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095929.11257-1-devnexen@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 10:59:29AM +0100, David Carlier wrote:
> The driver acquired the ADC clock with devm_clk_get() and read its
> rate, but never called clk_prepare_enable(). The probe error path and
> npcm_adc_remove() both called clk_disable_unprepare() unconditionally,
> causing the clk framework's enable/prepare counts to underflow on
> probe failure or module unbind.
> 
> The issue went unnoticed because NPCM BMC firmware leaves the ADC
> clock enabled at boot, so the driver happened to work in practice.
> 
> Switch to devm_clk_get_enabled() so the clock is properly enabled
> during probe and automatically released by the device-managed
> cleanup, and drop the now-redundant clk_disable_unprepare() from
> both the probe error path and remove().

Also need to mention the message drop here.

"While at it, drop the duplicate error message on ..."

> Fixes: 9bf85fbc9d8f ("iio: adc: add NPCM ADC driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> v2: drop redundant dev_err() on devm_request_irq() failure since the
>     IRQ core already logs it, and remove the now-single-statement
>     braces (Andy Shevchenko).

...

>  		if (PTR_ERR(info->vref) != -ENODEV) {
>  			ret = PTR_ERR(info->vref);
> -			goto err_disable_clk;
> +			return ret;

Now it's simply

			return PTR_ERR(info->vref);

>  		}

...

With those two being addressed, feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



