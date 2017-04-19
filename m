Return-Path: <sjg@google.com>
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com
 [IPv6:2607:f8b0:400c:c08::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vp6XrlzDq9d
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="umpdpFux"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="nLbGPRJU";
 dkim-atps=neutral
Received: by mail-ua0-x231.google.com with SMTP id f10so5198871uaa.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ny9cIdLQMYWz/Dp+dMk/C/iyDHQtJbjkeaXMCg+O6kY=;
 b=umpdpFuxeFg/oSzBtTKgTkX5GcsF3E0fAe1v1WLbLS93DYa84v6cXgWLPAdBe1w5UP
 CfPfxo5yiSTOybUTCqR7eXOU4Nu4QdhTCU9r0JG81qzWOfnMoK5zGcrd3ChMgfjnXkhp
 +sRsm6z6DcR49W8poWLyjc8Px0vINDYfBVIz93Uy1D1+LdM7SbS6sbXr9i3UyJ8HPdNu
 17tTBNWSZzS3jaD3PQ6XIOusmX7xrahem7DT/C4yjnmKGv6eZbMUcvBetJ9odBLJUzym
 WFw1pxX9AP9A41owUBI+LCm+csoM4G0fLyiyWqltTnFHJeF9rIAZnz0VdCBdwNcTSAn6
 kh9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ny9cIdLQMYWz/Dp+dMk/C/iyDHQtJbjkeaXMCg+O6kY=;
 b=nLbGPRJUaREfa1a3xDrZ5Uk7uOJjNDRZmQPeEICkPHVkdtWA+NJgkr/KsoVLqXP+xg
 o9TsWD81HWWJoSMVPP90KuNMtgHkmIxqTtEG0qs81VF9BIGxamlFo3F+MoY/oyCz5QNo
 jXRSmXm2EnECyhgfu3t7otmCN5fsylm5HnRbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ny9cIdLQMYWz/Dp+dMk/C/iyDHQtJbjkeaXMCg+O6kY=;
 b=dGUv4S+cJvPPGDGhh5P/pQPHR+Dw/eGD+sHIWhf1TdmE3Ud7uLXaLuBdDu6Ym3vxRe
 TNtgjE78+T886FumS2GnFqCEX1ouVyRRu/wiS+THowLf8NXmiJUqY+nkDDGOOd/9Sd2H
 wVy8oy00HY9npMbXPzQbelJmTUa3mcbJYtA9+bwtv0GwygLXv8RlEJu5vR3nSzdNJY8x
 yUgzibs2m2iZf4xmsFvvMdEbSKfdFVPUJ8mCWGM9YWt8ObDLcCd/W+4ZbA3Mc0I0/s1E
 CWl25XNF8kdgUTNbFE9UgogiLLN8xyPQifCBzlc7t16agl2pXNGFrukBNx0wFaZPChUj
 JkHQ==
X-Gm-Message-State: AN3rC/4pnBz0AmFoRFwqgwqRL+bM8AiuQLT277Uc+ndtewogqzL1HLHS
 VoNk1Mg6/x/taSXDl6wEHmuV5DJpWsn3
X-Received: by 10.176.66.132 with SMTP id j4mr40877uaj.103.1492560720478; Tue,
 18 Apr 2017 17:12:00 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:40 -0700 (PDT)
In-Reply-To: <20170417190034.71945-7-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-7-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:40 -0600
X-Google-Sender-Auth: rOkyoIuanatEXRJTzK4k5WAyixc
Message-ID: <CAPnjgZ2KeyBz+6g2rnEhEC5SDjXHwRkV+dKkgP9cAMkZSBpOGw@mail.gmail.com>
Subject: Re: [PATCH v1 06/15] aspeed: Device Tree configuration for Reset
 Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Apr 2017 00:12:03 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Add Reset Driver configuration to ast2500 SoC Device Tree and bindings
> for various reset signals
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/dts/ast2500-evb.dts              | 15 +++++++++++
>  arch/arm/dts/ast2500-u-boot.dtsi          | 10 +++++++
>  include/dt-bindings/reset/ast2500-reset.h | 45 +++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 include/dt-bindings/reset/ast2500-reset.h

Reviewed-by: Simon Glass <sjg@chromium.org>
