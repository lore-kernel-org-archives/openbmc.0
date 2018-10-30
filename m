Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nw4XZf6b"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kqvS1WtZzDrS2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 23:06:43 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id z21-v6so11089911ljz.0
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mLQSdcEls+mBlGEQFOcPvN6Qp0nCYaM+a3gIIuK7UX8=;
 b=Nw4XZf6bGidUvG8CRi9aD++e87bkl9zzNOq69xLafK9gXE5ypzF2cgrgs1+rVDP9lL
 OzvOnNV2gi//LmkCrdMk+N93dwv7Ybi+AF8tAt+MANMe97zxobAJ8WUiaaymNgzk0eJB
 5tI2pA6VsIbg7cvqbqof3wXLQiYC7y/7EAdL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mLQSdcEls+mBlGEQFOcPvN6Qp0nCYaM+a3gIIuK7UX8=;
 b=kHQv/W/kTp5vCu6oEJl6iGA0KkN9m2MPxI9qFQAZlXMCUJetcIp2EhKkCQtAr3Jqz2
 2pHPs7vcqLvSp5HQYL0v7+lVS/A2Deua+7UPHbTdqPTokyYsDDoVmQLPuCpdYYuibgef
 fHa0tHprhRqYA0ImVOZLH04JN6E28FcAJuh7m8FEQwyVqN0EDEErnTFWoerZGYyyvk65
 f5ZhdxEPpArQpuQUEfRQOexiRXfFMMzyDzF9wpVlkOJ6JTnHDr2r2MglhT2ycEt1kJ3P
 5xiu85TdO6oyWDhv3dKvByKQ93U4B3DsrpsLkJ3NnYPiweUZa0qfppBFNCUcX4zVLgrj
 SQCQ==
X-Gm-Message-State: AGRZ1gIAK5aO0QArdwQIdF92UnUjX6lhk4ZnGKd2gvxTQs5tHd49jI5D
 RLwrihC7AJrrctoCpHKKpODLzabUv/uwHi/vja0sIQ==
X-Google-Smtp-Source: AJdET5cgRgi+RrpFz4n14x+KVxkHCHkKyL+iJh57Ghlyg7jdhOw//RYZG3kA2PyNSqZorWiJ4H/o7+lYPzRJdwInVdk=
X-Received: by 2002:a2e:7801:: with SMTP id
 t1-v6mr6510691ljc.120.1540901200086; 
 Tue, 30 Oct 2018 05:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181017213012.233957-1-kunyi@google.com>
 <20181017213012.233957-2-kunyi@google.com>
In-Reply-To: <20181017213012.233957-2-kunyi@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 13:06:27 +0100
Message-ID: <CACRpkdbzhRMB1gr6CUVdref15v1S5DjHaUxi6=BOYoc3f_ZCrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: gpio-mmio: Allow volatile shadow regs
To: kunyi@google.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 avifishman70@gmail.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 12:06:45 -0000

On Wed, Oct 17, 2018 at 11:30 PM Kun Yi <kunyi@google.com> wrote:

> Currently the generic GPIO driver stores the direction and data shadow register
> when the driver probes. However, in embedded SOCs the GPIO pins are often
> interleaved with pins muxed to other functions, and pinctrl driver might
> toggle the direction/data register values for these pins. With GPIO
> driver being not the only owner, it should read the shadow registers
> before updating them, otherwise some pin states would be overwritten.
>
> This patch adds a flag BGPIOF_VOLATILE_REG to allow a pinctrl driver that uses
> the generic GPIO interface to indicate the need of read-before-update.
>
> Signed-off-by: Kun Yi <kunyi@google.com>

Hi Kun,

as you see the build robot has problems with the patch, please look
into it.

Architecturally I'm not so sure about this, we are introducing more
and more "shadow registers" and I feel what happens at the end
of the day is that we end up reimplementing regmap-mmio.

Please look into switching gpio-mmio.c to use regmap-mmio
and add more registers based on that.

It might be a bit complex but is a way better way forward for
everyone.

Yours,
Linus Walleij
