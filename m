Return-Path: <openbmc+bounces-1926-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0A9CD37AC
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 19:11:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGg0x2WK6z2yFC;
	Fri, 15 May 2026 05:11:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::122f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778785889;
	cv=none; b=ktAWTB8AiVA/y4yNq2VAkEgY3uohsVjkactKJ3Tswov6ecwTax1ofadPA3bRdFeDJhkoXrUeEN9GhyKT4fAjwPX14Vn4eiPRycgudNIYry3Y5rrASAijDEq6mkCrSf4/tuynSj8Cwgoi8h5X+nHNi0t4Q3SxzarsRzmaIjlStyyv8Ncbk9BztGoSJHiIskS66TN6xzqNaCpZ5xNaKWzyfSnmixZnGwANWxIiCr+M+FA6ypp/jJeFr0M/6TOiiTGPeUehHlMTmGQlO1pYYE5U8bEEMArf1qjTo+D9hV9MyqFmIH2OVYTr09kbao7qEqObTdynfqmFAd7iDTLhw5KpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778785889; c=relaxed/relaxed;
	bh=DGh+W8WeWhjkK0v/Jdzaau+CwygzC6Gz22VTaTZ1Nfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwnrQTpOdEmY5lbVkCMiUbSp7Cyt5BfNFqVEFDMIbBD9/OxT1EB2aoc3phgV2f0b7M2CXXmAHyGjCi1ZmF1ZruJ9ffavN7VLKr0G3CJJT4j+KFHqSmhPPGpde5QUgsdS0xu9zT+/ntLayshGL4fSoSRxGi1BDSreR6chDnOa78FF/qpMo/qNUyq339A6FtnVVRGawiDxEvF7cEq0VoBumn3RU7RgmFE2W+qXcmORaA+JGV6PQc5L76FjxfA5Ei1O+I1w3VPo2D1zTzcWTBgtUofwwdEDFITfp5PLKgR6EmvnXNPIXQKnL1tDGEDWBFR8/D72gNcqyxII46lI5DItzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gTWM2ysi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gTWM2ysi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122f.google.com (mail-dl1-x122f.google.com [IPv6:2607:f8b0:4864:20::122f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGg0v00b9z2xy8
	for <openbmc@lists.ozlabs.org>; Fri, 15 May 2026 05:11:25 +1000 (AEST)
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1329fc4bf77so101689c88.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778785883; x=1779390683; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGh+W8WeWhjkK0v/Jdzaau+CwygzC6Gz22VTaTZ1Nfw=;
        b=gTWM2ysi7n2jPqsEVWZjm87cIVHf2zabOQHFGVYTFOYO2z3D41WSfsrxZo8bmt+9Nu
         by/rF8Pjpw7b9ZmtK+5UgBk/JTKLj1KiaCVO8hPPSSfqPWzAn1RARm4OL7ssWvSYPHPd
         Tl5smlEoQWvnzd2wQLA5oqDHwuOt7YiiQF7txTOf6awpMTqFwDBhbcGaOLMWFRDWHRuP
         dIFSct/i3AdHiWMo0q/9oyZ9ggos7Bt7aeJnTHgnnxAscPCS3xBMUel8ZYCXeIzSXiHt
         ovlq7CjgV+XVoAQJFIjfG3RMPE6yHXYj/9CcUGpf+g/D010YhXmrb1NuUk9HhaiJ3vK3
         8rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778785883; x=1779390683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DGh+W8WeWhjkK0v/Jdzaau+CwygzC6Gz22VTaTZ1Nfw=;
        b=b3OkyivEvacBDK7XMYRn7gWy30TfZcgXxVykFUb8sG4ZvS8cW0cXJhouN9N/Obc93t
         MvSNkpfUZ9MZikSyUVc8RxSP1sLnYkkXTwupXqAiCjqWDEEbF9nIwv8GsB9cVsw4gfBs
         2SC4CGWKdsD7uI94wChNiK+GvVJAYDTYuqMTF/BQFzuA79TUJwq3r2lms1/2UoQPfcmO
         zTDJM6MK1pfTK/M4GkKzVAo2IGkmwERiQr7ZOFpW07O3xCIVFRE/AkUEvo8Q70Uou4/C
         f9dM6DNMq8ZlfJiTQ8Nf+FNNbfhCGVgMKO0fgyc3fdiI6ud/Z/rOpv8GxU8E8W/0pclC
         ijow==
X-Gm-Message-State: AOJu0Yxyq9TBKNpjnG6Ajxa70HeWvsqHt5XoT4eLC1mUMfvVOR0rawVt
	PmGoBAfbKJiw8GS2MLcPzJdqFTuD4iZUgeJh1lzEQIE4qAgkOImLydao
X-Gm-Gg: Acq92OHoyxcaVhdCWH/NMHR9frPNmWRcXyYQF1N66oy56KrJpjMyiRIb38MsqrI5WJz
	B07T+N1sE/671FHnbID56jY91rU7e5PTHPW5thEoMsaMPcvtitcuLAxpEwrjxWaK+8vk+6EjWB5
	hyj1dZlUrqNqnKIgOb/LxngyLgr0NaWq0SDsIgfHjunTikYzLIY2HfeB+VLI23il/+R9Fuiwtxs
	zB/+Xxmtp/y/oitNn3MKV8LDbO26VmpZtwfHBB2R7rT79ySm24UasmXqdAL37sFsXNWdapaKFc3
	n2yPewEDK7kJsYGDyCf2l0aWi0/aazBG3O60SCgIWqatQtGnCPd3aO7Ed6C0Eb6ypJTrNilZuQ7
	DSTsoXvzlt/isbXuOkKkNwXZlYJ8BWyaTZp/JmQjnZF9HEIb0FdL+MSGieGSdkow0Czp1ptSJsU
	DYbjknxfCCg2OWBlMbzhEqSacKrKw+Xdo+TB67I6NZpjGNkk8=
X-Received: by 2002:a05:7301:2f85:b0:2ea:ed7c:912f with SMTP id 5a478bee46e88-303986a1430mr415042eec.27.1778785882944;
        Thu, 14 May 2026 12:11:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm4051269eec.12.2026.05.14.12.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:11:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 12:11:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: u8813345@gmail.com
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	Colin Huang <colin.huang2@amd.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH linux dev-6.6 0/3] add support for Delta E50SN12051
Message-ID: <7a3f097f-79cf-4bcd-bf6a-afa37ab5da9d@roeck-us.net>
References: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
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
In-Reply-To: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>

On Thu, May 14, 2026 at 06:49:40PM +0800, Colin Huang via B4 Relay wrote:
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Why are you sending this to me ?

Guenter

> ---
> Colin Huang (3):
>       dt-bindings: trivial-devices: Add Delta E50SN12051
>       Documentation/hwmon: add Delta E50SN12051 documentation
>       hwmon: (pmbus) add support for Delta E50SN12051
> 
>  .../devicetree/bindings/trivial-devices.yaml       |  2 +
>  Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++++++++
>  Documentation/hwmon/index.rst                      |  1 +
>  drivers/hwmon/pmbus/Kconfig                        |  9 +++
>  drivers/hwmon/pmbus/Makefile                       |  1 +
>  drivers/hwmon/pmbus/e50sn12051.c                   | 52 ++++++++++++++
>  6 files changed, 146 insertions(+)
> ---
> base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062
> change-id: 20260514-backport-dev-6-6-e50sn12051-driver-1a55edcc33b6
> 
> Best regards,
> -- 
> Colin Huang <u8813345@gmail.com>
> 
> 

