Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LdYJ05RfzDq74;
 Fri, 28 Sep 2018 01:10:59 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id e18-v6so2878230oti.8;
 Thu, 27 Sep 2018 08:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4rmAT+TBK8rmuU32ECuj5amVvTUzzKquEU5ecs/Pib0=;
 b=Xw3lwZVzIOYyA0J+Q1O+OEsIuO6cnxGXUtjHLti15f68EgNLVsO9T/jVcYMcMY2YvY
 zc3yxusr565b3t4m0pqr/67kbP56VuB0oKUu4rY8Oi61J/BtaPRkSGztjcH0Bc/Mipbj
 7KGPu2ET6h+y7mVX+tnoe0mBY+vcdW7Nlrzk8+hl7WM6crcreLNLXfRkGK5JdMZEB91R
 D3iCprVKOUtA9HKhisGTsf8l46HuEB0ZeUtcEwhF9zXdLrfsJuVQOw4apV2q8Z48XIlY
 ZAf2x8Rrek/6CU318McbzyEEruTGrr0P7R1hU5jFDd0fApp/wfsuoJFcaodCCGlPrzee
 5+Zw==
X-Gm-Message-State: ABuFfogPIrIXz5HcEZC/QZI1PLXQhMjA6Hu6TgD9iPQwFqTLFkse4FHe
 QayX2MPpmBve7/JVnMHw+g==
X-Google-Smtp-Source: ACcGV61g76UxA65ZDbzxsgKp4CtbiNcESZY+BgcpUeDL4lkLRoNHByZYugZEh+F0OIMO8rcioEsKNg==
X-Received: by 2002:a9d:2154:: with SMTP id
 l20-v6mr1603341otd.370.1538061056516; 
 Thu, 27 Sep 2018 08:10:56 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z33-v6sm832474otz.71.2018.09.27.08.10.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Sep 2018 08:10:55 -0700 (PDT)
Date: Thu, 27 Sep 2018 10:10:55 -0500
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v8 01/12] dt-bindings: Add a document of PECI subsystem
Message-ID: <20180927151055.GA11054@bogus>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180918215124.14003-2-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 27 Sep 2018 15:11:01 -0000

On Tue, 18 Sep 2018 14:51:13 -0700, Jae Hyun Yoo wrote:
> This commit adds a document of generic PECI bus, adapter and client
> driver.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> ---
>  .../devicetree/bindings/peci/peci.txt         | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
