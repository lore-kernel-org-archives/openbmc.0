Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61907606A327
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjcIfigc
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jJ4k56mvCz2yTQ;
	Mon, 02 Nov 2026 19:34:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793608445;
	cv=none; b=oKvcqbAmUWO9N6ngj0PLF0vSwwnW98p9KGCdKJLrIYVDBgusZ2a8evgzv/uW6Jb/Pkj8oDUozsq4FkonjjKXqlTXeJ3CD2w1AkkQyMr8LCYTDcp1+2YCDOBNuJoDIbTqh5v5IDpuo//1vHTt64ydrJ9qPTuiTHYWg8rN6priP6GNSP9UKO+lkcSSv/8krGOYGBdrSO8f7osQs8HmALJmgCxU1eTcKL0KHR5rWVjb8NvY8IYUYzEsQSEOyCCgE8fMo1cwuiM+hYjM2koOiNSTYcKD4IjyBQqMsGmlHw44Csy8ZUg4P06K0uX+Xbwpt8WSiY+QCqYdyOF0PKZCCg8org==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793608445; c=relaxed/relaxed;
	bh=D5JSFMSkR1MEaF+FBIxO4X1YjnGz0AsOwlhitWTx58w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAU2zpFWgJq8cc2HfwpfFGcnrKnjXs78by9id/0NyrtXvLJLTonAxbYhNir2DDDuG+pIxUZdfWg0D5EZQPY2mzv+mpM5mig5fdpacH9tnCcd8c77peQoGs+h9SWAlvKtczSjheWNo4qq9vDE+XXKX5cA1sdBIo5mTlqdr4nca00C4Kauu91BUfC4v/UpEcPqyRI+Xjsxh8MkUmVS6CfTqvdK8p4yDgPaZMUJXom68uio5zc7R/L9uCxnmdHyW4JppPsenE3JftpOnpxF3g6ftmyFJRWFxj9tzg73wXt2WBXo3mko16S/IvtEGkYFLCPvBJOh4jVeWuXSW7SuYNl8xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjcIfigc; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjcIfigc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jJ4k42YSCz2y2T
	for <openbmc@lists.ozlabs.org>; Mon, 02 Nov 2026 19:34:04 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA15360EDF;
	Mon,  2 Nov 2026 08:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD72B1F000C1;
	Mon,  2 Nov 2026 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608440;
	bh=D5JSFMSkR1MEaF+FBIxO4X1YjnGz0AsOwlhitWTx58w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YjcIfigcEay+9mD67vEIw4WuUOPv1d8o2geaAAw3ij6AdOdTKKnFQpYCaUtTcnrZL
	 9BP2uKodggt8ac7X2qSavE8OaTOhAJFsxNC8sW3X45OL6vcpNMyxkvoJQqb1G5xzmL
	 elR9MYPpUUyCiC/r1kLdnSuvjW4aqrGkV/ldoCoY81j8iWVfFiCXEFzUIqYYMKuOYt
	 GACW4TQSWR69smxs8VGJv0FQCDAr0o3t/jKhBbPYjzcsRkvwMAArHPkomnaSAbk68g
	 grsLk0e64iiD883qVyJUdpkWfBn7v6r42BNmTiucvlMxq7tyM0AOeoebVw8uI3pyMf
	 D4yV2bu+mEzNw==
Date: Mon, 2 Nov 2026 09:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Message-ID: <20261102-little-bee-of-shopping-aff1a4@quoll>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 01:10:09AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the USB device controller integrated into
> the Axiado AX3000 and AX3005 SoCs.
> 
> The controller is based on a Corigine USB 3.1 IP core that is
> dual-role capable (device and host), used here in device role. It
> provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
> supports control, bulk, interrupt, and isochronous transfer types
> across multiple configurable endpoints.
> 
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 77 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


