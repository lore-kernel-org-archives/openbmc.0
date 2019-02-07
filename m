Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="zHYt7e++"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43w9Qr5YqqzDqMx
 for <openbmc@lists.ozlabs.org>; Thu,  7 Feb 2019 18:48:03 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id f16so708320wmh.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Feb 2019 23:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=NTdGonK744BlVpHfJkByCKbXq8IBZylaPXj5tnPuUxY=;
 b=zHYt7e++rFoBLVbdSTZYUfceoYPP6XWpRAgkGAUAcxf4eGQhHwM6/jg8m0A/jK+pIA
 9TiXqQKfBnCXeNdAP9QEQiwU31k0jetNrd/JCEeuTJ1JB3sBUpfnFv7KyGkn122N3JRt
 tzBr5ZVSTPKVDEXbx4Im4bT0lW0f1Jrt8EnXMJHNJu5St6U3OffipiVmevtY1fjewD/z
 780sB1NIhfILmZt1kpgC6n4iL/jrd5xvsYUhtyAwszKEEb1OZszAR5imAw5kmrXAuw/H
 C+2LyU3hpQUEzA2L9gi3fDXrUi+aSKyIrl85QBZ4AnJoGNlNpod/W/RSdcHQs08oiVxk
 Ob9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=NTdGonK744BlVpHfJkByCKbXq8IBZylaPXj5tnPuUxY=;
 b=ZUgMzOf0iWpVtHxiDFcSMvMFQFaMFOA38CWoEjiD+D7qmFS0NsCVuRAfmpdTF771i6
 8wkohmpbVPQvZIfyoD/dBc3Yj4THgd8Xlz6GO8guCIEDgOTJtZJBs1oD7BtxVA+uUJ3z
 hl6Q1s1DmgMj/aFngL5No/lpIPXsCcvCe0ZP866Ah/7P4MKWwYaJKiPtka47jRKIfiZV
 jN4ttZoZWWeRPdJJGUpRk0JU1knYeC87uvp2YorSfYr368J1Rb0UfAtvzx8CPwfwlNZ8
 pgCfOSxjHgRRVxlcAkmNAmyVV5VaMDpBksCXLvFdFlEHVd65p3X/LX+lVQaZ1U4LM1OK
 DTTw==
X-Gm-Message-State: AHQUAuZzl0B7pvFGdcTr+DKym+6/Nh8Juncy64ZLclNiDqyNkdNk7SL+
 KHPCdYJMLyo5hegAdDjnaWievw==
X-Google-Smtp-Source: AHgI3Ib61/0rKoFEbhN4qPnZvjLR+p9OgAfjOHNnoPy8Yxc/nofF36J3kFM2jFsvlzEWtjucRAeu8w==
X-Received: by 2002:a1c:790c:: with SMTP id l12mr5837602wme.11.1549525680239; 
 Wed, 06 Feb 2019 23:48:00 -0800 (PST)
Received: from dell ([2.27.35.171])
 by smtp.gmail.com with ESMTPSA id r14sm5727736wrr.65.2019.02.06.23.47.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 23:47:59 -0800 (PST)
Date: Thu, 7 Feb 2019 07:47:57 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3] dt-bindings: aspeed-lpc: Make parameter optional
Message-ID: <20190207074757.GA4672@dell>
References: <20190129230538.1044378-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190129230538.1044378-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Thu, 07 Feb 2019 07:48:05 -0000

On Tue, 29 Jan 2019, Vijay Khemka wrote:

> Memory-region and flash phandle is not a required parameter, it is
> optional to describe in device tree and needed only use basis.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
