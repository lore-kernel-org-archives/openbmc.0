Return-Path: <openbmc+bounces-1408-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADB7F3C991
	for <openbmc@archiver.kernel.org>; Tue, 24 Feb 2026 15:39:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL22N0rpwz3cQ7;
	Wed, 25 Feb 2026 02:39:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1230"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771947547;
	cv=none; b=BUHPfXf3zBsXsGUeKUWQf0knX5Hq/V+oKtJ6wj7JHZjpk5l8p/Np92FttMGaOSLNVEhsYAUgM+e+uWBl3ttgzlvrPDicRmzkds23rkppLVoyVmUEfNY3C2F00uRPh3fHtdrgKVwtH800qgBhf8lGeL/DkrntdVNnn8o+C/TjEvA6bjHllzG5S9B+s/XoxQO+UiUAFJKFeAyFNwuNWAJ5vs4ufSFhBj5qR2IJkvck7q8K2Vvir9vmdz3xGW83ovfgeqx6fUfXpvZo+vcDkwh8DUjd8/CbIVoT32OTMe+xQWjG6mEZwR37V0buEIsO0p1DABsVC9/YLB+1CRo1DuXHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771947547; c=relaxed/relaxed;
	bh=Vi7E+fFd25dHhSq0UPIuOVw7/nIwnNwLt9NCUlo2++0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOW38qSW1l49TE14lG1FsS0EixT/sHxr5jMS9BJMPLmMHfoDYkMhCrnROlzn/MMC0fFhrGDkSiUiu/Qzzl8zumrXySNSgTEIto7cYuLa5OHmRQqgO92pYsNyPiDlFfTCnsPYSFOcMo1AuHNaMEJaE9pYRGN56nZCzk+W/hLgZE93VNq+lwDLNuyUaKb85toFcmQv+BkK1JJLHiK0/eSLZscM0HuRx6SCsBVudzLEIJE/LnjqV++3W20+ioFVdnmK8kwl3/WOakW2B1KZNS2fAPDaGX8FQB/jJACLlxcR0bPCcHMTUhQN0Nr4bWpS7hI8kjv77PGQXWFR6/RdvJArpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U8efgEZE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U8efgEZE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1230.google.com (mail-dl1-x1230.google.com [IPv6:2607:f8b0:4864:20::1230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL22L509bz3cPf
	for <openbmc@lists.ozlabs.org>; Wed, 25 Feb 2026 02:39:06 +1100 (AEDT)
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-126ea4e9694so270227c88.1
        for <openbmc@lists.ozlabs.org>; Tue, 24 Feb 2026 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947544; x=1772552344; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi7E+fFd25dHhSq0UPIuOVw7/nIwnNwLt9NCUlo2++0=;
        b=U8efgEZECEC2fDMEbAdWHlrb70WQhim6/IzfJbAfvCwwFwgif/Hbu7zUridx5Nx7pz
         wRx0WUtGiiBasPgocQ5cg2QPLEcY0WOydSIjXsPOfdXXK5PBURsO8EIYS2bD6CmRayKr
         NwDg9+r6FrGGtYo+XuQSRojKZrijjQadXxGj0jArj7lyN0J8P2fDiyGRghiWFpaQM3Uw
         tmHTh0Mgy9f9kR5U6MuZJuFMJhUmmO1z4TLSnD3cmNE+w3kohvBLtvBZKaLQ+RSunVQS
         igqftweQeexOhWlE0w2uLUW71jlCS64pKaAkaCg21ZRbFYvn1QpebRNFH1P/Km+FpiCx
         1Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947544; x=1772552344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vi7E+fFd25dHhSq0UPIuOVw7/nIwnNwLt9NCUlo2++0=;
        b=Blbh/OCKzhXy83L0SgQHarH+ikKy6/UoR2bEYsm7rf2c20BSL6ti+Yroga/b/+VBjs
         dxXLtGDTawCdELNOBwxtEWiVOE/mhDy0tFv1FBCsGrL+p+Ucji0ZUahgZn1CDptH6uKZ
         Jy0WPuUzbFWGNSGwipyFjaJT1ZyYAt7qoeA4nE9o+u+e7O2LSSr9OYaMPEDNmfnaFr9B
         s2NAVLaNr4fD6O86xZubw5fZXeyil+2y5zT1Wq7NneZ/OtllEkqZ2e0zfatQUk3aYfBP
         3+4xUmK6RNbNlRvdk8eUB8qzF1swXp3mL4nkRtsOl7MoZfYPRzNoNrdYcC0z4gf8QRKK
         MR/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVF6w5UqvxiSQH6mWOGy8l32T+/rZSjHWKZpsdcMV53oSzyj5v7XQNkAwLWmZyRABWxJ+gcHXWR@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+a+/eHgIi59pxGvzfkdaghPbeWPm6L1RWyw5Fdrv0RZ9nsHOs
	uaQ2JrMUUCqBj0/prEY5bwYtMsGMyyYXmRMLFAaqZPeZFTFTIvN6Kl/M
X-Gm-Gg: AZuq6aJrXKQqfsqzG43OwCrsx52gpmQQgod5HoE/VcbX6VL00mrT3zHFuPz08hPvdXA
	3409Pn2De+7ZQpBUmXeQ3bTlq3fwAPUPbbRVI3F7N9GD0i91pxP4i233YXyv96SyeLHmJMoHM69
	p8giUkHPXzXQrzKi/TA/28EmE8rFYXB0DwCfHsze2HGI8wdJcgC5WCQH11XM4w+M6ljTa1uGSSV
	s49r5mpMMXrnxt8+XAnCHfKIAJhx155Iz7ZXfUry+ZMU0YBeUe4XHX7lWAHnfer2nZSFXJ8pKUz
	yL56xmsZVCuuPN7X1qGkV+wseLFBqrtWISpa2BV3/P3kItlRZOPgulPmo3v0lZNvlG07WlEIjkM
	5qcPyXSdVXm7G/y/xinLPHe4F+/maHGvdXK6D3hAPMkOfBeV+muUPnuR5EqtGSrJYtVhyz8q0Md
	YSOXat91lyn3d6eK4l9KrCjy+CKyNN2viknpsj
X-Received: by 2002:a05:7022:6993:b0:124:9acd:3ef9 with SMTP id a92af1059eb24-1276acb1c97mr5939643c88.8.1771947544202;
        Tue, 24 Feb 2026 07:39:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8304sm6956981eec.17.2026.02.24.07.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:39:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:39:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <09fd1cc4-76ce-4691-bfe5-3167f2940b57@roeck-us.net>
References: <20260215163553.1334475-1-tmaimon77@gmail.com>
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
In-Reply-To: <20260215163553.1334475-1-tmaimon77@gmail.com>

On Sun, Feb 15, 2026 at 06:35:53PM +0200, Tomer Maimon wrote:
> Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
> format.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied.

Thanks,
Guenter

