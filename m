Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22a.google.com (mail-yb0-x22a.google.com
 [IPv6:2607:f8b0:4002:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDZgT5pPXzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BdrMxyrs"; 
 dkim-atps=neutral
Received: by mail-yb0-x22a.google.com with SMTP id s22so12070861ybe.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UT1ziOhsgfkA0ihncQMXXtenqRL/zFn+XhocO0YcQYA=;
 b=BdrMxyrsah0DPngLfyXO8M40xeEqoJy3EENwwSZCI77yejHdXg+uT3Hcrf3CJWxm5i
 l1+P3ESbDGD10csjP1KHdPEyDTpe7/y9xOtuF2O25Qqgt4KTeJnpcyiWb1YFi68uz64A
 lOHOlIpa1mZwRKnyHr1GsfT4iUWwEI3U1MiLqkeVjxshprLvzc9B6LrFHBZpgOQQt6Tm
 F02FoTUQi7v5EKqawluQdM+abaT1d+EWaLrk46/pgMzrWijUxgXDsRfCcLlaL4zLJEFD
 FBJWPfnEhju85OIDhl1ybwHiE1cRjo5brP9YpVuk58ATDfk+RnjTEFfqvrI48M6E4LuL
 sQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UT1ziOhsgfkA0ihncQMXXtenqRL/zFn+XhocO0YcQYA=;
 b=BpPCBMqUIQw9BFsUDqDHoJrNglQ5We8v84jZ13qWUp8zlkfye4vtMuL/J/JNrTPzam
 L53B9LQHvlDfcXBilg9nrG7JqWkZrw/yrmvBAtZgaTBugZDN6qaRmeI8j1U0wzPaj0VN
 YNzjn45u+TGPB5rg+zG4/cm6TvNvW9Y5jo0lAmQFuONk4iVltp1LOutjc9YOBEduzO0g
 f5KCkrJWGVInQyUywAaM18MiAZHbVZVwS1e1w3IxmKPZmIcow81AUDJpbVyE2a+p76tl
 AvkcXzOnCdytcTOqnxPaQEN/iEDr8tYf48O5Celil4AAw5K1nKuPx9Il1eRgKCtf1oss
 56Jg==
X-Gm-Message-State: AN3rC/5sKQBHKZ5fw7y7CeDCEQ4X+gHopkUIX3KtOLt9luAgsDWVkuJE
 t5ddmvX0Q80j4pppjpsoO9YjxGiRTA==
X-Received: by 10.37.110.198 with SMTP id j189mr6928007ybc.123.1493339922329; 
 Thu, 27 Apr 2017 17:38:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:38:21 -0700 (PDT)
In-Reply-To: <CAPH-5w46rey_4d=enxOPwvjbZp2aL8smNZ6DMGPQraQtaFt3OQ@mail.gmail.com>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-6-andrew@aj.id.au>
 <CAPH-5w46rey_4d=enxOPwvjbZp2aL8smNZ6DMGPQraQtaFt3OQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:08:21 +0930
X-Google-Sender-Auth: sacVKOOM9vFrBQ33h58N0A4qDA8
Message-ID: <CACPK8XccB5je8fSDWvgVyVKKPJBbhEu5xE_KvU=dDsUUauiNBQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 05/10] aspeed: zaius: Disable GPIO bias via
 devicetree pinconf requests
To: Xo Wang <xow@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 00:38:47 -0000

On Fri, Apr 28, 2017 at 2:46 AM, Xo Wang <xow@google.com> wrote:
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -359,4 +359,14 @@
>>
>>  &pinctrl {
>>         aspeed,external-nodes = <&gfx &lhc>;
>> +
>> +       pinctrl_gpioh_unbiased: gpioi_unbiased {
>> +               pins = "A8", "C7", "B7", "A7", "D7", "B6", "A6", "E7";
>> +               bias-disable;
>> +       };
>> +};
>> +
>> +&gpio {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_gpioh_unbiased>;
>>  };
>
> Looks good.

Andrew, There's a gpio section just above here. Should we put merge
this in to that?

Cheers,

Joel
