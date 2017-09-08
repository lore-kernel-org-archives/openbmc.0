Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G/DAnNbf"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpNQy5lkwzDrYq
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 13:41:30 +1000 (AEST)
Received: by mail-lf0-x241.google.com with SMTP id q132so591516lfe.4
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 20:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ON5QJL3LtTpA/Z9Z/IJb/nXNiqhAaNQJi1gpyfHTmko=;
 b=G/DAnNbfC85GkUsKAaKFfc6lQCos2rdgOvOPNJJ1eIJ3/uw5mGkFzEOBPsceQHBxtj
 VZyjjrVQmGP+IGL8lsVfRMwy6ee1B3HGh2DfXkbPCgmi3YBXnDNvLPtx0ZOlzvrVoaMM
 4mt3E+7uDrTnNpSfLwWenhUAThy2F4yYMx9LBYpMnMjpX+Ma4mK5rDDGSG0vZ1hhS2H4
 /iNBolRSXG24LU5lzXvqlBiLdOJlEmBRXcbLwJLUwfg+rYbjrIJlCcVxg+4Ks3IMUGhH
 A2sCbyH+KLj9E6suKLzPxFOgnjOTu1x2/ifsNdOcP0e/oXvXAJtHpjK2VuuAlOtH7gPA
 Xp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ON5QJL3LtTpA/Z9Z/IJb/nXNiqhAaNQJi1gpyfHTmko=;
 b=ZGpOKdK4YmLFaDiRFBoL4XRThIgwlJ7Y3I2guRz+r6XfNdcrnarudWaXIu0q3j3hyF
 lgUFghGDuoa/pa6O/Q3CTdBBBAxsGBM8+rEAwQIm2uRwcZSSN9MUuer6zq1iJSUR3wVs
 ECV1CdEwYnXBbxBd+evjqflsZA0ji3mFKl2um7w8ue3K01ANJU1D1i9i+LFoKQ7YLXAo
 h5phyJoj5RzsN7ozLHbsEV06jkVk81r1TSN46dHdJtZM9HZXKgfssIp/GbLjfNInQUnZ
 d+AclgsiD3w4VRL6yXG3CpjW2mfs0i+1Wg5TBotc9uXxev5aI4rAUIHqLzobk2LbWe7b
 Pijg==
X-Gm-Message-State: AHPjjUhKMHjRx1xgeEjxR87A1eTyMZxBypEa/5TU4Uqi/1YyBDGxOcf5
 7tVF5DzZslQ9gLBcmVItQJZk0cMH2w==
X-Google-Smtp-Source: AOwi7QAiTkgV59p6Med/VtuihxFsF3fYe6OvriyDX55k6NeX34YLlFNLhJUu0tN5hd0+AP1Pb35NsKVauy7x2dWejXE=
X-Received: by 10.25.143.27 with SMTP id r27mr475189lfd.85.1504842087421; Thu,
 07 Sep 2017 20:41:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Thu, 7 Sep 2017 20:41:06 -0700 (PDT)
In-Reply-To: <1504281966-6199-4-git-send-email-oleksandrs@mellanox.com>
References: <1504281966-6199-1-git-send-email-oleksandrs@mellanox.com>
 <1504281966-6199-4-git-send-email-oleksandrs@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Sep 2017 13:11:06 +0930
X-Google-Sender-Auth: E1FpU_2ZqV4ONPlW2oM4qsNMGDE
Message-ID: <CACPK8XeUtBXCZATNtK4K-kue3wmH34X3s6hNh0_1p2z7eNSoiQ@mail.gmail.com>
Subject: Re: [patch v7 3/4] Documentation: jtag: Add bindings for Aspeed SoC
 24xx and 25xx families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, jiri@resnulli.us, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 linux-api@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 03:41:31 -0000

On Sat, Sep 2, 2017 at 1:36 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> new file mode 100644
> index 0000000..f4ded49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> @@ -0,0 +1,18 @@
> +Aspeed JTAG driver for ast2400 and ast2500 SoC
> +
> +Required properties:
> +- compatible:          Should be one of
> +      - "aspeed,aspeed2400-jtag"
> +      - "aspeed,aspeed2500-jtag"

Please use aspeed,ast2500-jtag and aspeed,ast2400-jtag.

Cheers,

Joel
