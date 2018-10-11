Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WQF32NHDzF3Hw;
 Fri, 12 Oct 2018 09:12:23 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id y81-v6so8370261oia.6;
 Thu, 11 Oct 2018 15:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=srtI6elytVVzEeFwvIBe7kTajm0oksYdiEyNz9c15Co=;
 b=Px3Di77IGoc7NrfksDVGlabZlywzV+TC+KNbdrnnR/DNOgYrWKeLf4kcCS9BnA0Shc
 3pyrUP9wr87JrsIbkitLgDVT+ydczijZWwa5cZB590Fx8KfyuRQ21XKTJpfzb1qH20iD
 7chudYusRBXxislIKTzgtIkpVmRq6EVLMJ0sb+6ZL4kqHoCA8Nd17Pv4JLFqDkc9smAV
 gLgAonN7ATcawPrKJ3vhsMMEfG4LoEK7xAdWjDOa+TCazZPcEgE3EgauDm7D10nOHTpF
 v89Et+ya5PmWIUnc9FZNmYl8ykVxBuqLyPMgWeMil8EbddGm7NFlLx3UXaLhJaw8dZoC
 WZ/Q==
X-Gm-Message-State: ABuFfohIblJZJRwbGyMmw5p1CmlUflhui8D0Xx3aS3IWtCTA02jPxq6B
 2VErsk+guuiRmjoW3+rdfQ==
X-Google-Smtp-Source: ACcGV63Zz1tbzDAL0A3pjo0qJGDaPUjhTEb0G/DmNReDc1DgxxuBUBzOD4+0iQx6ltjgOj6KysPWTg==
X-Received: by 2002:aca:490b:: with SMTP id
 w11-v6mr1870035oia.126.1539295941003; 
 Thu, 11 Oct 2018 15:12:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z44sm9714872oti.38.2018.10.11.15.12.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Oct 2018 15:12:20 -0700 (PDT)
Date: Thu, 11 Oct 2018 17:12:19 -0500
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH i2c-next v7 3/5] dt-bindings: i2c: aspeed: Add
 'bus-timeout-ms' property as an optional property
Message-ID: <20181011221219.GA31991@bogus>
References: <20181005214507.26315-1-jae.hyun.yoo@linux.intel.com>
 <20181005214507.26315-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005214507.26315-4-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Thu, 11 Oct 2018 22:12:24 -0000

On Fri,  5 Oct 2018 14:45:05 -0700, Jae Hyun Yoo wrote:
> This commit adds 'bus-timeout-ms' property as an optional property
> which can be used for setting the bus timeout value of an adapter.
> With this patch, the bus timeout value can be set through this
> property at the probing time of this module. Still the bus timeout
> value can be set by an I2C_TIMEOUT ioctl on cdev at runtime too.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
