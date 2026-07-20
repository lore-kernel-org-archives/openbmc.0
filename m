Return-Path: <openbmc+bounces-2305-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B976C44520
	for <openbmc@archiver.kernel.org>; Mon, 20 Jul 2026 16:10:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h3lqD3fNZz2yYY;
	Tue, 21 Jul 2026 02:10:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784563832;
	cv=none; b=TdhsgOvv2moFLNtincCH7VEdhxI8OBwNx+iZjmIcOSfeinBXcG9Eki059L8rBmDhGozttoAr0c6cmPCJW0x7Ei/77ecKcXL2xSp/dKwjHyQfOagTb7sEfYyJ4/RoLjc0EJtzaCBjo/CS8ikrtT0lNvfxLoVuf8FiEP5hLl6Io1Qwf6z+SsCpR25T59uzBnN+Ano5imp8zyOyfTcYasy/4zVxX1QdeSm5JfwIF4NKF3+KWcXFZETXOZOiasS3iTpPIGX2mtVmz1ZoSauFIrx0Lby6n39nIMNX1xzGNQ30QV6Er5B/uEjfjLXa1rXE0iFmWKfJkn8WB3+4Bb4J9jZW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784563832; c=relaxed/relaxed;
	bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZcJMiNa8P5bk/SvCSp6h45dxJav0Bus+BYcfOmmF2C2CcczTYiJlpkaJoWZ9/wgTuT+Udg4tlxVIFLqnwxRX3mUSyImtDaciw9EP55MO0ftk7gT5j6IaIVySj0H+JRDznhXQorrLOKbP4nTQhdWM83yQtsZxZ0TmAyEiJPp96xo0zoNf3eziskklI4NbpF1GR9MH0+UVKv5oLIvFy8POWWsLnyteaxMjUo9/oL59nwoOkGMU07WHW/BQQC5Cqdd5xa1zr1XGojDOo8K9hGihL6H7Oa4YzVr0Sp+6yJhD6cAOjCuy8thHfY2j6aCZTOy5aGRVEXVlxltYoQky/1kZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HJ5MjD8p; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HJ5MjD8p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h3lqC04tHz2yZf
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2026 02:10:30 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so63107475ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2026 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563829; x=1785168629; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
        b=HJ5MjD8pf/wC3SSD558Ja1MWSA3iLR46LbnGZp3WwDRGeQ+K1gOxw6Sy3gEfLUbfVz
         cdm2a85zyR4Ni5JE24RtfOp2Gvu+FesyGwAgCPrTaKm7cPIX1NJ6jATXrgvOL55Y88fa
         HA2dABI4D0HJs6lZ19zRYlHQvcGiqLSzjsZ/C9X2O+BH+jLCiYlY2iLltFAxLlpJwd/X
         1p0wFXuRMcev40GinO5b3JiOTm1moUEWyjiqzD6dSb7raz5Ebo+RTInDfVXFXLnYI/Ai
         3IT/Z1s11+S/KZqiTVF7nok7yi/rWYfRuq2C5tmMN10XaUSU1uAukQXJKq4kA5gRrH1c
         7acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563829; x=1785168629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
        b=GzDeRxIDdh7wC+9wedPDrCfQxKgKJkn8BIfxka5sfXWr6hstEiGZgGsuOBEQMBFcWd
         53Xyy+hAGn4GxHQ0ad2v4pUkXcbwL6crXhYwGsig3cdzNBC176EWPFQXVndjSFROnLTi
         XZoQF1jA5sRvAcUsUGtiKgqN1FlEO9GjnqDFrrbkSTypv3etGf3o104ZJfzekoVoN8t5
         5613lufJ0XCdovX5v4EdfRIZpoz+dqIzKOWZQxd/R6HcLt1OYp1kcCTgtfvdMWRPjM9R
         MF4md47gRmGUAd5sxDE4gZ7NzTEPbdKcRdIWa2F1B+zRzy+fedCZbA7DBBeObvOAQ+HF
         ynow==
X-Forwarded-Encrypted: i=1; AHgh+RoK6C/dsjrYQ9mgq4hhDrEqU3uKEksZMG3kWM4m2JMh1GA64YCTI1HDmBNjM+qEl4TJRNTHTqQl@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUFpZ64B3sbbEdlwyJ2gCuR11J0F2DEInGbGsJY+qI+UvBz8ev
	cmUD/p5Mdcv1KY5+2eUnUcSSLWN5TmIt8uhGSGt3aKy8/trFjidG2GPs
X-Gm-Gg: AR+sD11f7cUUF/gCnmfae42CmMH2pTYvpK0tab9jDqdwnJo2KQCGoqDG3M7einJjUe9
	1U3SGEehayJ/owIvdsCGPWU3dKpZ2jHt7it4PqlSkYXWUQeXlbNl1pJOeuep+ThC7STIazL3DRG
	12ASucjlonIdJUxjKFGeVAQkIUkIX52F7B/E9nTBYM1TPGJTZUhZr3HWv574I/3el2R3i78HZuM
	PdiZCxXG8gnHAk2T/xtnmExY3wi3p2XYbf46Bzhjy1rpy6DeHL48O/5z+o5IuksmIi2npsy9DGi
	xI6apjk+OoJPVHXMZIWZ73OC21bWzsfmgHR8MzGxq3s9YvJlyvNPboP3Vc4ETPKjmp51IxWAIKX
	cFTkmkekee3U3yzOm9VWt57adoPmYbM3INV+JnKAeReJEnNzYrEIyLbyVwOIfuCnnIviAgX2K/X
	X8/Qs+b/xz9m0qm7gCfdP4+Kth1w==
X-Received: by 2002:a17:902:d4c5:b0:2c9:2ee6:693e with SMTP id d9443c01a7336-2cf34873ddfmr177182215ad.18.1784563828753;
        Mon, 20 Jul 2026 09:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm40185272eec.27.2026.07.20.09.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:10:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:10:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 2/3] docs: watchdog: npcm: Add reset status description
Message-ID: <ebe0fffb-eeb4-4dba-ae8d-7153af6c2fbe@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-3-tmaimon77@gmail.com>
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
In-Reply-To: <20260706144828.3517631-3-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:27PM +0300, Tomer Maimon wrote:
> Add documentation describing how the NPCM watchdog driver reports reset
> causes through bootstatus on NPCM750 and NPCM845 systems.
> 
> Document the reset flag mapping, the watchdog instance mapping for
> WDIOF_CARDRESET, and the NPCM750/NPCM845 latch handling. Also mention
> sysfs bootstatus reporting when watchdog sysfs support is enabled.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied.

Thanks,
Guenter

