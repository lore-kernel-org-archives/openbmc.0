Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8KH84b3zzDqK3
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 12:21:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K3P48K5L"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id 203so7514450ywk.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 19:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NRQdfm5cze5eEKMcUwkyRoNqy0ULkBlxqQkt1MsF97k=;
 b=K3P48K5L9W/Hozta9sDpP5+5fjVfVwkDNK9rK0cvppJXAOnYexSol6iBkx8eftinCd
 5cgHLs3/eKpwLvQVdNMk5NKBK8YfI5qoO5URuUng8mNxYlSCihbxEVKmgXzrN8eCJMyo
 a4xB4ptc1iw7iSfdHO1puZ5NURRjDkUh7yJmgRDiTa6QIZiKjM9qUsokoEMxmlDmnogG
 Vjgp/pXUbb+hz+Z2SanWu58oOUsmN21UUMnCZjtRiof0PtlWOwvXpGBGS6guga8oLmQs
 YL7wBBN6vg9B/bgjQiBQqOmfonW4aM+wbt6n81bWltOJ/tN/BJ89UGaaal7fWPQJ7Ps7
 t92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NRQdfm5cze5eEKMcUwkyRoNqy0ULkBlxqQkt1MsF97k=;
 b=czWfr8yG56+TaJpFzPxvpX2KmN61URaN458zQ6c2Lm1Zt/H4S2k1ALYPj7s5KTJAm8
 erZ96G8ahBkaTSmFf3YyvKPLfHdGu7ynF0E0vPqnn9owzHONMZ54hxAtujf4N/yOExfS
 Jf49+2X9eJFvXGBvOSpD8uVeXQ3jVmeAKR2XmtTkvX8/8mB4YYRZYWGGbTeokRe1vu2X
 FvbLrd6t7Lx5XUAQbnx/BiKR+E8yDQOINRofQ0NiXA+Qf+k7NvbYlNsQGuv3cG2Kb1mJ
 Qiarh8ym1Ve7qLlOv4BAUwGWFh3oT6S96peUNC6rjirYgrkyIZImYFHYvft2OJRQ27RI
 3h2Q==
X-Gm-Message-State: AN3rC/4+4MFP3A07d/xs6YlOwKCDz/fLouWMs+c7grHBNw/CAhIuF6qn
 giEMw0nkxqe9rMabMNPNfz5orICl6A==
X-Received: by 10.129.108.20 with SMTP id h20mr9156158ywc.50.1492741279764;
 Thu, 20 Apr 2017 19:21:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.8.202 with HTTP; Thu, 20 Apr 2017 19:20:59 -0700 (PDT)
In-Reply-To: <20170413194907.x5ij6cehgb5dh6nj@rob-hp-laptop>
References: <20170407125713.15678-1-andrew@aj.id.au>
 <20170407125713.15678-2-andrew@aj.id.au>
 <20170413194907.x5ij6cehgb5dh6nj@rob-hp-laptop>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Apr 2017 11:50:59 +0930
X-Google-Sender-Auth: ojpBdfds9kfyT1yiNU_BXqccuuI
Message-ID: <CACPK8XcgiNRhoE+UcOp=3GQJHmnNCoYyKzWDKXaSny4w5Po9hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: aspeed: Document pinconf in devicetree
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Apr 2017 02:21:25 -0000

On Fri, Apr 14, 2017 at 5:19 AM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Apr 07, 2017 at 10:27:10PM +0930, Andrew Jeffery wrote:
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 40 +++++++++++++++++-----
>>  1 file changed, 31 insertions(+), 9 deletions(-)
>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Joel Stanley <joel@jms.id.au>
