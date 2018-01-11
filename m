Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GcxtPulF"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHYFg2H33zF0bV
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 04:45:58 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id d4so2805981qtj.5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iFP+0sb/Jk21wUp6+MT36CV6ekyJTgRF6WoDRYhdsTA=;
 b=GcxtPulFAg4jx16vw/aK+VcI92reTu6byOnYc1C+t/UcAT0hFgrSEtW2clt8LFwzvl
 qrZFkvgHEp1TZKIGTQ+lyRqWm8G0QDB+1Rd5jhYF6Vzb201aS72fuERRuwkTxP+TI0Mx
 nR1Y4nRetX45mD9BhvRrYN87Uzuu7H5JX7u1KwZpfixVN2PlykQtJ1HRfOiUXpoC3kpW
 m6h+aYcUUMxXfd0YGSW/n4jvwh52b+s66J1QF5i6WHLuZtONc15FqauQVwxZNZSErlS0
 UWEub+ptAMoJpTN2PE4sCvDG1YVP9PJQePPvR5CRv2R/LzHz1TeqhvascOhhxfymcbMF
 Sm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iFP+0sb/Jk21wUp6+MT36CV6ekyJTgRF6WoDRYhdsTA=;
 b=JI6TxvfafUnHP+mjjF59JhJGjHEttNvKvPjTMpiUFvqT2LfTePPAfLdYK2rTEIuTiC
 Jev/CjgbBvVxgVC1wvesNzuRic5sRHxpey9kzQPzb2RnU3f7QDjD0XGHKPKA1rydBVSZ
 U0TVK1QANS42NE3uT9XrzrQczzEfo4me9SmvbbRToFw1ZIULn189shr4/cVInlvzspBc
 R9nzv7JMZslXdkSgdXd/F//Xgj+kld5S1jt9suH9U8qLD8UgipKpet67ZEGULm97hVHU
 yVC7d+TJ1hV9cN24RWsaZ6b/DQdkG5of47/YOqd35wiX+SbNfi9LyXqbTrM6aSv+GsQU
 28cw==
X-Gm-Message-State: AKwxytfp3//hKMmh5P/z3AvNV75k/hTt928ULzicUPkQ8E5DGaR+qs2f
 9wgA8wb+XOWMGGH4vdMpnVRndvplHSU0FV1ezQQ=
X-Google-Smtp-Source: ACJfBovAeSpuyCKPACf8eojW2nQWl6hK9R5yd9ZfPPEZV3jFIiVa4tkeg4urwSjmWK8ssRLsq6/YxN8GY47rGvBaU1o=
X-Received: by 10.237.50.166 with SMTP id z35mr10076440qtd.249.1515692756075; 
 Thu, 11 Jan 2018 09:45:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Thu, 11 Jan 2018 09:45:35 -0800 (PST)
In-Reply-To: <1514202808-29747-3-git-send-email-oleksandrs@mellanox.com>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-3-git-send-email-oleksandrs@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jan 2018 09:45:35 -0800
X-Google-Sender-Auth: L44PXdYRXsMJho6nYQUF-1JcsmM
Message-ID: <CACPK8XfFxWy+XvWJNSV3Ouy2WyGe1Hc2QP0bddPenqH_6673hQ@mail.gmail.com>
Subject: Re: [patch v15 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
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
X-List-Received-Date: Thu, 11 Jan 2018 17:46:00 -0000

On Mon, Dec 25, 2017 at 3:53 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.
>
> Driver implements the following jtag ops:
> - freq_get;
> - freq_set;
> - status_get;
> - idle;
> - xfer;
>
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Philippe Ombredanne <pombredanne@nexb.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
