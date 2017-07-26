Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHYvm117LzDqnC
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 22:15:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJc6Icv5"; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id i6so52302673ywb.1
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dfSKV8sbSmTRm5KRR6fRE/K1XPhIw+yEs63fStV83Ic=;
 b=hJc6Icv5gZNnmgg9FMKqDisaYX+8YUjIypy4z02aiU87Z9JFyj/k8RBZ5xtuJ5MwAw
 y220ZhG9MkP7hG+T3ZKDFmrYJRVOhbLSKSEOujmcdACUECsHp9p9L21LkxBQDHzJqkET
 YixJ1jTSIGwlzyjQ1XBMqKF+C/gFksIBRnI9MjmtmgGQtUS1m85oqnGKuhzUxQOBmJGI
 imknyJ9hK2l3LEyYgjxEEiCaf7oZnfI8P+pyTJw/k3wX+5zfOsdebV9NxmrUzXJFmdjm
 QzPigOuchpEx3JxVGInMimIFvxvQvqBFaSPygBt8VVfmvyvpOnsC7G0pCIFP3JsO/ucZ
 q4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dfSKV8sbSmTRm5KRR6fRE/K1XPhIw+yEs63fStV83Ic=;
 b=jCGOq0kUzCLVcqZnOxuve9UK+xlF6TDxJdgKG9uhTDNBvXyAGAjKQ7sdyrzSmUVJAQ
 6LyJUqM7z/XEOt/kmDXWXVhuYMnWXnJezsO/g0bWzjWV4kFhLe7+iskM+k9to8/FNAWY
 ys65yDhDcYB3cfQxd3rt0bbq688T1jRgmxIs6TdLCAFPveHPg4S+Sr2nxXXxcQHN9N2p
 JWyb+ZJx7/OLWxn7flRboOq5uorjtKznRodYnea2WDk2P0jfz4Wfas5nUJ29Red4ARzn
 L1XUDB9ujwYaVo4TXigXgp0EzVIlUPfg+ReiYAJD6JJwBw0nPgCFAB5r96bliOTWn55z
 D78Q==
X-Gm-Message-State: AIVw1101aFkjQKaMwajkGRL9r2UHfxoK9OpxdhNjKRf6nf5JQIZd1kf4
 nBX5zlbYzbk0/MKTrUZoGh6X/3oxDw==
X-Received: by 10.37.230.141 with SMTP id d135mr603908ybh.281.1501071297423;
 Wed, 26 Jul 2017 05:14:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 26 Jul 2017 05:14:36 -0700 (PDT)
In-Reply-To: <20170720141500.57756-1-cbostic@linux.vnet.ibm.com>
References: <20170720141500.57756-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 21:44:36 +0930
X-Google-Sender-Auth: YG9KMfFlM52Ju6OAz3rixkKs-ew
Message-ID: <CACPK8Xf8kESrtgjDUqddLxrV7r+qL4goSBHcps3N6=Yf6h5+4Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v4] ARM: dts: aspeed: Add gpio-keys-polled
 for fan presence
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
X-List-Received-Date: Wed, 26 Jul 2017 12:15:00 -0000

Hi Chris,

On Thu, Jul 20, 2017 at 11:45 PM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #poll-interval = <1000>;

When I tested it, I saw this:

[    3.630000] gpio-keys-polled gpio-keys-polled: missing poll_interval value
[    3.630000] gpio-keys-polled: probe of gpio-keys-polled failed with error -22

I fixed that property, and I got this:

[    3.620000] OF: /gpio-keys-polled/fan0-presence: could not get
#gpio-cells for /ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60
[    3.620000] gpio-keys-polled gpio-keys-polled: failed to get gpio: -22
[    3.620000] gpio-keys-polled: probe of gpio-keys-polled failed with error -22

So I added the gpio-cells to the relevant node, and it probed properly.

Can you please make those two fixes and test that the input events
work as you expected?

Cheers,

Joel
