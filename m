Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GxNxQe5N"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="W/r5Fo8Y"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406pRp3R1FzF1yR
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 14:09:41 +1100 (AEDT)
Received: by mail-qt0-x22c.google.com with SMTP id j4so11229744qth.8
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 20:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=w06SuWHRvNQel5UGExXmIhKxDTBIkuwa88cJtR656Dc=;
 b=GxNxQe5NUP4FuxN0pixOizp7YV4uLXxEptzVtefqwvbm76AT/l5kWWY/Tv6bEXBZyK
 kmbzXI5HgBQLKe7zqEG3v6ysZtBAuofawc6R+AJvtRIygPwvsjUR7WKeWUw+dfC6TpDZ
 omF13fmvO6fxf4gtnkmlpV2qAb1n+L/ECzcq803ycnh+Ru37Tt/wW8nY2olAsRtDZFY2
 n69AnNVVXaeq0N8UIPOLI69idi1FowRBHGcwEL3YjXtZPI2fNKVsvR2b3hGHFkJN9uqK
 qnJBScEpAovgoUPfGr7Pbzkyx5mg1v5KD0EpTf20RJaOK8ObGW0U5U/QFJwjxHLG+se6
 pp1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=w06SuWHRvNQel5UGExXmIhKxDTBIkuwa88cJtR656Dc=;
 b=W/r5Fo8Yu8Y7Og2SFBAjVvP4L2XdFdmI6jQc7ZKlFr7awbyQD/+lCPnnaQLtq3Nn0t
 OHIY/useqe+fgdjR+oLMDb/hAuvPvCDRLG1hGbdJLlP6qdHn0/VrT0bDkbq3IP2uPWqB
 p3/w3/Gk7CPYIJftUe/+FknbEVlFoBchNmNKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=w06SuWHRvNQel5UGExXmIhKxDTBIkuwa88cJtR656Dc=;
 b=JFopaLyy0ORlBtYS+RjqdjaEXwHQ4/j1ZggKSb1tLON/UTCMIatl8u8v1c9DHiAI0n
 jAQkcBToHqaQdFFEPg0sOoh0fYNTXNEwJrQmY7EJ/OwcmRS5EWTkzAOfnEq2UWRgV7Y1
 bKQAt39VGrYkjqC1VSkutxvpLx8xXlcDmlJ15lTJR+Q4Q8LMctACbEuUssjyX/aE7mCq
 pCF9sXCJAxbmW4Kcy5ycVQt+ONuL/lWYLDEW/yDONeyJntA6YLZzu8S1UNdD6FkkuxD8
 Ux2GC1G7nmOXIfiJ9/HzCWKiZiObee3jfBSNcEr8o6SdC2omvQnZNRiXcxgxmMcDrAJP
 hViQ==
X-Gm-Message-State: AElRT7Hz80iRPAPXEbka0AS3+pYD2s3icOB56OZsLBj2vEDveXLTWUUL
 FD8l60oNHm5Ma3vg33jruI2dWbUgQwY6Zijpaw0=
X-Google-Smtp-Source: AG47ELtROXXDtQBgpqVHo3zCM7hHu8MpeL7IgPBltfklWfRK03UlstUaZL1CCOHAwk/2nPde6VLkRraV1Mbv3aflIP4=
X-Received: by 10.237.59.49 with SMTP id p46mr40013041qte.84.1521774579372;
 Thu, 22 Mar 2018 20:09:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Thu, 22 Mar 2018 20:09:18 -0700 (PDT)
In-Reply-To: <20180323005248.3300168-1-amithash@fb.com>
References: <20180323005248.3300168-1-amithash@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Mar 2018 13:39:19 +1030
X-Google-Sender-Auth: Zwm0m4rUuxmiCYW9g-fLYoCfGGY
Message-ID: <CACPK8XfghUK5c=0Uxz2hB=1KYegJj4i6LH2P-G3KgO5Na1vLDQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] ARM: dts: aspeed: Add Portwell Neptune
 machine
To: Amithash Prasad <amithash@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 23 Mar 2018 03:09:43 -0000

On 23 March 2018 at 11:22, Amithash Prasad <amithash@fb.com> wrote:

> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Portwell Neptune BMC";
> +       compatible = "portwell,neptune-bmc", "aspeed,ast2500";
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +       };

These are redundant; they are included in aspeed-g5.dtsi.

> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default>;
> +       use-ncsi;

NCSI can only be used with RMII as far as I understand.

If this is supposed to be NCSI, you need to mux pinctrl_rmii2_default.

If it's supposed to be RGMII, you need to mux pinctrl_rgmii2_default
and pinctrl_mdio2_default.

Cheers,

Joel
