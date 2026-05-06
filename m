Return-Path: <openbmc+bounces-1902-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAA3CD342C
	for <openbmc@archiver.kernel.org>; Wed,  6 May 2026 15:30:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9fTx3Zvdz2yjx;
	Thu, 07 May 2026 01:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778081445;
	cv=none; b=SS0P9yeSCmVngdTgIgBrdtVAUhL7KMmfbFxp088D8Q2wYsDiNUHGA5UrPl1QIcY8/862bhZ7kjabAwcCqJFQAlEHG67Cgz7AOoNdauJY9Zpv7zmiuYmy9TCU1Qv6uNL8Hb23i+oiG3r8T2HWAfofrwU4LjHL6rVVBP72mkcoKowC/LSYf3ZuhLgVhiJORhbHb8jPk9txgelZQmdFOAviMvVAez5zhe7AnxQiAfop7tRlB+xRt/d6td60S5rSO7jW72vOic+/ez5Mfn06C9kFOgr+IcEKFS4eBnFUNjMkntVRDFWXejSW0e7Pd1MgT4SnZEewqaCL0Ao+xNA++QGROg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778081445; c=relaxed/relaxed;
	bh=WDlpkf4Jv46EB/T9leUwRd6mQ9wBw+EYVgfYEUzwnTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZiOhyE5IiNIuBFyyU+Y/17OLXoefS1yvyJTQNH2GVFh23JmZG3YyW3FTVlR4kpBosf5u2HtMAsAFcqatOwFly0RyKfrG+BvQxIDvNW1qBNIQA5ZR3bzOGhFZqxmWR9r+dCpI86iWlUrUD3hZwygR9ZyrOQ/MyCu7kFOUmtr5elvS7jgy4xFyGeyKy262cIc9MbvZOi2KRfFXm5GSiN54Fzm0TQ+ebgEvlxjS6LOCqNQY5PkHpBAFLe6w/0yjPMhLrI0BOeAa8MZb//WLGtxSJGIs6oNfGaY82d0Zcj/7S0nCJ1aHmxc8T8vlYRKVz+FOqVNgAWdnlzxfl7fjf6yJtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=fKzKRust; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=fKzKRust;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g9fTv653Jz2xdL
	for <openbmc@lists.ozlabs.org>; Thu, 07 May 2026 01:30:43 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so5082935f8f.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 May 2026 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1778081439; x=1778686239; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDlpkf4Jv46EB/T9leUwRd6mQ9wBw+EYVgfYEUzwnTg=;
        b=fKzKRusty8I/3FnbR/IYi1DnI50S+iPiM4KE6MTdyNHNOHev7oxc96Lqchwm/jUvm5
         P19oGbo46s0fokJRxvaaSOifSPjmM3tFGeMRfi02H4k4apkA25GSFWaknjBObxpBwyqc
         znyB5N8ak+qvt8+6rh3XTqRkhLeb3PId7f4O4PftcbYmm1TXvq0QuQAky5N31f3+c+js
         VY26LsLJAyxC9bBSaCadCeFSeKan6H5z9u2LvPoOyVaswGEMcWKvmENeSbTrf1WucRzO
         NSR3C31jJYfvbxYnvpVgN5XFbzojAgjdBGnnWG7neq/q3vBO5xABeeyINn4zQNyr07g0
         Y/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081439; x=1778686239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDlpkf4Jv46EB/T9leUwRd6mQ9wBw+EYVgfYEUzwnTg=;
        b=nXbuIs8l7mep4tOG6+qFn3gqScOusJ+khMuPYANAJvhj5ZR21Gd6FPr0jqxdopcenm
         uw9S0X50EID55vU+jH1Mqk0UE/E644Fyd84iO3d3GriZflpX4O/5FfyKLlLc2M3NpVBw
         k4hBy4N3udsxlE4iT79KMGrnm6M9AZn6R8/yK5/zSr7X+koAQryNXxRJL5vAALuNk7NQ
         aHXpIqW/7EcKjkchYKJXpMu/X5bEkL/IYY829Kj/v7TwoUADlFsCbhcnNmJpuxPjaykN
         6KUyJKGo2e5a8b4q8ncbSjjKOhZLtBZrGbWGzavkhheW2kAMDFghwhySLeQEwbzcUBwf
         sLaA==
X-Gm-Message-State: AOJu0YznNYMKRiy8E8UXqffBQk8z71J0ucqeRniaDPwJHAkznb9HO78V
	GdMnIJBrQGGliO3bqnOsZ1ATbxrJfvdYSbwhPpDgGE74WRHnXIzinQJpiM0zrndMxkE=
X-Gm-Gg: AeBDievLiwNXb71WdywKexBiYFSjSiogOLT9yrqNWfiUT+9GLskUNZVcbBm+tjdsADs
	rm1g2g87tLYNo5gXYY/NH0vYQ5HIAmGGfiaA+jnhhTmnQzmE+ZUB+5BLrDWbC1qvynHw+NUzD6a
	59PXzg7prHYbH9TodGKervhur/FQ7rnEmNFxyIZDBlFuYpDUY56ybZOh67EhtVNeNBTaWIMoeIH
	KOPySp1IAPy/+7CGcs25MdqxufVwSFL5o5xXyI9hTCD07veD06hTvrQgGDqx2xon0VQPBk0ePqG
	PXYvo4X4H7/hXyfcEe5gINShULWA3vsxY7OP+AKU9SNbcErbtS6vITHK777iXMHXN9eFFepitoG
	+hkVOq6vXiOIqyC8DckOkOzJhHlbI7rs5QSh0boWf9J+EI+Hruy1mAXl+BmYGhkGH4LBIHnblIE
	tifymMMOzCD7NOye1z8p2gcepSJNMy8wrIliz3QV2LBe10CBniM9EsMfmaS5j3doPfsR25h/Cmh
	3pGxDAagI6H2Q==
X-Received: by 2002:a05:6000:4381:b0:441:247a:e98e with SMTP id ffacd0b85a97d-4515ce1c738mr6757990f8f.24.1778081432750;
        Wed, 06 May 2026 08:30:32 -0700 (PDT)
Received: from ?IPV6:2a01:599:843:2a8f:240d:f84d:808a:d08c? ([2a01:599:843:2a8f:240d:f84d:808a:d08c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm12821033f8f.29.2026.05.06.08.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:30:32 -0700 (PDT)
Message-ID: <0198cd6c-dc28-4199-9f9a-6527064f3600@9elements.com>
Date: Wed, 6 May 2026 17:30:30 +0200
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
Subject: Re: [PATCH linux dev-6.18] eeprom: ee1004: Fix build error
To: Johannes Truschnigg <johannes@truschnigg.info>,
 Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
References: <20260429070650.28931-1-aladyshev22@gmail.com>
 <afrlSbCqDeLYb-Ps@vault.lan>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <afrlSbCqDeLYb-Ps@vault.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/26 8:52 AM, Johannes Truschnigg wrote:
> On Wed, Apr 29, 2026 at 10:06:47AM +0300, Konstantin Aladyshev wrote:
>> Currently driver compilation fails because of the undeclared
>> 'ee1004_groups' variable.
>> [...]
>> Fixes: 79d0df36b541 ("eeprom: ee1004: Add nvmem support")
> 
> Ftr, this patch on (top of 80ec78d (6.18.26)) fixes building linux-aspeed with
> CONFIG_EEPROM_EE1004=y configured for me, which has otherwise been broken
> since around October 2025.
> 
> I recommend merging it :)
> 

It'd be great if the patch could be sent to LKML and let it be 
backported to the upstream 6.18 LTS tree instead of having it only in 
the OpenBMC tree.

To cite the kernel development doc [0]:
"Submit your patch upstream. It doesn't need to be upstream, but it 
should be on it's way, and not have any unresolved design concerns."

[0] 
https://github.com/openbmc/docs/blob/92b89c6ac71f8b94f67f508102704a1cf38e68cb/kernel-development.md?plain=1#L29

	Tan

