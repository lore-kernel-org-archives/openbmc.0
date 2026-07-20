Return-Path: <openbmc+bounces-2304-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF50C44515
	for <openbmc@archiver.kernel.org>; Mon, 20 Jul 2026 16:10:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h3lpk4Gz3z2yXj;
	Tue, 21 Jul 2026 02:10:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784563806;
	cv=none; b=SRw2aIsKRDivA/fX5cqnuMz1HNqviHZ9z57pOax3AHIVo1O/yBBFcIM3zGpfBDgoJshF3JKflFF7puf8McByw4GZgokYJ43Rc0c55lveFrn5D5jwbyaz6J5rYNg5TTAfLS112lOHLxB7F/K3Bsplt1+hZ0pD7kyPhymJ9e68v/cuSOTi9JLYcUmAb0XFvTm7SuGAHME0WANcyAo4LMAcEwyWjtKxNmUPSLdIL9S580zbAo2zyrELg+NdsrVvbtQz/jwSEM37hv79iKIyKLuhJfXRulCwcqt0J4W55kv4wj03AVRj6o/+Neioc9qrw9RnSkYnvdgncYm2HjH9HiK5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784563806; c=relaxed/relaxed;
	bh=p84L8EQrf1/Bk8g06gBQbk74BG6TjMtTjLqNj/+ZjME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvBpxlCNXW2pa3Ipt5rUDuSxmEF9JTATeCk9TwFDs/SrN4FRoxj+U7o9kbjOEo0gH03vD2zPnz8cDXVgg+WKvzdhftNZ60/FVHD5EPTJiXXWUdIe5pz7jH+LtOCMDMCsjvE/2n+tAYbVWzQ44adlDmvA35oh1pwMaBOFf7inWQhU4SMruMzOf43JnQx92I6njz0kBQFN/LoQT2SFIYZIlgANNTNfcqX0uX+wh7kPSVl3o0e+/C76Aelsm+pCDI1x2fpakBLuKyC1Q7Fgzfo++02jXlTPZgOOSPtwOnpfgWW2AxR7b4zuPHTBX11j6A2LBqNrTrS58iDPC7Uvr41JDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XHNw/Poq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XHNw/Poq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h3lph3sD9z2xqJ
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2026 02:10:03 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso116416265ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2026 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563801; x=1785168601; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p84L8EQrf1/Bk8g06gBQbk74BG6TjMtTjLqNj/+ZjME=;
        b=XHNw/Poq5RPAEMvgdZXWISVHduvo8lqBVFO02f1R7FkEijyxtDvZFGz/zAxFfwTgTj
         7Sm9ToGWG9dhyLUiEaSgv/rXejdvw74QWO0Q30L2bLGafPsFzvLxiZNusyF7ji6a64WG
         x0WwicUTbtlSXy+pKNk00BaRDy4UfCCPHfYk08Lpj1tMn1NNna3AHiUutfvKoFR3ambi
         C79UBoGsATvEzWkwLNlchanh0D3qCPx2JzCBn2re/iytyVlDAg1IZAG53kn9oNJUBNIn
         pBCEJLwJ3FyODt+GjXP4YPhVYvyzpJzNlRc5HrJrFuaEXzG8b48wlGFPDUxQ0jrhDhAZ
         EaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563801; x=1785168601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p84L8EQrf1/Bk8g06gBQbk74BG6TjMtTjLqNj/+ZjME=;
        b=sAxhIOwPAbENXvk1xhfHpRxMGf3FJEIPZq/Vh2lKVSltkUiBRV/LT0wlLR62MWUMbY
         hokiPtR4Vg+XDTZc73niO9ccT7mk6APT9SSI2UyVIutY3NQ6A1e1bNsqn983w6l184Cw
         hZj/W+e6sqVwJkWBmrRvlJQQd6SgyT2/8Sh1RpSMXL4EnhEChwNeqfC1/Ra57K81DflO
         2yDnriQF2mMBxPdFUH7fAON89+tIBWsA+bJH6tSS2W9EcP/vR2xjhLUNis7fmCey3vHt
         4XxTnaC4A+0H1BWD4xQS6E24rMMiP1wQNYn+nk2th14ZUmVH8A7X8AvDZPZaUbpuifP1
         2Czg==
X-Forwarded-Encrypted: i=1; AHgh+RpCkRhEH1NwuTzghoe9CyQwo8mELLmWVbKz8pvemV+JJVBcrZtOvlaC2MSbaDuV+YXq5s/o4Hml@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCrFZDJzuyhJ4HwRsjLcsHb/eMOImLHnKaoEGtRA2d42zbKLvJ
	pntgUUweCH514kvdGwMPa7CRebynzRiNG9TSSsjRH8Uk1TTYWw65MoDq
X-Gm-Gg: AR+sD13DIrUqSICO6D/n6IjR4GNAg2+meXV9Dx3lWcZpY05bXKeFl3672K6eNUEZWPI
	Fu4zT171Uat06p4WXbNrcbnjvjlx3PIQdA1lnLvm2ZOjQGcsnO5ZJh+ok1yLpmJIyrFcLVNiSsB
	3wegDMnQY6QPWWLyKMipXFw66fEM4IGb15K5nQN49h8qOd6WSfa/dKwB5IN3Dm+27q62K8YjflY
	aEdCwx2X94AJeBS/6MifwmPAXUCgg/RwE05knbBDFO5Cw5z0heHJcio//U8BsKDUY5pQwQjoPT0
	9KEgA+/H58uPwflbEfc9FGNMAwTjxfFKmdmUXD5KWcwLTPQGBZRVB3TR8E9g7eg0jP/vWj7KBkL
	L4KZB2xiFK0vtiLpIFED/MErpfH+lbMPzkBlwNs1/dnN72JWk9HJhzTB7fkzEoguEk4+Eo8tsmV
	Lp6p+YLCtOXLbWbUw=
X-Received: by 2002:a17:902:f786:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2cf3495ffccmr169921345ad.23.1784563800862;
        Mon, 20 Jul 2026 09:10:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm45256293eec.5.2026.07.20.09.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:10:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:09:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <d79b16b6-9179-4b88-b401-66a177774c00@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-2-tmaimon77@gmail.com>
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
In-Reply-To: <20260706144828.3517631-2-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:26PM +0300, Tomer Maimon wrote:
> NPCM750 and NPCM845 latch watchdog reset indications in the SoC
> GCR block rather than in the watchdog block itself.
> 
> Add the optional nuvoton,sysgcr phandle so watchdog nodes can
> reference the shared GCR reset-status registers that hold those
> latched watchdog reset indications.
> 
> This is needed by the following reset-status support, which reads
> those latches and reports watchdog-caused resets through bootstatus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

