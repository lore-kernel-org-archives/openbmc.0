Return-Path: <robh+dt@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="treak2G8"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466lnq1VdBzDqQZ
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 05:11:42 +1000 (AEST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFEF9214C6
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565637099;
 bh=E/Wq7i7xnIxt1gJKCZ82QanfLVuebUWCuy1K24B+FMo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=treak2G8MrbmObg8FSSFRSwB7hajX9l7l97PeEBgEdM/rpYdzbDA/0/OLeqsgg2qU
 KKeMhhzubR55UZHsQlN1wJmK2EcT4cTbc3Qci1JDGQox8SEM4HqQml5jf7ih485rmi
 GzvXzfi6cTXv86Tepm51ut18EIkOqAVRXDCcMW38=
Received: by mail-qt1-f180.google.com with SMTP id u34so4664418qte.2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 12:11:39 -0700 (PDT)
X-Gm-Message-State: APjAAAWSMyuLeNUmCwNifC24d02U1186LruQx939rGwulCMJpA6QuPAa
 OUaRFJtUfqD2SHMw11tK4uyYtx+FGCzH4zArfw==
X-Google-Smtp-Source: APXvYqwy7GVmLeGMFfbnCU9KfMy2d+Cst1XuCcbjR1Nxmy2vbL1Eh3xsRpA80dmnLum7eCTeYkaqBTIWT6xIjJgsq9c=
X-Received: by 2002:ad4:4301:: with SMTP id c1mr10974792qvs.138.1565637099006; 
 Mon, 12 Aug 2019 12:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190812025242.15570-1-wangzqbj@inspur.com>
In-Reply-To: <20190812025242.15570-1-wangzqbj@inspur.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Aug 2019 13:11:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1742r8vkwMjzem5FYEis21kVJKamrBt-TgDpMHHFsPw@mail.gmail.com>
Message-ID: <CAL_JsqJ1742r8vkwMjzem5FYEis21kVJKamrBt-TgDpMHHFsPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add ipsps1 as a trivial device
To: John Wang <wangzqbj@inspur.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, Patrick Venture <venture@google.com>, 
 Anson Huang <anson.huang@nxp.com>, Jeremy Gebben <jgebben@sweptlaser.com>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Milton Miller <miltonm@us.ibm.com>, 
 Lei YU <mine260309@gmail.com>, duanzhijia01@inspur.com, 
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 12 Aug 2019 19:11:44 -0000

On Sun, Aug 11, 2019 at 8:52 PM John Wang <wangzqbj@inspur.com> wrote:
>
> The ipsps1 is an Inspur Power System power supply unit
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> ---
> v3:
>     - Fix adding entry to the inappropriate line
> v2:
>     - No changes.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
