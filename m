Return-Path: <openbmc+bounces-1379-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272FEE81A36
	for <openbmc@archiver.kernel.org>; Mon, 16 Feb 2026 15:26:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF67F1Dl4z2yhZ;
	Tue, 17 Feb 2026 02:26:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771255576;
	cv=none; b=UWxKUinyjYMudFi9QLa99DaEPqMx5ue/pMjlVU4vvM8uggMpLMBefngYi4mxmTQKXSZ2nEJ4I3/VbPAY3NJQOotUnT6z1d8q+W1lV0DUUilrfjXcFvCuZgnrb940wThJkVsMB7cxIevYHC7lboipjQ0MdK96F3ezAee4QDYOZpp88za3dR0lZnQvOpCWgEZm11drtssd77K0iGTuZkkEmCjbU3R6qK75dKVD9C8PN+/FKabTGN9k4wL7ndqyvrv+IeeUXQnTfTNqPN6jx7djLLJR4rGZtG+TSx7LKeUy/OG81I2t7+HdHl/pd3UZlgVbtMVpAg9IcW6QPZFtZ/8ryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771255576; c=relaxed/relaxed;
	bh=0L0LRV69FMCCwapk/tKlx7ALfhm9oqfw2MhnEs9iHQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsK9q0V/e1qdtSsU52j1NVckjfHkD0TaGrHIyupqhYmQUveZlW6GTpQZFoP+6StbkXi4NnZo55AO1gPObfDoam1nXspJtBuFKrA8HPXTdT7TnIb26oEODa51TPlX9OrXqv4NqfCJ4JVmNz7uxAcgHOia+A7HokJVkGEFUhEsv76mMnDNEgt1o+Twsz1GGDTb9G5W7q5e0VLf9eboc4zVn0SYokXehcxeclFjTIJcmo/7o4wyRIsRx0nybEM2j/Ax6oQVsai6Ho9Bu+yq5KpXCxbfAwJdRMw8YJQAlnfpGANHvMFSzV6rBWHvyNUYHTRcBDXQbiD+VU51oU8Rf3QhDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G1qHTsGs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G1qHTsGs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF67C332dz2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 02:26:14 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a79998d35aso21638395ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 07:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771255572; x=1771860372; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0L0LRV69FMCCwapk/tKlx7ALfhm9oqfw2MhnEs9iHQc=;
        b=G1qHTsGs+igq2FJ4SDTm9oQfOXSONubrcmg58+9o2ZHXTdA6VY6RQGh2cSiEWuFYHl
         dsjy17IctEJJS2olS5qE5C7B8PVTbgKsyAn1UAj6yXoQ3kE8VOg8NhB6HtORBfUcS2i2
         N2iFFcZLcKI/zdOhBrvuwr6Yr0vBdyZWFXGrxFwEH6G3r5J3rbTAhfVYLqHAd6qS4+/5
         ykwR2jvd52K/tJFf3wOiVe5f72eYnfiuia7K0bxs3v6KvrYtzG9f6xtp7Vi9NUCZ5QyR
         zL1vjFQjiYHVPyDxABZxrJNSLcro94s87nLtP1MPhO/csj1X9ouGHvML8Lisr2brzQVM
         D45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255572; x=1771860372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L0LRV69FMCCwapk/tKlx7ALfhm9oqfw2MhnEs9iHQc=;
        b=op1rX5oiu/2WlzMEM0VjlzULzAhaVXvX9VKWTrEyEA/P8ogfKnY9ArbIX5tkumtypf
         oJNBsgJRGyFw0QZaaeO9NbTCty7GNyW8N2j0vxoOXXMeeuiztr4SvntoiZ7tkqcZT+U2
         TgnGsFTgNc47OXI4DwbfxBESWIJ/UoiItl76YZK8CdUeV8bhq8+2PMygCpBHU1UhLgsO
         j0aIQ9lzBqWK3uoQ8GXB/9I8EIAOTbtMkrxeJum/lXwaP3P72dB1jPHai5NZYK0VVmqK
         UQrRbpnY5NbR3uZ1PqGCyW3C3UeP7WRXamNwFfET6Qifx/wi7397NP+XWkPGFmCC6dZS
         oA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnv/c1atOMdVpjZVUHZszJz5Hmi8ua0wTcEZ/sLVhVBPw1gS/NpRcgub/xqWCxdouHGColRRlA@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFsFWLHNWHalGIOs9u2v1AtaeN3XIjclNQlsIL+LtsXp9/mfKy
	UxREbUpckl3ejDJzO8KmTCB4qOPMmHkHtI1xrwZ7dlwdcdSjJZj8E2Sh
X-Gm-Gg: AZuq6aJ8dxOVeHwDGEztnsr2pFshuJwpiKG/mUaUg3hwk68X0wCKVk6zW5WkmaZL9ks
	WyflXHSg5YaXrR5OO73kRGhqhmiA6hhGi7mmSIIwX1iAHZ3MoCqnOqsLNbd1VMTfQK9z0UL6jg/
	kJtgN1X2mIxWwfB5XojtfSq8aAqXxRi4i7uS8RZcX/mQsB0sN+AAK+nF7BpyWm81KxqW/cmZHPc
	IAnTAAPbA7jkb60ME2RB1y+iqBM9kVoFF01i+iRv/B8/+mHCWLElU6YVPTPYeciQ1FpOl7wH0jg
	z2zIQewqtEnh4K5BqHvnwE3cIoFeZikTKOt/yu+bJoBLZbMbC5wPvGiyt6bqC87Q1jLJG5phBRl
	cJ0z+2hKtaK6xwxNxBchEPaJ5XpRidcMKvDxfgcSdEo3X+ZM0QutErNLuxFnYYxBzNWIJVgn9r7
	LcZUCPeaQQLixbpz89IjUjqoPjas6Gx416X+KE
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr114047525ad.37.1771255572099;
        Mon, 16 Feb 2026 07:26:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1ace5e1asm72375535ad.92.2026.02.16.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 07:26:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Feb 2026 07:26:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, joel@jms.id.au,
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] watchdog: npcm: Add reset status support
Message-ID: <21707662-d2b3-4742-9b0a-c964225e6ea4@roeck-us.net>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-3-tmaimon77@gmail.com>
 <e946baf7-4c3e-42a6-9cd2-a4b917ce09bf@roeck-us.net>
 <CAP6Zq1gGVB+hk+=xSRyPgddq07F_B+oE-dc246JRW2_waoe_bg@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP6Zq1gGVB+hk+=xSRyPgddq07F_B+oE-dc246JRW2_waoe_bg@mail.gmail.com>

On Mon, Feb 16, 2026 at 04:30:46PM +0200, Tomer Maimon wrote:
> Hi Guenter,
> 
> Thanks for your review.
> 
> From your comments and from Krzysztof’s earlier feedback, I understand that
> I cannot use Device Tree properties to describe software behavior, and DT
> should only describe hardware.
> 
> Given that, I am trying to understand what would be the correct upstream
> way to expose the different reset causes that the GCR reports. The watchdog
> framework provides only a few standardized bootstatus flags, and I would
> like to check whether it is acceptable to map the different reset causes
> into these existing flags.
> 
> For example, conceptually:
> 
>    - WDIOF_CARDRESET → power‑on reset
>    - WDIOF_OVERHEAT → core reset
>    - WDIOF_FANFAULT → watchdog reset
>    - WDIOF_EXTERN1 → SW0 reset
>    - WDIOF_EXTERN2 → SW1 reset
>    - WDIOF_POWERUNDER → SW2 reset
>    - WDIOF_POWEROVER → SW3 reset
> 
> Is such a mapping acceptable?
> 

Ok with me as long as it is well documented (i.e., in
Documentation/watchdog/npcm_wdt.rst or similar).

Guenter

