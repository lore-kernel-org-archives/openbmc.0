Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LVfNCF2f"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHjRS2XTzzF0bP
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 10:54:59 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id k19so4075907qtj.6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 15:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Chzl9jKrPKqOvgErhiuOaAlUghIKCbqkW5+dzahXKTA=;
 b=LVfNCF2fvhQUKagLQ81NJwuXIp0U4gfZP/7jqipwN8HVU89ayd7dVcFFFUeyWnAgKk
 a26NswLehX7+oz+NWCkxzg91Q8v0PyJYC2OvPNZOExG+2O2MoNG7FcbLEGJcy6F3ElzW
 2R/cEDFVrFQhhXQG8knHpMq3A7ZZleqVaF/1treXpyRY9z9ItV41aBjFEMj93+PwPr0W
 7XQWir1oxtsBReIAAX82+SD4NC0Ng0wiaAvsCWF1T5mCh/fItaZFiZLNjheeEW2s1wtZ
 eIBXS2miEZXC7w/kp17X7roGREbDqtY+Nc5H6Oz5ly4vvWLnzTy4XyqlQt0i26hVXrKt
 M1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Chzl9jKrPKqOvgErhiuOaAlUghIKCbqkW5+dzahXKTA=;
 b=LP+0cteZWbO9rmxUhCepCMU5v1SI5NiJh1UCWSVhSiLO/UvMEaS1qEkty4a4RaE2wn
 carL+yzhYQhahW/E4j/GKzkEeBWC8G4lMmZtMZ4ldTks/iM1IXTbhOigAJ+7/BHaZ5hx
 N65DMJJblCdXdxipYvlHE6UgnVbngpC2gcp5QLkWAuX8oaPmrvErloL1yCbDRWY7raOg
 TfXAFx/N0hD3nBtpZHb366y/HnSOU5R+cEjfUt9t0MGwCW6SVlHyg75OkMhZ4nOEJSsI
 QuFlA75twHrt66yD9Pkh0orHrzuTEwyUFvLkyn+ti0Upe7bd+cKaC8jlypw0GVgxHMc+
 4xAw==
X-Gm-Message-State: AKwxytfMuZMI+sAdRW9mry9qSa1N85Yyv8ii+bN0VBC7Vp7o6KJYG+Cn
 AXOqaVfIhHPjZW38xtIM2pUkB5KeTr3K8++7bcA=
X-Google-Smtp-Source: ACJfBov0ejvxNcPSriHwz3HGvscrhThIsbuGZIH/56fwR6r2GD3ZW2D+B48zr4PVdUcx0HgbLStXZFMKvO1YfdKhHBM=
X-Received: by 10.237.50.166 with SMTP id z35mr11598871qtd.249.1515714897414; 
 Thu, 11 Jan 2018 15:54:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Thu, 11 Jan 2018 15:54:36 -0800 (PST)
In-Reply-To: <CACPK8XfH-4r0mBQYA+BwvUo2+RF8igai2jy+RqTDQcxx2-acsQ@mail.gmail.com>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-4-git-send-email-oleksandrs@mellanox.com>
 <CACPK8XfH-4r0mBQYA+BwvUo2+RF8igai2jy+RqTDQcxx2-acsQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jan 2018 15:54:36 -0800
X-Google-Sender-Auth: 61Yq5AIjBVL7YkgizB2b5ZHYMCY
Message-ID: <CACPK8Xeb3K9PqynV2xymJwvhkZ9fLKsbodEFYiZtQ+SXXgGA5g@mail.gmail.com>
Subject: Re: [patch v15 3/4] Documentation: jtag: Add bindings for Aspeed SoC
 24xx and 25xx families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org, 
 Vadim Pasternak <vadimp@mellanox.com>, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 linux-api@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
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
X-List-Received-Date: Thu, 11 Jan 2018 23:55:01 -0000

On Thu, Jan 11, 2018 at 9:50 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Mon, Dec 25, 2017 at 3:53 AM, Oleksandr Shamray <oleksandrs@mellanox.com> wrote:
>> +jtag: jtag@1e6e4000 {
>> +       compatible = "aspeed,ast2500-jtag";
>> +       reg = <0x1e6e4000 0x1c>;
>> +       clocks = <&clk_apb>;
>
> We've now got a proper clock driver upstream. Can you update the
> example to match the newly added bindings?
>
>  clocks = <&syscon ASPEED_CLK_APB>;
>

I think we need to ensure the reset is deasserted as well. You will need:

 resets = <&syscon ASPEED_RESET_JTAG_MASTER>;

In addition, we need to make sure the reset line is deasserted in the
driver. Take a look at how I did this in the i2c driver:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=edd20e95bca4a5434f264d8ab40d729761479825

+       bus->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
+       if (IS_ERR(bus->rst)) {
+               dev_err(&pdev->dev,
+                       "missing or invalid reset controller device
tree entry");
+               return PTR_ERR(bus->rst);
+       }
+       reset_control_deassert(bus->rst);

Please give this a test with an upstream kernel from a fresh power on.

Cheers,

Joel
