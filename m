Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3rvt4J3CzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 05:49:13 +1000 (AEST)
Received: by mail-oi0-f67.google.com with SMTP id g204so14204686oib.2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 12:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=drwLbqthAUg428/WfbCagbLUdnR2peVIe0MU8Hknwxk=;
 b=E+qwtQwRjaYT99Y+XCAc5BQzle4u+ktxsrbWHu6AznUVVFPhikB9PR7nD3tK8fH48y
 b5ruNfbWjD5AJzezEIsXA3kSEgUhxGa7RMKRPsjFH/uDpls8AFgdIGA78w/btk9Fm0vF
 rC6KIAKzRC0SfSDoOQBdZeow/VIT6W/2ts0CSOol88JUjGSrDhfRFhJxi/K5fGAET2bx
 6W6xJr+/jXhjZkLVuZbvJVb39Sq7eP55VLJOwtqHFVJg0Dmcp8UGTotlsNIOy0MYLQZA
 g1HqniLsn+vc7jURRAjeHJpZA0GleILzCZSoIiyJGRKB8KJZFV2kYLk4j01Sthv8367A
 mO8g==
X-Gm-Message-State: AN3rC/7cIlfSMjiEJgZWMF8+vPtwnZ7oiZahYVGoIr6WLJero47LBR7m
 GVFK7B9iu2YE6Q==
X-Received: by 10.157.0.39 with SMTP id 36mr3044004ota.179.1492112951777;
 Thu, 13 Apr 2017 12:49:11 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id y67sm8936979ota.25.2017.04.13.12.49.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Apr 2017 12:49:11 -0700 (PDT)
Date: Thu, 13 Apr 2017 14:49:07 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/4] pinctrl: aspeed: Document pinconf in devicetree
 bindings
Message-ID: <20170413194907.x5ij6cehgb5dh6nj@rob-hp-laptop>
References: <20170407125713.15678-1-andrew@aj.id.au>
 <20170407125713.15678-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170407125713.15678-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 13 Apr 2017 19:49:15 -0000

On Fri, Apr 07, 2017 at 10:27:10PM +0930, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 40 +++++++++++++++++-----
>  1 file changed, 31 insertions(+), 9 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
