Return-Path: <robherring2@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
 [209.85.161.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHZsr5CNzzDvdG
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 02:57:36 +1100 (AEDT)
Received: by mail-yw0-f196.google.com with SMTP id b66so7271286ywh.2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 07:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pWSUytCgVgirQnoiwbsWUjDSE6eP/MQRCh6peoP3vxE=;
 b=aPlMalhXuhRIDPe4TkYwZGZhL4NXznikZ1jfAGEp5t/nnQlYqOA1HTEKETIu+5RFXw
 USTdCz91L+hbe4ASVGB+DQXii2JKcsJ9s0ou0Sqvyt8BL45D4e6Hi+vUx1qDoMJyD6yT
 08moR8mpTKhWGCGdNBeETRB/9udS9y22TwLf+RyJlyiuNA2K3AZcHfJHPAB17D+ZbNIC
 Ei8q/SPj7IdsMxTM83tQ2ltlbdFbrz9fT2VSRcO/FVKTrzkrUGtZlGu4ONOjk6AVNGyZ
 W1dlQOOEaeQL9/15YUfXPKo/CB8oHd+M+ZbklFGgRucZYxWmsrmTwQfEJTQVmwhLgwNN
 InSw==
X-Gm-Message-State: ABUngvcYaQpLWknRP2WTO4IjD38cuvgq+1etAmQeztPUpRciqad9K3t3OvGwe9fbjtg1fg==
X-Received: by 10.202.190.138 with SMTP id o132mr8281230oif.166.1479139052771; 
 Mon, 14 Nov 2016 07:57:32 -0800 (PST)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 9sm7411029otm.41.2016.11.14.07.57.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Nov 2016 07:57:32 -0800 (PST)
Date: Mon, 14 Nov 2016 09:57:31 -0600
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20161114155731.p4kxmefqevplphtd@rob-hp-laptop>
References: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
 <1478311099-6771-3-git-send-email-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478311099-6771-3-git-send-email-brendanhiggins@google.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Mon, 14 Nov 2016 15:57:37 -0000

On Fri, Nov 04, 2016 at 06:58:19PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C controller and
> busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - None
> Changes for v3:
>   - Removed reference to "bus" device tree param
> Changes for v4:
>   - None
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

Acked-by: Rob Herring <robh@kernel.org>
