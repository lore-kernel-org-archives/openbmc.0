Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jY4zAGqe"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g7nG2ysKzDqlm;
 Thu, 17 Jan 2019 13:48:50 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id q8so5204330qke.1;
 Wed, 16 Jan 2019 18:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9li+6dKy82nfP6IXQsUZqEUGFFE4s5Pj00jdazTthFk=;
 b=jY4zAGqe8y8lpCsiqm9m/KgiUQIb1k1LqXm1c1HZwSetLbw3QaLuNxhzvmDtYUikhH
 78ZiNXtzSwVMj5I27BCu4Og6AyvZzw8VHn6R604WuRv1/KwuVye1fws4SAOZ2Do5vobR
 kP6lT2gRCVsplGc/JmboPjzSqK76BiScRtMq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9li+6dKy82nfP6IXQsUZqEUGFFE4s5Pj00jdazTthFk=;
 b=f6YJ0xaRZOA2BexRL1gNRgIp2+dZINIfLLK+31j0QnjzNWVqas+pgkAbqV/IuOAiAF
 S6cp7YHTpS/2QU5aM5Xud9/MmCNq6XQkzZ80SR99eq8B7vH392tQYfBne6v2g8+ImF7e
 22LpdNL7///Mhbwgl/JtvmShxhpxgav2k/Sm1aKm17PyVeBvekvMTVPDv8YBa59vzT2V
 dTXgs1YOBJuHKlWHH4H4rRyZNrtS04wch5B+xugJU+SGfjcbBeJeL0anbTTzMG/bQwc1
 lybnvPRTK6Rcez4Fa22eb7CRgETtgK+jZ0Z1GN9gKPeG72CePAok8vJppf8v6+lr2m6R
 Jo2Q==
X-Gm-Message-State: AJcUukcfb7dVRkpZADR9eITYcbg9ACmnFFgquwVBJwWR9FNXKYWd9YzC
 GXVBc9bbSA6OeIls4TsTLMOSX/tV4uCN3oNG7QY=
X-Google-Smtp-Source: ALg8bN6S0ZkkQqCqSM52W9OpcMUcZwXcTDuxo85athkDUTfOiowTNeCMIfLjqWY72yeyKjpfjJU/S5kXnmbQZeQpeek=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr9332441qkb.25.1547693327920; 
 Wed, 16 Jan 2019 18:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20181217200405.2904551-1-vijaykhemka@fb.com>
 <20181217200405.2904551-4-vijaykhemka@fb.com>
 <F23E6426-F6FE-4F10-A88A-D5862D5407B4@fb.com>
In-Reply-To: <F23E6426-F6FE-4F10-A88A-D5862D5407B4@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 13:48:36 +1100
Message-ID: <CACPK8Xfn_iNWe+iWash2MV2e+Uz_0mV9Hwz_PdgNzfYpmrLvcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed: Add lpc ctrl for Facebook
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 17 Jan 2019 02:48:51 -0000

On Fri, 21 Dec 2018 at 05:06, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> =EF=BB=BFOn 12/17/18, 12:04 PM, "Vijay Khemka" <vijaykhemka@fb.com> wrote=
:
>
>     Added lpc ctrl device to enable LPC clock in Facebook
>     Tiogapass device tree.
>
>     Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>
> Joel, Can you please take care of these patches merge.

I did not apply this one as I think the description will change once
we've merged your aspeed-lpc-ctrl patch.

Cheers,

Joel
