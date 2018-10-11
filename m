Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.195; helo=mail-oi1-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WQDS3MPFzF3Jw;
 Fri, 12 Oct 2018 09:11:52 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id e17-v6so8353561oig.12;
 Thu, 11 Oct 2018 15:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5IgkOnyfQn8kd4GLJBdpgH9aUY5eeO9hCm+RmfPDebc=;
 b=d2jgvBz3aHb1G/gspnKwWn/eAxCoscDP+xmmZwgs/obByqcZDdhUfTCU4fp2iw1aXX
 v7NSympkF+EErHSpbcW8ttqgNqOHYF4bw7IHrQxhFa7J1jisFqbgEOHcdDdGW9zbZS3p
 kxpE5hhG+zNnUzHqJrS24DYFMfY5WTQQG1VX2LKhjIpG1uyHF926Y19OQ21xMPKcMcTS
 lcBLtz/n9tG4lB8k1wNOscqRr0sRMvxv+lO/kze5wqjSUbU+AshExR/8SMA3y8+a5tZk
 7FJoa2nx0H0M/v7ORkAI1HUJt8SB+82NN7oEBhNV6khG6CRNBTPoQXJhn2icpCF898eJ
 wOAg==
X-Gm-Message-State: ABuFfoiaDNu9bXtPJGLprUWzn4nG0+HHIqEngnsVTTW9GGpVKOVTEql4
 35ZJW3Ejgs8Fjx2YI7o/Ww==
X-Google-Smtp-Source: ACcGV62UQfFLSxzsm9fr8HwPNIiEgew7AugNOfbqMg0E/2hc3kbI8cyaOq3kvqAF18xudSd+oolhRw==
X-Received: by 2002:aca:a89:: with SMTP id k9-v6mr1954016oiy.297.1539295910119; 
 Thu, 11 Oct 2018 15:11:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k68-v6sm2629059oib.35.2018.10.11.15.11.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Oct 2018 15:11:49 -0700 (PDT)
Date: Thu, 11 Oct 2018 17:11:48 -0500
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
Subject: Re: [PATCH i2c-next v7 1/5] dt-bindings: i2c: Add 'bus-timeout-ms'
 and '#retries' properties as common optional
Message-ID: <20181011221148.GA31195@bogus>
References: <20181005214507.26315-1-jae.hyun.yoo@linux.intel.com>
 <20181005214507.26315-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005214507.26315-2-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 11 Oct 2018 22:11:53 -0000

On Fri,  5 Oct 2018 14:45:03 -0700, Jae Hyun Yoo wrote:
> This commit adds 'bus-timeout-ms' and '#retries' properties as
> common optional properties that can be used for setting 'timeout'
> and 'retries' values of 'struct i2c_adapter'. With this patch, the
> bus timeout value and the master transfer retries count can be set
> through these properties at the registration time of an adapter.
> Still the values can be set by I2C_TIMEOUT and I2C_RETRIES ioctls
> on cdev at runtime too.
> 
> These properties may not be supported by all drivers. However, if
> a driver wants to support one of them, it should adapt the
> bindings in this document.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
