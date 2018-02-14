Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tKQ4CcKp"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhMHW2qbHzF1Dp
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 01:29:42 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id q18so7906820qtl.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 06:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NX3wN2X99W/7EfdgwTA34uVKNdC2g9k2pH60OMLpGR0=;
 b=tKQ4CcKpFyY5o7sAOLFWKst+clPVlrneiFraWknXl8QfRu7FkyoNe5Rio2/91iEvOV
 SrIO2nImWjxV87eiVJzInpJnVsp83rZOthWpQS3pInHEkFa3s+e2jB6IDORoIOhpYU3Q
 NljjXDMnSgGx6e8ljepMdb22W6Y4Nv4yDqf+ToPyyVOpyOw4OQbijBilM+2SDW28ZnMb
 LVoTxR2HZtrENadoGaFIzv5X8UbWckj68FeVvCdLIqfzMlWoIaDi1JD/yIS7CPRgpiTx
 cZHon7bp3Skp4cqumpr9oUQkWNmqke0Fv5MzbgV8xIdj8QXISwZUJ3Yp/hOgd7e+Yfis
 kL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NX3wN2X99W/7EfdgwTA34uVKNdC2g9k2pH60OMLpGR0=;
 b=SOeQaNgOwGeQeMm/rUq5XJoFd5FjzDt57oSs1Sb2mtne2rj+83xhX+IZvGfmyfTWFR
 QPvQp9xflcggUzHTLee1qNnod+RClFIDndjunQRsXX7pfo0rcgeNqTbNKDLB5B3Tsmh7
 bE3GJ1pIGYhHx4GgqC1rp3rrQc13SI65h63HcxX1COyWnRSLPyf4R73xr2IVMQ4SSZ7w
 ti/5PKtI65W46tTk4AIX7mZtEvhDFzd7GX98i8AJQeoQ2AcXW5g+8R/CccfkoaKuxwaD
 Tm9AxUKeyAWkAK2jVbzoPJWI3CkKWLXr8S0VjZbHntQL9vPaxf0wdPSlj2BEhKJc26id
 XRjA==
X-Gm-Message-State: APf1xPAb1ZtZitT8rr1N1eF/aF3Ap+pqz3cwiygdm0eVrYPM2kjOZE0l
 dMrwvDquHveHUns2PT98rsHzMOZ4XlJ3W3P7LqU=
X-Google-Smtp-Source: AH8x2255QR6s+SHGL3mbLUVIgBK9sglgf7c5Wgs76Q3ZvSFGCIEiLGzEvzTQpBT0W9aWRd3HqZ9IuxQm1xuumqqT9yU=
X-Received: by 10.200.12.203 with SMTP id o11mr8065639qti.95.1518618580408;
 Wed, 14 Feb 2018 06:29:40 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.140.23.8 with HTTP; Wed, 14 Feb 2018 06:29:39 -0800 (PST)
In-Reply-To: <20180213200959.160157-3-brendanhiggins@google.com>
References: <20180213200959.160157-1-brendanhiggins@google.com>
 <20180213200959.160157-3-brendanhiggins@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 14 Feb 2018 15:29:39 +0100
X-Google-Sender-Auth: B4jXltvk-L_DChQfgyAXuKqS4R0
Message-ID: <CAK8P3a2_2sQYCaUK-thBxTJ+VhQiw4AcDgwJoyEG=Ssnr=PtQg@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Julien Thierry <julien.thierry@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, 
 DTML <devicetree@vger.kernel.org>, 
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
X-List-Received-Date: Wed, 14 Feb 2018 14:29:44 -0000

On Tue, Feb 13, 2018 at 9:09 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:

> +
> +Enable method name:    "nuvoton,npcm7xx-smp"
> +Compatible machines:   "nuvoton,npcm750"
> +Compatible CPUs:       "arm,cortex-a9"
> +Related properties:    (none)
> +
> +Note:
> +This enable method needs valid nodes compatible with "arm,cortex-a9-scu" and
> +"nuvoton,npcm750-gcr".
> +
> +Example:
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm7xx-smp";

It seems you changed the DT files, but forgot to update the binding to match.

Otherwise it looks al good to me.

       Arnd
