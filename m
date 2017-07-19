Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBYY06dczDrVF
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAjpY4ko"; 
 dkim-atps=neutral
Received: by mail-yw0-x230.google.com with SMTP id a12so17711722ywh.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tnzML6X8G5dTQ1uqPN0KczjHLwgI4/SLxsGX12GU8U0=;
 b=SAjpY4koIWJWNYCBPSt9ncQM9xjDSmBnu0N7BSIRdL5Nxv7XBaU7dwOHlZ4IbvynNJ
 2hInrHAOSrLwiho+3N+dTXbHik1CxBRDBduGN1daSs/S2mi2EgtDZA8uZffWKS2KPJO+
 SpAFwHmke6g3LlbIXsStCCghHy5A43K/pPfuxpTG7qe60MGBIwo/LP8JtB+acFKZI5bL
 A9qFWKNQRtKN+IlHFxodqaVQOuXw2Y7nGLQ6rDd2aodTE/TX/3yMuTgYfHsDAf+JbL+Q
 D1x7zVUSNxhXdL76uvOJCl53fennKnAvOjHKZ0C/8zyMpX/8HEj+/vEnGVg37k8fzqL7
 CebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tnzML6X8G5dTQ1uqPN0KczjHLwgI4/SLxsGX12GU8U0=;
 b=MGV2Om4gAmbjhw+1mJ2qmM+YAKNfwRZwI25CYFermmR1bXL9Ml7My6j0Qoxz9LSKS5
 mZyTwwzkmG306Uw/E6ASnm8Kfot61LjH8LHO/ezP41jMd5whcYq+bTXtZDWMrsV1XX66
 FHn/1oNmHOvI+EcbbrQlWp9cYzM/tUqh5EOrHOmo5YFcSox+evL6JZNxvwZ6dlTwbnI3
 xIYBx//vG3kn4hHHCH9KtDE/xUMbirXzz2lMUVuGItEr8cGqsmpR72Vza/TfZc5iSlCV
 O6yW5lxgLmt2GdJqt8iyqBTkxNbhlQNR36FOFekdA+92EyKesHDpD8+cvE0X4fsruISM
 oxgQ==
X-Gm-Message-State: AIVw112f3zJ7ZuO54W6nka2z32r5wghb6qq252paoy+ue1wBJk0u6PyM
 3v6UuyIXGCdaGveZVdstc9gsf+4Bew==
X-Received: by 10.13.239.199 with SMTP id y190mr1402731ywe.296.1500456542061; 
 Wed, 19 Jul 2017 02:29:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:28:41 -0700 (PDT)
In-Reply-To: <20170718204324.32945-2-cbostic@linux.vnet.ibm.com>
References: <20170718204324.32945-1-cbostic@linux.vnet.ibm.com>
 <20170718204324.32945-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 18:58:41 +0930
X-Google-Sender-Auth: 4q3Rj46nufIRGvdCy0uwNXb1WA8
Message-ID: <CACPK8XcGBH8NOu0BvpmWarJKaD5nG+jUhVz7fFpamx-oX_fBHA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: aspeed: Add gpio-keys-polled for fan
 presence
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 19 Jul 2017 09:29:06 -0000

On Wed, Jul 19, 2017 at 6:13 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #poll-interval = <100>;

Are you sure that this needs to be polled this often?

We should consider how much traffic this generates on the bus (how
often it is contended), and how that fits in with other devices on
that master. If you've done these calculations then please amend your
commit message with that information.

> +               autorepeat;

None of the other gpio-keys nodes have this set. Can you expand your
commit message to explain why you set this please.

> @@ -224,6 +256,8 @@
>                 reg = <0x60>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;

This appears to be an unrelated change?

Cheers,

Joel
