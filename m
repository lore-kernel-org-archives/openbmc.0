Return-Path: <robherring2@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
 [209.85.192.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSvnG2lFbzDqs4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 03:11:46 +1000 (AEST)
Received: by mail-pf0-f193.google.com with SMTP id c65so1220705pfl.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 10:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qVIaZ5A1mLN4rJhndkcrmse+BPYHLnmXV5ECg05qBE8=;
 b=HLjzeGZLfWvWJwG9xoUH34dp1YvOeSv13c0rUVYCfA3r4ibo0lL0ZkTcPxTABbTrvW
 N7YCN5ORMXWpTYJOTPIk/ETn+8TTvPjjEaFRq/oS92bhM4GMNo9f5eMhR9FW+UA8uW+s
 B5izai+fkTZqQuR9rAcfvp0RqQ0YRUvaYPPAsGqxRpcftBvW5SVl2EIjg9MdWwEU5mDN
 kF12WgU9hj5tUmk5hV6jKCy/NnJdY3PmTItIZ/xOqK+yvcUgxgwSs7gbM5hisBJQ7wpv
 inmgLbKTGZj9DGtTHl/mFML2gtmyWZwAx4fbDUCyPHsFh2dVJCwC4E9vFyZeSdONQo8V
 5ffA==
X-Gm-Message-State: AHYfb5h14XUIGRl/DbjvTuoSjtJ04mZ0Rv3kcUNZ++PpkYULXec2LOZi
 jlTkZchKC8OOxA==
X-Received: by 10.98.63.10 with SMTP id m10mr13275175pfa.232.1502385104268;
 Thu, 10 Aug 2017 10:11:44 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id v78sm15136864pfd.121.2017.08.10.10.11.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Aug 2017 10:11:43 -0700 (PDT)
Date: Thu, 10 Aug 2017 12:11:42 -0500
From: Rob Herring <robh@kernel.org>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
Message-ID: <20170810171142.zwlnagp7c52p4r5e@rob-hp-laptop>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170803084650.22298-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 17:11:47 -0000

On Thu, Aug 03, 2017 at 11:46:50AM +0300, Mykola Kostenok wrote:
> It's add support for cooling device creation to
> aspeed-pwm-tacho.
> Cooling device could be bound to a thermal zone
> for the thermal control.
> 
> v1 -> v2:
>  - Fix commit message.
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
