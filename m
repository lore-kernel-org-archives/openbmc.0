Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LnCg6Tp1zF388;
 Fri, 28 Sep 2018 06:56:15 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id k64-v6so3404107oia.13;
 Thu, 27 Sep 2018 13:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P9AAgp1aJCtiE2iLY0ITsG/CFSqTHj/NZRI7o5wIkE0=;
 b=Q27YFDXIea4q2rxQfvHWh+VD14qSEb7GvN2VJmZiEeY8c02aCpyr9RbQsB2ZS2ZrJp
 KxufCA0yQq8yCApLvFyy5q9GE5okxdZFYApAQYxe+OV1raGizTdLjeA2lt1m8vSbKSIB
 oK8c0VLJjX2JFSQadkwSCmcTlg7El1eU8Renv8yZ83kmLNFDlY9/SD+8o73IuVutHKbE
 0Sqxu5p2JFz60NrqPH/SF9N4+68QJb4laDU/HmJapEkeE/wl4UpVn3tq4rVKpetqvSX1
 efdaMqd4AGAukmJxSoHjrzeLtjFQbQM9FEKB8JhuV5v0wK7lAOQvq1I4DnHrNoD+GRVk
 VpSA==
X-Gm-Message-State: ABuFfogocg/VvcmMWqniwO+OgqTGs7qhdR15iQ8GOgl97Uv/l/rh4Y6Q
 Wz3bX4w4bD8RFNyXN0a/xw==
X-Google-Smtp-Source: ACcGV61YOWnQaCv31JfgfMNgpRP15DW5Bok1sGEErY1wVBO2irIPDRnyxzlrfpAU48HlhOsGSPV2uA==
X-Received: by 2002:aca:3946:: with SMTP id
 g67-v6mr4294416oia.145.1538081772272; 
 Thu, 27 Sep 2018 13:56:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y131-v6sm553144oie.25.2018.09.27.13.56.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Sep 2018 13:56:11 -0700 (PDT)
Date: Thu, 27 Sep 2018 15:56:10 -0500
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
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH i2c-next v3 1/3] dt-bindings: i2c: aspeed: Add 'timeout'
 property as an optional property
Message-ID: <20180927205610.GA29022@bogus>
References: <20180926215842.23125-1-jae.hyun.yoo@linux.intel.com>
 <20180926215842.23125-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926215842.23125-2-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 27 Sep 2018 20:56:17 -0000

On Wed, Sep 26, 2018 at 02:58:40PM -0700, Jae Hyun Yoo wrote:
> This commit adds 'aspeed,timeout' property as an optional property
> which can be used for setting 'timeout' value of
> 'struct i2c_adapter'. With this patch, the timeout value can be
> set through an I2C_TIMEOUT ioctl on cdev, or through this optional
> DT property.

Isn't controlling this from userspace or relying on a default 
sufficient?  I can't see this needing to be highly tuned for each 
platform.

However, if we do have a property, it should be common.

> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index 8fbd8633a387..d6965b360fbc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -17,6 +17,9 @@ Optional Properties:
>  		  specified
>  - multi-master	: states that there is another master active on this bus.
>  
> +- aspeed,timeout : I2C bus timeout in microseconds defaults to 5 seconds when
> +		   not specified.
> +
>  Example:
>  
>  i2c {
> -- 
> 2.19.0
> 
