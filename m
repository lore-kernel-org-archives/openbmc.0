Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ks31zBlI"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgbN63lcyzF1Ns
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 19:30:58 +1100 (AEDT)
Received: by mail-oi0-x242.google.com with SMTP id 4so13268009ois.10
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 00:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OAqzuc7adzUsOXCh7hRmuzk8tBQ5ks6Ojse9lbXKYy4=;
 b=Ks31zBlIotuas4TRnQ2REoQnHiAd4tl0at6O/VWFZu06hPGKIPDAvji+oWgSHmwsbl
 zEDccVgabdj9QPzsrYJwH8qbvxAmb3ljy3TeMUKZ9g5Q1Erdu9Pnckb5p3jqF/AJNA3b
 RcVgWN3+N//MOUHN+WcdjjHTwZ8Vl58ildlLlut8qXZPY0ksiyrqUdAn23N3laMqy0pt
 mEl/ccEgQCe3YHbzCjMBcD4qpS4h/DLaniVpHMsKaLmyvVwiE7QGJIzGPT//IZFiuZWN
 7/XYDX5DIhE14ZdaSNxApEuoab7r3QuVJTtWeXCMMbJMDjgwrpnh4BSf2x27wGooEJnN
 YG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OAqzuc7adzUsOXCh7hRmuzk8tBQ5ks6Ojse9lbXKYy4=;
 b=bQZ378zOmMFTtjmT8v+ozQ1+LhZk45ms6icIlyfPJ/IjWAnaZvk0Gyov6lzVu3mpEC
 wyYQLVIvmw1MKPWwCrv1l39obcrxwkQqxLPLdBmPnCban9rQsOiTpepXw8NmV0P3f7lZ
 TzCv+Y3Rxey7CIYsLd2m9O5cX7fRQZEMdefjYjiW7uFXCxQ57w1xeG38YTbLvVOr9ABF
 R3sbQuPvK3A5JKdgvwzjssx/fs9X5/0ebu/x53KASuWUBcj0Va05xRcJBt5E0nM4Mojr
 TFRY/5iRQDLMBFrZU0JETPxljhEYY5h8DDAKA6+tcNL1wABYuGHB7I4GGavQC8zfQOcY
 h0Tw==
X-Gm-Message-State: APf1xPANwN3fhn1eaq5bSu3DoN+P7qwhuDPsIpisty0mMZQPH4HA8Hbu
 uDSf9RD8aQiUzB+I31/fMpenghXzHNWrlqMWCvY=
X-Google-Smtp-Source: AH8x225fdX4Q4ZFaOuisjdpFhn2/R4nejDcFeZZiwhWhfwYeYkc+tb0pUHjx4m5oW5QZanfCmU56RIBIvqCuT5FF8n0=
X-Received: by 10.202.190.197 with SMTP id o188mr265778oif.352.1518510656626; 
 Tue, 13 Feb 2018 00:30:56 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.168.66.10 with HTTP; Tue, 13 Feb 2018 00:30:56 -0800 (PST)
In-Reply-To: <20180205235757.246758-3-brendanhiggins@google.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Feb 2018 09:30:56 +0100
X-Google-Sender-Auth: ueAw6BmGN1CqDcjIVXr6DzuH_So
Message-ID: <CAK8P3a0SJTAkv7_QtDW1sDWFDYHw8tFWZqO6EMwpZ_5KPbhq3Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, tmaimon77@gmail.com,
 avifishman70@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
 Julien Thierry <julien.thierry@arm.com>, 
 Philippe Ombredanne <pombredanne@nexb.com>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 08:31:03 -0000

On Tue, Feb 6, 2018 at 12:57 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>
...
> +               enable-method = "nuvoton,npcm7xx-smp";

I see this has already been reviewed quite a bit, but I'm curious
about the 'npcm7xx'
part here. Shouldn't that be a real chip name rather than a wildcard?

       Arnd
