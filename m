Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n6Btn5uW"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytMwB06sRzDrYf
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 17:32:25 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id c140so3935601lfg.7
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 22:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=b8J+1OtDRtq5rtFVzojrYJcAZpvIcEFL7f9L6iyhWYs=;
 b=n6Btn5uW1B/Nvcu1jBFNuNDnj/MurFdHeZMsujZF30pUo3DZIb9vUEAl/NJUTqHB8V
 HTFEz6kUsGSDcEw2eUqUmSoJY1al06j20vdl2ZM6dIbMlrGcEf99Ie75i3Jt0fsoVGr7
 3NLXz7+pKbmGRzhWtc1TevWaMBQeeslO8SGM45atyL/Bhm+8ismfBqnBiEHFiwF4oHUz
 mIsugwaTRJhd+aq55zuiuTVWnLfeLqkVY3tlyDPxm6PiGCXtrUShAiy7EC7sfR066xa4
 UF0g3pAWs6FakP6wuUdXYTRHKzA3Gv0NbopUF0b2gujG45OGqpFMOCNArptp+/VkDkED
 uC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=b8J+1OtDRtq5rtFVzojrYJcAZpvIcEFL7f9L6iyhWYs=;
 b=ETfBxALj7/JjAeUyWa8d6mnVFN6IPD5nivUqpc4sWDwBvycrL4AlTPNEqltHo2hg9H
 FqNebEg7rgvjreCU40mx5pBKPQwayH7FnTEDYf/eqkm3uiLPLVXcXiZ4tNgB65nOuTDM
 PQsam+YvXFxo1ZZXOW5XXe0DJzJRJQKPpYxMJs2sHqI2QldfnaeuJE7noXr0mHIXF8dK
 yEzheK+DtthlKTknXA/h+BgxOd6aPexh/l4SwjvJKdADEN68xYxdJ0EJqec2RIsIrf7g
 afU/PlqPH+G/lDmfF+z5+6VmmP5wm/0m/zN3yX+zGejbttXDFk5YA4pgWMoqlLSN4P4B
 SrRA==
X-Gm-Message-State: AKGB3mK5+N2aUEjNrBB9tA8Qv+kpuz5l3wgEsg8WcRxSfyQ6YzCvhd2o
 HhxNOUM6HRS/TMTuKznun7b1bTYnOtrlR+EnPQpQMmeD
X-Google-Smtp-Source: AGs4zMZNNVFMKvNqxRHUcEag+7WIfQ0cBTJmWC5QF3lHAIV+fZc+QQhNZZHZ2jFRlBXprBxiATauJJxVwXcFMyxW5j8=
X-Received: by 10.25.162.72 with SMTP id l69mr10444002lfe.45.1512714742934;
 Thu, 07 Dec 2017 22:32:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 22:32:02 -0800 (PST)
In-Reply-To: <20171127201333.189812-1-venture@google.com>
References: <20171127201333.189812-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 17:02:02 +1030
X-Google-Sender-Auth: KzHwCVGE4FcG4VhF_xD6yPTu39U
Message-ID: <CACPK8Xd8zoXjtw6mfwUsyoyZEamqEpPSHu-UkLvQD2s03L4nEw@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: quanta: add i2cmux for frus
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 06:32:27 -0000

On Tue, Nov 28, 2017 at 6:43 AM, Patrick Venture <venture@google.com> wrote:
> The memory riser frus on the board are controlled
> by a gpio mux.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 93 +++++++++++++++++++++-------
>  1 file changed, 69 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 42b1d8007316..b93b29191960 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -119,6 +119,75 @@
>                         <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
>                         <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>;
>         };
> +
> +       i2cmux@1 {

When you stick a unit name on a node, it is supposed to have a
matching reg property. We don't have a reg property here, so we
shouldn't have the number. This matches what the i2c-mux-gpio bindings
describe.

I dropped the '@1' for you when applying. It's in dev-4.10 now.

Cheers,

Joel

> +               compatible = "i2c-mux-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
