Return-Path: <openbmc+bounces-2332-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F8C55164
	for <openbmc@archiver.kernel.org>; Thu, 30 Jul 2026 08:12:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h9hl10sdlz2yjs;
	Thu, 30 Jul 2026 18:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785399148;
	cv=none; b=CBayY2VkTZtJOr4NUqD2z9Y798yqZbahL+4z4ZrvnAEA6g5rJRKwISiPCnr/ZhucJG11WX/dNpO7N3OJQDj3LH+LeSG7zm62Mo66ZLxsv14j6aK9+jbZ6Fhl5Ig5lQnYOonYDJn4AbtOvnG7KcHqnu4kgVNOrUodEXdhXIehh78AIHJff+/SXattjrMkYbznpaH/AVGwC451Qou0lg7bb6qFimIkRW8jr00c1Vus84wnbyvrE7ocbZE3x9Vsxgc5DHsHU5y8lQKXTI+BR/0xn4oW+jBrEYliQdk/iW4U/zE3UaoUtFv1drO5pSaYscP6PlttwSCX4X06rYZWL6Djyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785399148; c=relaxed/relaxed;
	bh=Ge1PBz0wXpq4aPLUUpnd6MnL97CGxs/2RXf5mdX8sik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbSXCKpzqe/a0MPP1LKvVyeyEXf2sFpXTcc2mpbBQ8Jd/YbOMjL1IirCxqZipupqohzMwWKZvK7I2KA1obm7r+YVoqBwUgJ8aWOyQm/QFtIIDwM5x1aVACgVyqNfWzsKITKe0cnkrC3nGF4sQl3eSgnGg/f5Mpj/ilsJ47YRTeHI/dJSihLIvJmspL2Rn8UXy4WKXDtc+1t3HbKIPAv7VNmRLD3PsMZ1fJl5+jk2WJyTqCfkJRm++4zPx3VM/a1MKVBhK31d6bIqR/powf1e6TT+aUEc4LG77rNHbfdGE6A+bIcUg8ySs/m4T1mZfjl7hJK8GtGLRs1mSHl7nDj3kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bf22bg1W; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bf22bg1W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9hkz5G8yz2yYd
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 18:12:27 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DE3343D51;
	Thu, 30 Jul 2026 08:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA0A1F000E9;
	Thu, 30 Jul 2026 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399144;
	bh=Ge1PBz0wXpq4aPLUUpnd6MnL97CGxs/2RXf5mdX8sik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Bf22bg1WxcNv74or8Qqu2EsIqc6NWP2BzKojekkPFJmBq9H6D5eu/vkOywoBlTthA
	 ycqE6SwvumTx9t5Y4/2QsaX4i2DwVy2H5xxXsdYquPO/Q+XJgdI8YhHzYNOcz+MaPs
	 jMPnpGrYEWMTy/IE3DZiqTDvqWwLqtwoaOHQEE6o3iyx7pPBEepc0eaf6MNedxYMbO
	 hX2T8TanvUN2Unlu+Bp5C9RAKKL0LYnoSHzrBeqGl/lIOxC7c7WNRlXrYiH6S0UcHg
	 jbUm3jlCnp0/C2quaqNsklp7pEMvOABsjyqcKW3efwORCI6PTlijq6TiDsO2EgEW3e
	 Rv1AyXw2QmrOQ==
Message-ID: <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
Date: Thu, 30 Jul 2026 10:12:17 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
To: Tzu-Hao Wei <twei@axiado.com>, Shubhangini G <shubhangini@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2026 09:26, Tzu-Hao Wei wrote:
> Add a Device Tree binding for the Axiado AX3000 and AX3005 video
> capture path. There is no local register interface to describe: frames
> arrive asynchronously into a reserved memory region written by the
> host's display engine over PCIe, and this node only identifies that
> region.
> 
> memory-region accepts an optional second entry for a host-written
> control mailbox, letting the driver detect the mode the host is
> actually driving instead of only echoing back the configured capture
> format.
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  .../bindings/media/axiado,ax3000-video.yaml        | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c6d8d1843aac9f42869ff90a550b92d0bed7c16f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/axiado,ax3000-video.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axiado AX3000 Video Controller
> +
> +maintainers:
> +  - Shubhangini G <shubhangini@axiado.com>
> +  - Tzu-Hao Wei <twei@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description:
> +  Axiado AX3000 video capture controller. Reads frames written by the
> +  display engine into a shared reserved memory region and exposes them
> +  as a V4L2 capture device.

This is really incomplete. You need at least way to power things on,
reset them, provide clocks, sensors, data paths. Or at the very minimal:
START capturing the frames after configuring the resolution.

It seems you described driver or just a piece of entire video pipeline.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: axiado,ax3000-video
> +      - items:
> +          - const: axiado,ax3005-video
> +          - const: axiado,ax3000-video
> +
> +  memory-region:
> +    minItems: 1
> +    items:
> +      - description: video frame buffer, shared with the display engine
> +      - description: optional control mailbox, shared with the host

Why is it optional?

Best regards,
Krzysztof

