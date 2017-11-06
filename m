Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=74.125.82.196; helo=mail-ot0-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
 [74.125.82.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yW6vG2BTyzDrK1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 09:39:53 +1100 (AEDT)
Received: by mail-ot0-f196.google.com with SMTP id w8so3691589otw.11
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 14:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VOep7/XK97Nv6VQrbVuCGZrFE7DONEltF8+KOHqy354=;
 b=AOZHURRtHDbHjQq0N+mmioEW9Bq4cH2dm3bnhGuIsug9L6LfuLAYg3gNk3teZLH0HO
 PRwxoOVkoQ586PLR4m23rtpCNQZ+hKfca8snmpb0ZobGCezArfdUJ7xKgwC576aly0rH
 w+rWbiGFv84IklpGlaierj2B6YNWcCL0/E+l0w05heEz/2U6AYrN0Du2+SAZBxy29X+Z
 eG8ZgVlCKe9Mj9MXez2jFu+7zt9mjSKD3mQGB8e5lddQbxB1VJCrawKuEV+VIg8VWHbe
 sge34I/xFdlzRKJunAWP2xxyVhkffN6NbK11p2B2DxK8Jgqcq9jnlc8fGtYq+d2JJ3cq
 brXg==
X-Gm-Message-State: AJaThX6gEqEmFtlyH1LYwyNpTCRql1hsfdHfg3qHGhAB9sFR0BJhf+3W
 hFuuqVxXkFHPIkIB5YMnug==
X-Google-Smtp-Source: ABhQp+TdSaKChm7iaZWjy2OPPurfmLQXBkqJi5s5aSK9WB4VXh6tkfAsHOi3lTgJLR9St2Trj0nJAQ==
X-Received: by 10.157.20.101 with SMTP id h92mr9610442oth.185.1510007991463;
 Mon, 06 Nov 2017 14:39:51 -0800 (PST)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id g33sm6465364oth.51.2017.11.06.14.39.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Nov 2017 14:39:50 -0800 (PST)
Date: Mon, 6 Nov 2017 16:39:50 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de,
 avifishman70@gmail.com, brendanhiggins@google.com,
 raltherr@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
Message-ID: <20171106223950.ophliqmm7tz7aglu@rob-hp-laptop>
References: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
 <1509985716-25759-3-git-send-email-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509985716-25759-3-git-send-email-tmaimon77@gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
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
X-List-Received-Date: Mon, 06 Nov 2017 22:39:55 -0000

On Mon, Nov 06, 2017 at 06:28:36PM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton NPCM7xx timer.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt

Acked-by: Rob Herring <robh@kernel.org>
