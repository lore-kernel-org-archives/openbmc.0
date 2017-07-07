Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3lKh2XgbzDqj8
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 16:38:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GKStous0"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id z21so1307682ywz.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eNTnLatYOwNfe8vuGlFoF6tRk7zmlEcimISk8VElBJg=;
 b=GKStous05u+78Y5q4RqoLv9aST5gNEjabAyCjE4Lke/lp5romuwsTCPjURAyW5h4YD
 qfuqdkjVLMwWYFqE2hFivsdkb5xiRlRE1FQxrHJw+NPulnuzDJamPhU1STBEeo8adCHs
 fi9/qZwax52TXj0th6HAMx8fl7AHdKKNwfzLRNZp5dNTmBrvtYCxAnyRAxZ4Twcy2M5P
 HsAQoN86LnvvvE3UlxKChJoWhlkpQnFzXTPp2YKCE/hWZS0nSagCZL2tM35qUFVvZGS5
 ZyhWfKYQQaMF1K1V6qLQPEJpIE5dSpKb9QzZgKELsUWzcZDyq3iX70voolwtCEET9CrT
 wX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eNTnLatYOwNfe8vuGlFoF6tRk7zmlEcimISk8VElBJg=;
 b=SrOyHi1U9h0eRUKJlEJ5ndVGK2jT7OA3WeE5xIkcyH0YbDTW+hyTia8QkcaEgk1WjK
 +J0EANt+lbskjzEcph9igRaQaMDteTW93i4qBIHZxYmUjCYQkWuvbibjl6QQ7GQbTr1a
 JJbzlTagh8Antev8LZ4upmItuWt2xHwwqUwejxS0lcoVvTxlYUs7JR12Q8iXNrqhZYfg
 dzzCtKokR55YTD5IUkmeTZNHtVxNHrPQSkQ/r+0jFu1Ljo926cOCPXvh0ti0JiO29sHR
 rt76Sh+b1AyKtBjPktGI9UKyqtQFmxOv1SdJ4Y65VAVZbeVWxGKxGAbnwWcFGlZOZ0ZF
 XtDg==
X-Gm-Message-State: AIVw113xJG+L4smN60976uZamE4GtSf7jo6GX+UJBQqPniEMVAENHf89
 n5rc5p3VaraL/6yRr+zF8cFQ3AHPzQ==
X-Received: by 10.129.165.205 with SMTP id c196mr615408ywh.329.1499409477700; 
 Thu, 06 Jul 2017 23:37:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Thu, 6 Jul 2017 23:37:37 -0700 (PDT)
In-Reply-To: <20170707004901.26780-1-cbostic@linux.vnet.ibm.com>
References: <20170707004901.26780-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Jul 2017 16:07:37 +0930
X-Google-Sender-Auth: QJrLxVLUXlLM-4qr8MVb07s44us
Message-ID: <CACPK8XfL+8EuZmUtDbVjqXPoE0-SUU-kFUk_G9TM-gAf5umoQw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add ASPEED watchdog device tree properties
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
X-List-Received-Date: Fri, 07 Jul 2017 06:38:00 -0000

[removing upstream cc]

On Fri, Jul 7, 2017 at 10:18 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Document device tree optional properties for ASPEED watchdog.
> Reference properties in ASPEED watchdog driver and configure accordingly.

As discussed, this has been applied to dev-4.10. Please keep pushing
with the upstream review.

Cheers,

Joel

>
> Christopher Bostic (2):
>   drivers/watchdog: Add optional ASPEED device tree properties
>   drivers/watchdog: ASPEED reference dev tree properties for config
>
>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 35 ++++++++++++++++++++++
>  drivers/watchdog/aspeed_wdt.c                      | 27 +++++++++++++----
>  2 files changed, 57 insertions(+), 5 deletions(-)
>
> --
> 1.8.2.2
>
