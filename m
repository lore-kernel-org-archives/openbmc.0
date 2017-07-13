Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7Mj14yGvzDqk6
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 14:07:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YV43af4z"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id n205so2017680yba.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 21:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mLiWkrqTlIQKbLcZjqPDzLjC362bkGwRxdDEJsO0uBM=;
 b=YV43af4zj8YbE54rE03xEW7TFzTwOKpqVsgfXb+sXDJQcLR7aLab25InrGLQS2XUIn
 oo+2RtbJuAU68xuo0iHZ+sfC0NMkIi9mR13phyYGAQGbfEfny+O0VyX9DXoY4oXii+dW
 vtNABwH9dyVRmofC28gY6a2k4NMh+Z/BAEUPHVZMzAhC23u8A6edjnTbmFkHm99n8AMq
 96LtztEo6f6DsGz9cUxJYoTir6XpMX+0sXqVT2CUednOLxNGBX4YLiw6PRISl1dCq1nd
 BFgMWDK7/zhalFIJMJsophB3nQV1EU4OPyY8sIYXj4IIN/PojXFs/VjNHVkbPfdHO0CO
 xfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mLiWkrqTlIQKbLcZjqPDzLjC362bkGwRxdDEJsO0uBM=;
 b=m5p+VLG/U2GDMdIP4pEfWfV2IbX1jhiUwABltYay6fHS64/NaxD3eMy2ZjLEOdNNn+
 6kaxsY50rguKEUJPCVp7nskLHxfV1D2s4sREwCbOiTwxKnu0TF+M6on7eblY/xDbXZjY
 hN4F3FHxM/ASytH4gPoH97MQlm7CZovtssEErL2+B8b6YGE4e05SKpgLtiQ0lGZHhbfw
 MuXTGxIxem3kJADNumMQAZ7oUo1hUKcy8p1G7Xi+LEk0KhdTYTYeUjlXeKoekGpXT4IY
 ZrIuONlC8PG6uuZBywx8iWPu+3o+hRcgRMtpzQh6v6GOe62w3rgHcVSEOxIrJjtiovsI
 Pokg==
X-Gm-Message-State: AIVw113Sd9Xp4p/IBkhDfbiSYbMGNEwspf67BlEfhh1dpkD37GgvBww4
 KMUlmbWp6TCfUX+tqQyS/uLOxLYpQg==
X-Received: by 10.37.119.70 with SMTP id s67mr1442628ybc.214.1499918835368;
 Wed, 12 Jul 2017 21:07:15 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Wed, 12 Jul 2017 21:06:54 -0700 (PDT)
In-Reply-To: <1499373235-5412-1-git-send-email-bjwyman@gmail.com>
References: <1499373235-5412-1-git-send-email-bjwyman@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jul 2017 13:36:54 +0930
X-Google-Sender-Auth: NBQ9sDX3n1Mi5_2ITXl0YGxx5dk
Message-ID: <CACPK8XeD4-o0yvEoppP9JKLg9g9uEpV_JNLLsrUSmjt9CUx_4Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Add fan card PCA9552
 to Witherspoon devicetree
To: Brandon Wyman <bjwyman@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 13 Jul 2017 04:07:18 -0000

On Fri, Jul 7, 2017 at 6:03 AM, Brandon Wyman <bjwyman@gmail.com> wrote:
> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
> is used for fan fault and identify LED control. Adding this chip and the
> LED lines to the device tree.
>
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
> v2 - Add required address-cells and size-cells.
>      Update aliases and labels to match up with MRW XML.

Thanks, applied to dev-4.10.

Cheers,

Joel
