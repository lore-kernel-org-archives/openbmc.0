Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0758FCD98E4
	for <openbmc@archiver.kernel.org>; Wed, 11 Oct 2023 01:52:38 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AHp2CgcQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4wkr4gqTz3vYl
	for <openbmc@archiver.kernel.org>; Wed, 11 Oct 2023 12:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AHp2CgcQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wjR5l5Bz3vYJ;
	Wed, 11 Oct 2023 12:51:23 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso1067774166b.0;
        Tue, 10 Oct 2023 18:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696989081; x=1697593881; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvEek/wu0ornX7TSQqFw+K8z0hBkSwQuqkpR0z0uE5k=;
        b=AHp2CgcQaRXNLRIZ+cQIDTk33mCo0tlNDXbLz9qVpfrWDlS+AW6YLYix4lVYaJ+p0B
         4HDxvZVmWIijpAVcvij4vCmkC1Qs4DEbyCTppXp7AjjSAFhgnbFIYkL4atmnIBXj2teN
         BzNP//Iz/vDt14/Z7VODiL2FFqk/JLpbwb1Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696989081; x=1697593881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvEek/wu0ornX7TSQqFw+K8z0hBkSwQuqkpR0z0uE5k=;
        b=uZXJ9ltuXF3jiOBvK/EamnrBpG4gZKx9AuheYBbVaLYrSi5y0M6yO5A4knxYTfCkXH
         6KFXcX5niSvSNSPZSrx6dyxw+8mxXWmHkAwMvPpb5jv2WjbXhNAd4hPe3bTwCm+xVh4z
         TsN4Hd/Om1ugaHNr16V0Ditr3vcyFvBU/iecJjXFe6AMDo/aDaSD/Jz+X5Iq2D1A8xi2
         7kbQPYRqlfgRIJLH9JuW7BKqsMan/calLqdyo8t/Z4bk1D7Q32Nv4zYmUjc8iLRS9NnF
         WKbCaYPquvkW3MbJG1qY4GnKoRhwGjzY1Mr8K2pbMBb8V8nyneEMQlkfw2/NXFChMRFB
         EkMw==
X-Gm-Message-State: AOJu0YwJLWr3JuMs2W5Tbst2LnxJpg0iqyyK9DstTtrWcO9w0rJrrS0v
	WW7h0mO8qvzFe+lsNGfhSOcdtnnSfXjEMVE9ODs=
X-Google-Smtp-Source: AGHT+IEJHgu6jOvC4sfayzAJpsh/xcXdz7gNPlaBSSuCWsWCemoWp8C2Kriej5Qo+yGFOjuOzBt2CEssbvsu5fd04Ok=
X-Received: by 2002:a17:907:762d:b0:9ba:4163:1807 with SMTP id
 jy13-20020a170907762d00b009ba41631807mr1896364ejc.2.1696989080445; Tue, 10
 Oct 2023 18:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com> <20231005035525.19036-6-chanh@os.amperecomputing.com>
In-Reply-To: <20231005035525.19036-6-chanh@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:21:09 +1030
Message-ID: <CACPK8Xcs_4G0nSeKm2+hjSrp=SBb1MJrCob+EQ1emfVOijSOjw@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>
> Add the inlet temperature at address 0x48, which is connected
> via BMC I2C8.
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> index 88693c2b2dbe..c676172f0dbf 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> @@ -510,6 +510,11 @@
>  &i2c8 {
>         status = "okay";
>
> +       temperature-sensor@48 {
> +               compatible = "ti,tmp112";
> +               reg = <0x48>;
> +       };
> +
>         gpio@77 {
>                 compatible = "nxp,pca9539";
>                 reg = <0x77>;
> --
> 2.17.1
>
