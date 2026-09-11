Return-Path: <openbmc+bounces-2581-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C2CC88E45
	for <openbmc@archiver.kernel.org>; Fri, 11 Sep 2026 07:03:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hh59C5DPyz2ypW;
	Fri, 11 Sep 2026 17:03:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789110191;
	cv=none; b=WTchoGp/0Bkpj03TOBhT6LACxkWOqOqLW5CgOb4V+Q3AG5WJALeUht8GSVHGlFVG3xV43dNaHAprlqSvynw+0oANh5vt9K9Dq4SkysQndMKFUilyjMuVLfmdgNdOXRgmbcxw1RDAcdySAXFtrnXlCauqSUHH7rin9a693yyX0I+51g7L4FC7K1l9Eu5I8aBMNLZGOCDI1PwQ7mF9B1kshgfWsyZavXMRHBI0OjWQop3H/9hxgiS15VjzbwKYP4riic6B1I8RRgo15DqKMo7S4KdSmYaBwpMnKrgLkJ2jcZtbqTKDLdAVF+irhpxrkGbnp5Jb+0w+xdB90f+QBMVLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789110191; c=relaxed/relaxed;
	bh=fLOv9PqRHm0Dp6AEU3FrEQYqlkc9d2Rysj5SU5cG6RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kphvx1I/5XkCa5j53MvbgfXL5Y2/w9Qj7UY+vjwaG4Dvqyj1aqXq7ThYm3SQq/NdKLQ7F2poniEC1yRsYNR5IaCKW0WF+7iqpaxSj8963xYFDXXRjO04rlDpEhCj/OO0zAIBf4x4UDWP+NZQYNZdsL+a7TfZXiL3wCdY8HsZhkYUPWzLblpkKLiYG//qrnAQVMGxTPkajEgJhwR70IMTNfBPz6ydBlYTqZpEpU5gMVWY8Ut85E9jy1XW+As1Ws8aNeXraTSMUelHw3e5cfg3sEn7XajIJKvccvgLrnELFbt5lwpe71OILdTOU7SATpfB+3QPwSe2v3Pe8N5etcNDVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gg0J95fH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gg0J95fH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hh59B2rpCz2yd7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2026 17:03:10 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0A9841399;
	Fri, 11 Sep 2026 07:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3421F000FF;
	Fri, 11 Sep 2026 07:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789110187;
	bh=fLOv9PqRHm0Dp6AEU3FrEQYqlkc9d2Rysj5SU5cG6RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gg0J95fHymQW9M8DoQvwqtACHc8nmHNl3IQWWBWUFvaP/N3OpVH0jrAGtc44djAkT
	 3+G3/D5vLC4wPjCNtA0WMtNa/MO2TkPe+ebtT0UBqnDRZIkTsEYY1dAJmZPRs98rUD
	 MTp1DoYUVl4Xyk70tm07cBt9bKGNME+RcofIzO0pHken0ud47IeATdooHTXZXjsNX+
	 6/K92K/LJCRnlHk5J3CkxuKAOYAfuojyK1U4E7MqSpT85p7Z5gLNfE5K07Vcov9cEX
	 5Unv0Z/nW7hykBvwro5/waAjxNj8kmwAmp9xKsZUeK9e5HOSQzr27Q2OGR3euIz1ut
	 laaSeYJmaKqFA==
Date: Fri, 11 Sep 2026 09:03:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Message-ID: <20260911-melodic-naughty-kestrel-efc72e@quoll>
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
 <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>
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
In-Reply-To: <20260903-axiado-ax3000-pwm-fan-v2-1-ef43df46163e@axiado.com>

On Thu, Sep 03, 2026 at 01:38:39AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      | 72 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 80 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


