Return-Path: <openbmc+bounces-1977-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20567CD4F54
	for <openbmc@archiver.kernel.org>; Tue, 19 May 2026 20:27:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmSM4pJpz2yRC;
	Wed, 20 May 2026 06:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779175690;
	cv=none; b=Zlsng+tR0XTgquAjcN0zhESX0NXANIKMPwKYeSa95XP5Zjdw/CUVE6gwEYWi1CpV/rO64zAExFhX2wpSk8K2fWpsej6dS26jhcFHXkYvDvXca6+DA/njCnoz6a2lX72I2bfpVUGxvY9GLhUiJI8OfaATobiHGnk6m6mpL/ABXAfIoMDH/F5KNIt8k5yXZnKG1KAv4F3cXuR99MS5KMLrDszrzV7ZnEr0sJx01hU8gvruurxvL8LVuNO0Lvrr7qYW69I9VMoNZQLxdx0tCUawv7PXvt8PJVdIAIcCAN3At2MspGDimwaPEWgIKwb12m23CxS76ZQPxrezH78tJYAVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779175690; c=relaxed/relaxed;
	bh=0X7kGA4RkuRUCNS531F3vdoEpBVFBjcHrfTGWZweulw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXBF3BS5QpsPIlmM6hYX5UvLxBH8rtlcRGUISAFodSrwOHSTAjTyZGuB/r3gG9E1ZrRJM/KQUi2D6bq7ZE2e3ndlSEodAwNkR5NhXZdU2i/DVNrb3MMDxVPEOazf1iUtesFnqtYGIim/eqIqsl9eNYUF27FR+qfowu8/7KzZ+J8iLztGLAQCcEybjoFD2zaMfAfyfrxTnytX5vfOH65cRzLJbjThNlaRrMkSKSICKOPokUiWW0FAJbgaUlbMKHUwLZt4vzKnkpaBcei8Q3itd6xiIwPGTxv60XC67ZQIEyIgBYNSlPVCyZ+23un/7Bl6v8zangu98EbqjenX1BWsyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EzmmgRAb; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EzmmgRAb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKR925WD8z2xqv
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 17:28:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779175687; x=1810711687;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lVLOIx3b0/JejonlmaXis2uhCNzG6ivfoixw99ttUfQ=;
  b=EzmmgRAbcEHlysblWpboqKlvP5Ek4BO3lL2HauMYVxprp3OEkKnYy/tY
   XxtX7hG17Hs80en7OEa/6/TKzitAGHjOoU7pL6RnHSlGcpdHGRJU9AUbS
   xkNIOZT5nnqMnYjtbVBSy2TJv4kPBOqYmxj0GhwuWHKvKQNlNFA7haHGD
   RjledGTy1SbW90LxhEiaDsCXQzEOsxigea2iXwLNdW81vcmzutQmnNTyj
   c6VS/12zWDqZBqJpg9QqxiCQfR8u5V5DsyMvsFbCbRHtwMOVMLmz1fW9O
   semC5Sron43B1ultWMEEnR8nT/z//OdQiq1e58NXD9fozIUrJCb62niuM
   w==;
X-CSE-ConnectionGUID: BwwLu5vKSba0G3GnFiJdnA==
X-CSE-MsgGUID: IQsu1fq3RvOmIelv5da7pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83660560"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83660560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:28:00 -0700
X-CSE-ConnectionGUID: v7yoy52UTwu41XeHYl+gPw==
X-CSE-MsgGUID: Jq6NPUYJQtSnAZoSuBkg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277798240"
Received: from unknown (HELO [10.102.88.45]) ([10.102.88.45])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:28:00 -0700
Message-ID: <992d431d-26eb-49d3-b196-c0f902a0c348@linux.intel.com>
Date: Tue, 19 May 2026 09:27:50 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.18 0/3] ARM: dts: aspeed-g6: I2C/APB cleanup
 and AST2600 I3C enablement
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Cc: maciej.lawniczak@intel.com
References: <cover.1778692820.git.dawid.glazik@linux.intel.com>
 <b9439e9501bb50ebb4a60dfbfac9b33a68c62878.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b9439e9501bb50ebb4a60dfbfac9b33a68c62878.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/18/2026 4:10 PM, Andrew Jeffery wrote:
> On Wed, 2026-05-13 at 19:30 +0200, Dawid Glazik wrote:
>> Hi OpenBMC maintainers,
>>
>> This series enables AST2600 I3C support:
>> - moving AST2600 I2C controller nodes directly under APB for
>>    consistent SoC layout
>> - documenting `aspeed,ast2600-i3c-global` in syscon binding
>> - adding AST2600 I3C controller nodes in aspeed-g6.dtsi
>>
>> Upstream status:
>> - submitted upstream and under review
>> - no unresolved design concerns known
>> - review received from Krzysztof Kozlowski (`Reviewed-by`)
>> - upstream thread:
>>    https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel.com/#t
>>
>> Please carry this series in OpenBMC temporarily to unblock
>> platform bring-up while upstream integration completes.
> 
> I've applied the changes upstream and backported them to openbmc/linux
> dev-6.18 as part of that process.
> 
> Cheers,
> 
> Andrew

Thank you,

Dawid

