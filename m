Return-Path: <openbmc+bounces-1805-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29208ED7B8B
	for <openbmc@archiver.kernel.org>; Tue, 14 Apr 2026 08:51:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fvygg1Szvz2ySS;
	Tue, 14 Apr 2026 18:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776156702;
	cv=none; b=BCYp4jOPCQRyVt3pwMi/dkg1E89RLUeuio2Qz2AgMslDNALZi7HkxzAd3VAro/7KO7mygLy5Kaj6tBtj9xGv8qjia9+pWs6pAPI/p5zettZqw1m2a2TAeFCfBcqM8at02ejVNswGsk5cuaONSFDKTeet3fEYDyIhkjYE0Lu0eOSAob1qrueJTZBdIZAN79T1s5GEn6erjPTSVN3HBP/HumXWWMqtFuowF98ivqbh5dHr29yJ1OdLcNveFwH8U0LOJa3fCVyhOw9DOs4Ve+VT4WIa/YIDeAinD4aW1JKiHEQCcMuU55cH2FrpgEequPICM+ykGRhrHo9y4LGvsHBTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776156702; c=relaxed/relaxed;
	bh=hMAnNztrMK4uyzLJL3prcoz6s30PVpPtkt46osKduNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSM4u2NjiEXH/ZIAdzluEfv3GEk0nZURuGby1j8Avuzu9+44wQ/bPddVDsrXiI+jSEWEWfP6GU6h73vwSCFXusVcqgfh7qQRqBxIhU8bP/bDVUP2L+T0V6BDjPlzLsB+dQ7b/fQ+kp4fDSdG205pJoWwpalkpCrxRuEPc6TRC8Jl704q8nYUgNCmed5sPqQ0Mn0p8lyNBJCDR5jNOSPm7td6s/AvceKytOd+y0RAl5kAXKtggNbyd6752gwjM6p1l1aV0vYKsF3A0oCRTn9qmu0Pjqdl/fgxtnS/ryFKhOOAw0h8KZi3aLdeLxUNMns4PyYwY5rA09DvfccYGmasgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lp+/sepx; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lp+/sepx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fvygb47dQz2xlh
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 18:51:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776156700; x=1807692700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RnX7Vkth35Vq24G1TAHKAs4v16MipVeSbcfs0BNSI4U=;
  b=Lp+/sepxsQ97n8rke5wTu42z0QtZaMvpzdF2GH0uEsbQpVg49/iPYtWi
   5fD/+tMV2eq19VVEutcEM6buQKp0pqJU/KOt6JqMvl5rDOPqKrVsRJUa1
   KCplKw/o5+zH2DdJvKc1avnFY04l4jdgeUXuVZJqMruzf5NRkklRyZYw4
   5DN4g3mIwb9wia4Oo+fBmzOJ59nswO0itz58cJwq8y4aJXHDLRDCkyiBK
   2YcmWk19AoxBpz//NrBrRRNxFb78+mvBlQX916GEHr5aGHvpeSsj06p8N
   vrpF46dDD/FBUkoedb1NgTPeAFMuiyrVsSRuGOiFWwAG+YpPOjw1N5sYS
   w==;
X-CSE-ConnectionGUID: 1gl7o509T5Cgq7dAKv9K1A==
X-CSE-MsgGUID: y/dUhylnToqTVF2VBJgY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94507287"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94507287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:51:32 -0700
X-CSE-ConnectionGUID: Jn/6DJRbRYy4uGONwJcS4w==
X-CSE-MsgGUID: Cze8uPm5TPi9Duhb5rfiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="268013300"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:51:29 -0700
Date: Tue, 14 Apr 2026 11:51:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Carlier <devnexen@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
Message-ID: <ad4ADuwCgRGO99u2@ashevche-desk.local>
References: <20260411123517.15083-1-devnexen@gmail.com>
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
In-Reply-To: <20260411123517.15083-1-devnexen@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Apr 11, 2026 at 01:35:17PM +0100, David Carlier wrote:

...

>  	ret = devm_request_irq(&pdev->dev, irq, npcm_adc_isr, 0,
>  			       "NPCM_ADC", indio_dev);
>  	if (ret < 0) {

>  		dev_err(dev, "failed requesting interrupt\n");

Also consider killing this message as it dups what IRQ core prints already.

> -		goto err_disable_clk;
> +		return ret;
>  	}

-- 
With Best Regards,
Andy Shevchenko



