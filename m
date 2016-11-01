Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7nsr4BS1zDvNS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 10:45:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NcRFnUWR; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id 62so19922120oif.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VfJ/nfUzg/8VFPjveI5UNLhS4DvWqdC/OWv98WGpfY0=;
 b=NcRFnUWR/4vQrCRVrSqPX5RbRRYEYMbo4LExKrIzHV7+5G4JSBYlJ4r0Y3I7HrIfTn
 TS8XS7wN+NCfi+VhnsVCt4nV4DROrUqJPMTMmUfuD1Vabjd182k6f7VuHUyRNQEJPeCu
 ojJheiRz2U+t5Uui0tFdPuiqspoLBMVTmVlhgXbgGfkKVuUHzwMua1f+RStCyCJZsQ/D
 L+FjSqWprF09+NOxgqKp2lzgmQIdeoYQ7g+drCYzLIY/bvqmKHuuo2UUKYka80QH5aj3
 fuJTy4zo6eeU+PnYEFg+nfwzDPWO98P5NM1sPJ321dKCHXRzc5CV+jxqaFHQvQqlnQl6
 pJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VfJ/nfUzg/8VFPjveI5UNLhS4DvWqdC/OWv98WGpfY0=;
 b=QKYNVMH9ESrU91EOEY4++K1gKhJS8plbVtVyb49Z5QjZEm8hB6iEe2u3I1E+/rNXKX
 26VAJ66RRS0Ua4gykLEsz2uit+PIQRVHGCe4qkJNjBAMBROHqF70WJQLzb+/wwrJmv3W
 ge2l/u7EMunCpw0tOKMd8mKOUG+kHaUWBerfLgZr0tPaYhxJuK/GbmNryq9cLYq3zd75
 B5EhHPu3019dpszFRo2t2Z8bp9w+FdDeYtLBlnfNoU/eo0KPyRwDCP1AMpWHesekBDL7
 LrHIpnyEfNzgnkRjE6liorQxuB9yaIrRCp1ccMpnL1n9DBnYK5LgQSCTUC8lvliz2EuO
 frMQ==
X-Gm-Message-State: ABUngvdc9Z/lK1ckQO3D+M5qcHN86TfdlR4nS5cxJwLi/fsiA+MgnnaIvnbVj8CDMz1jjAIon7r5snNab9QMVQ==
X-Received: by 10.157.60.206 with SMTP id t14mr408850otf.37.1478043934546;
 Tue, 01 Nov 2016 16:45:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Tue, 1 Nov 2016 16:45:13 -0700 (PDT)
In-Reply-To: <1478043025-78465-1-git-send-email-xow@google.com>
References: <1478043025-78465-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Nov 2016 10:15:13 +1030
X-Google-Sender-Auth: oKBu-yzDHEQsYQgYZPW0tQRQ9Mc
Message-ID: <CACPK8XfEt+8rdkffHTtfoh13akffxDhrTe0WXZA0-oGbt4FuXg@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed-g5: Update zaius with new spi-nor
 binding
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 01 Nov 2016 23:45:37 -0000

Hey Xo,

On Wed, Nov 2, 2016 at 10:00 AM, Xo Wang <xow@google.com> wrote:

> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "pnor";
> +       };
> +};
> +
> +&spi2 {
> +       status = "okay";

I think we want to request the pins here. Something like this:

+
+         pinctrl-names = "default";
+         pinctrl-0 = <&pinctrl_spi2ck_default
+                         &pinctrl_spi2cs0_default
+                         &pinctrl_spi2cs1_default
+                         &pinctrl_spi2miso_default
+                         &pinctrl_spi2mosi_default>;
+

Can you try that and do a test boot on your hardware?

Cheers,

Joel

> +       flash@0 {
> +               status = "okay";
> +       };
> +};
> +
