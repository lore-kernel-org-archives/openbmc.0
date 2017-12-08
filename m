Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b/9dzPfl"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytMpp5Yf6zDqlG
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 17:27:46 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id e137so10761593lfg.5
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 22:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vjmLwfRQi6gH1DJwjZCihArzJJV4G1SXKtKra6280jU=;
 b=b/9dzPfl25TZZtc1QXfiaNJ4f9oGkqdhPF8G4g7jL4LUvRMAz+PzgL34P/899EM3kL
 nIjpRa0ysDvBMjAolEhpvsxxZ/86NrJUjNxtohF2f0H5sMLQbFLkaYzfjkwXw8FqlIPv
 kje7fkWj4/YI63szubORWq2plwGguuJkU0XCwzUwY92pFcT8F3xxRucThSO9mlUxgsjS
 Hakb4is1I4yuExd3jUf8eSF65I/AYKlTOe4Yh6ivWinv/FKlc7d3TVwIQ/c/2qkJxX3k
 6ZAGfYY7+enm0JKYNWAgVjOetI2cM46ORbYG+xfYFwmpfi0q1CYqxnGEml1oXnbvHvpZ
 GmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vjmLwfRQi6gH1DJwjZCihArzJJV4G1SXKtKra6280jU=;
 b=i412Ibc5FHEHwtiYV8LBbJCBKwNdVx9jX7UNbvU7Qz5NOTSeSQ5+ej+I4EDOgHEgQ7
 iheQUU8Ov1pSMxAiMRaIpmStq8FYnZzl8B0XHATjOiul265nmsW7ibHFlwD8dbegWcJF
 xGQNn8yxbLs1lhlMOc1fqepFbvBBoJWDX06NfsDxI4YCSnjvzLbOYYGehFDWh2O///9w
 k4ynTqUmmikZfzaUNRMc1o6UCZ/QJrpYdjoY4iPtltBuektcfHOcwylY3D/8+vzolX8Q
 +Lk//zBbz0XJHP2c0CU8wTCBN5O8nBiN7hZ62RVbfO3petYac4AneOshqrJRTY/UdeJb
 I7ww==
X-Gm-Message-State: AJaThX4qmv4rZe3Lr5qU2rxNcLP0hW4Dgc2eAk7g+bCUDld5rfE4lJZq
 w89HrDvgQiWQHhsahfH6wYzsIjdT+O2RhoOoK44=
X-Google-Smtp-Source: AGs4zMYJmS1q4lX7J2jcBxuIS4scWGdrdUOPxopnZ2EqPunWUEOP2yWk3CZiwHbP6roGx8nx7U8xrccQE2z3zpnTU80=
X-Received: by 10.25.203.17 with SMTP id b17mr12748547lfg.5.1512714462254;
 Thu, 07 Dec 2017 22:27:42 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 22:27:21 -0800 (PST)
In-Reply-To: <20171206020008.2562-1-venture@google.com>
References: <20171206020008.2562-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 16:57:21 +1030
X-Google-Sender-Auth: 4Z7WmrZNlgZvWL7OEflX6rjgQYU
Message-ID: <CACPK8Xe6kFN5wpNP=T0phWicvjAULit9ympLUXySGxaD-sTLxQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: zaius: move coin battery
 sensor
To: Patrick Venture <venture@google.com>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 08 Dec 2017 06:27:47 -0000

On Wed, Dec 6, 2017 at 12:30 PM, Patrick Venture <venture@google.com> wrote:
> Moved the coin battery sensor into a separate iio-hwmon
> instance to facilitate reading it as a separate hwmon instance.
>
> Naming of ADC inputs in follow-on patchset.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dev-4.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 5f6a11ad93d4..17f2000d5cd5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -102,7 +102,12 @@
>                 io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>                         <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
>                         <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> -                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +                       <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 12>;
>         };
>  };
>
> --
> 2.15.0.531.g2ccb3012c9-goog
>
