Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="laoQEjxP"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dZ0Z3FKPzF0wf
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 09:22:54 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id j46-v6so44223375qtc.9
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 15:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPE1asM2w/LG1vcGx1SzaDHZSVGz3A88KoIC2DmglS0=;
 b=laoQEjxPUKGPrI2szp2Ws35MVQjrrLI6kMey3QisAkBuG5d/wb+HJ0EnIxsoLMvQT7
 LiscDKyPtAG6C7NbnSvfgZv9mIPRGfWKX0Lfl4zh2pt73gniPgwvvyCItn9uwi8bkifq
 Kq7wQAnap1N0XikwsgTJkNPn4J/W7cn+oQVxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPE1asM2w/LG1vcGx1SzaDHZSVGz3A88KoIC2DmglS0=;
 b=gbQ6ivHUMf8ZGiIvWACFphGfG/TpCz9u6O2aDlc7MTtViTXw1PgtDK7/DjscXhoRSS
 fkBtdCrnfCk1F0WvuAzP29/Oa7Qsa2xujxcwtuTXVLPIirYlPNjYexVf9YLo7htBvDIw
 7hsZQMaJOEQ9SZFdz8iWadH2OF76fYanzLOIqxFEjM5012PBp3qhtWka8Jvwsitgc1Fc
 +mfHVhOYD30a/QDI9Eg7wI/qFtjGMs3VmVMsvtkJNACnfC3XRUGLw3pbHsbbIIeygbYR
 XsiSgE4m0Luo56bte81+snt/lxlh9617PCdYTroGsRPuLi4wBveqL609uulrxMzio67W
 4D4A==
X-Gm-Message-State: ABuFfohJCF/9NqesD8yEwsol0WyOab6jyjmMMhBVHtfWm2Tne4w4dtGx
 KgKp66EsjGkvpy6CeYz+jeNJljIEP15ZIdWiFvG6Lg==
X-Google-Smtp-Source: ACcGV618v0EaF/b70p1wGx2ajezw0tKiVwWvDio0uc3ebb/e05Dw2rJLwQOeDK4uCN9g7145X1P1wRaIJEF8Mti6yqo=
X-Received: by 2002:ac8:d84:: with SMTP id
 s4-v6mr42623407qti.284.1540160572216; 
 Sun, 21 Oct 2018 15:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <1534924048-51891-1-git-send-email-mine260309@gmail.com>
In-Reply-To: <1534924048-51891-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Oct 2018 08:52:41 +1030
Message-ID: <CACPK8Xc1VFkmiA-asZy+quPuuty6jYof0y1=2jhM=f1wuNRufw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 v3] hARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 21 Oct 2018 22:22:55 -0000

On Wed, 22 Aug 2018 at 17:17, Lei YU <mine260309@gmail.com> wrote:
>
> Add iio-hwmon-battery using adc channel 12 and enable adc to make
> adc running. This channel is used to read RTC battery voltage.
>
> Note with Romulus hardware design, it requires GPIOR3 to be pulled
> high to read the voltage, otherwise the reading is 0.
> When GPIOR3 is high, it consumes battery and impacts the battery life.
> So it is left for user space to toggle the GPIO when trying to read the
> voltage.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

For the mailing list record: this was applied to dev-4.18 some time ago.

Cheers,

Joel
