Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh4Zp0pFVzDq5W
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 16:26:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q7BJYyza"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id p144so7589119ywp.2
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 23:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IbY3B5a2FWbyGV4SIhbILlvQ8lEINUmxWy0YlzHVHCY=;
 b=q7BJYyzaJVDyFrDdgnwWjyU4p7nqOEYRZoavyIw+ls4Da6Hs8wQfFQXx5FiHBnTioW
 FkaeM7CIQ4Pv6kM6OhYiJwLnH5FDaawdiY7aLq6Uxof5qOugEhGPB3r4nBm60P5c9V+k
 tG3pFEOBjpmA8GiZnJffBBcmQ9wE2tgeURCNhhNdxxD8Xw6JzEO/S0ex3JVeGCVCM5Ba
 Lqm1OcNkLFOUfeN/XY4PdO5pzFoZj1chVg7g+hR1GxTcJ7hKyaGBPbWku2gCZCb7ns4p
 pCuoTCovkbDjijA3d25xKYz1+rSM+l6pxqEfOVjkcLPhliaqTaq24kBgNE87OuhzHkqN
 Rl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IbY3B5a2FWbyGV4SIhbILlvQ8lEINUmxWy0YlzHVHCY=;
 b=TeMalHxG2JT16YQSz1tsxebirK5E1D+OwaJZcY6qF7P8cCBu8EuHoqf4Y6qL2lKavu
 6VUNqsHuJ6RnkCfvEAb2RDzVOwrj3pEWHZ4qs0cHIGrDtaxpdUnY3mUtSxHZtsrDntKH
 WcA1gl++/8b5OYAR5+rJwoLoLUVEBc4j2GLVnK0wR4nhqvJeDef+yrcXcL6/GV+Qjj7q
 E+SEfVFb8bO7x9B9As3oWKjlKE17iuNwxwk3eSWFXX5rLeOAeZi3m9ofnzouc/2mLg8c
 ZsUlrj/+LW8XJZSb67rmVo9rEPTlFJy+nHll1ucQExQfSK2Kox/OBsj9GyE6K2grbBAp
 wMmw==
X-Gm-Message-State: AODbwcADwrIQa7BPGKKSKWyK5uGdm8M5KibR6rDIXD1MEQ+ZTpLcTjeU
 ks0hXocKBhBOlKYDinACg1k0gK9fxw==
X-Received: by 10.13.233.195 with SMTP id s186mr11800918ywe.329.1496643968156; 
 Sun, 04 Jun 2017 23:26:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 23:25:47 -0700 (PDT)
In-Reply-To: <20170603012952.2192-2-brendanhiggins@google.com>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-2-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 15:55:47 +0930
X-Google-Sender-Auth: KW0CBlK_J-8PTrdT0LntdMv-xsA
Message-ID: <CACPK8Xcd=ggF0a5hYARtce+14AKMRgFi0LUe8-_a6AUtqx3vKg@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed
 I2C Interrupt Controller
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 vz@mleia.com, mouse@mayc.ru, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 05 Jun 2017 06:26:10 -0000

On Sat, Jun 3, 2017 at 10:59 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added device tree binding documentation for Aspeed I2C Interrupt
> Controller.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Joel Stanley <joel@jms.id.au>
