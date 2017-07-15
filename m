Return-Path: <robherring2@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
 [209.85.213.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x8XC22VzYzDqlC
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2017 11:33:50 +1000 (AEST)
Received: by mail-yb0-f193.google.com with SMTP id j80so713883ybg.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 18:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hjeNnGGHnjcUGxoZYoCr2RzGpGA2n2GWI8ntBhM2qEw=;
 b=GNoFatbMvaQ/jBnPlQPf0rvfupqrBc7nErQgv9UbcyHHdTevfQ8twBZAlRY/8S7heX
 r2hn/0s9n34AgiBq8LZ9MsMz2IGFXegcj/ZCtZtFn3u4Y+Zkt6wWmCzsG6U7vAz3LRg5
 MaB/VVYbqKfKXlYY7WJVd5aRf3Oejonp1xZOsl4y+T0RcFO3HGgdeYhHch8SUKImEMUe
 TexslOS7xWzyQu/UAKs3REzZPim/fCBg+eaAf6peEM5R5C/uRzgQVOIu8DKJ7A7lN0eT
 j0TiRBo7Rf56Tc/OerFbd//GOl8bA/udq3VhqGxaaVAkUWqc554B7ZvESCj4FH05QAdo
 Kvcg==
X-Gm-Message-State: AIVw110tpjeiH79IjpRJ8nwoVQAJR2P1XfQJ/FNPexry34/vRrd9h1s1
 nxxZj7HlcCcMUA==
X-Received: by 10.37.171.238 with SMTP id v101mr8979108ybi.187.1500082428078; 
 Fri, 14 Jul 2017 18:33:48 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id m30sm3786363ywh.29.2017.07.14.18.33.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Jul 2017 18:33:47 -0700 (PDT)
Date: Fri, 14 Jul 2017 20:33:46 -0500
From: Rob Herring <robh@kernel.org>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: Re: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Message-ID: <20170715013346.fgqysvlu2prts7zn@rob-hp-laptop>
References: <20170711131827.64045-1-c_mykolak@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170711131827.64045-1-c_mykolak@mellanox.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Sat, 15 Jul 2017 01:33:50 -0000

On Tue, Jul 11, 2017 at 04:18:27PM +0300, Mykola Kostenok wrote:
> This binding adds description for interface supporting
> aspeed-pwm-tacho driver cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control.

Bindings are for devices, not drivers.

 
> It adds extra level of hierarchy -  for tachometer channel
> with fan subnodes and pwm channels with pwm subnodes.

Why this binding was just added and now it is changing?

> 
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56 ++++++++++++++++++----
>  1 file changed, 47 insertions(+), 9 deletions(-)
