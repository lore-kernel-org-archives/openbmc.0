Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.161.195; helo=mail-yw0-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
 [209.85.161.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Kr1D5dp5zF1Qt
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 02:58:40 +1000 (AEST)
Received: by mail-yw0-f195.google.com with SMTP id l189-v6so936000ywb.10
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 09:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QEXNpG/vDHGqfqStbO0/PXbKZ26mJWba5U5as7wGSis=;
 b=U8+2OD1NeaQESQwcmDHAY1igbFqNo+bNLu9bAWyNoqAIrnfVANPBV7TaWGzkSOUJ29
 cBZOVRy+9RJpBVAuRkNch1P6tTFSANoY7kexV9St1NjCjO5lXrtnW67M+EHgteKLWl7x
 kgwM6DTUu1uv/b+7CtbQCRzFuAMAc0myf00yWnVKHETd4BhhGwc8ZOureMCq1TtINQV5
 exJGd8S6gHT+pab3Xyu8gwY61a3jy5p7R+6/lXqgFrunfNCbzRzcutLsCs4nJvxZtz6T
 mS5StOUZaCNbEHgehqK39dJVCupogr/qTEjYzqprH8Y9RMLG+dNZrERAwBFqar9CUNm0
 ctBw==
X-Gm-Message-State: APt69E07nxbkRqfIOtRNd9iMLgdM2/HdiV+YcNLY0PH6esMRuKuow75D
 K10hafrldhA4OeN53mOpMw==
X-Google-Smtp-Source: AAOMgpdG5wDVXH1i91Kef7yh3QpAbuoqG+p5OQb7/gbOIl6tUw0jciXjZAZbsTON07Hye+1xIiNn8Q==
X-Received: by 2002:a81:3a04:: with SMTP id
 h4-v6mr15156522ywa.60.1530637117757; 
 Tue, 03 Jul 2018 09:58:37 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id j128-v6sm526307ywf.9.2018.07.03.09.58.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 09:58:37 -0700 (PDT)
Date: Tue, 3 Jul 2018 10:58:35 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH linux-next v6 07/13] dt-bindings: mfd: Add a document for
 PECI client MFD
Message-ID: <20180703165835.GA18160@rob-hp-laptop>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
 <20180621194054.20897-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180621194054.20897-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 16:58:41 -0000

On Thu, Jun 21, 2018 at 12:40:54PM -0700, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document for PECI client MFD.

This and the next patch still have the same issues I've outlined in at 
least 2 prior versions.
 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> ---
>  .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/intel-peci-client.txt b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> new file mode 100644
> index 000000000000..cb341e363add
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> @@ -0,0 +1,34 @@
> +* Intel PECI client bindings
> +
> +PECI (Platform Environment Control Interface) is a one-wire bus interface that
> +provides a communication channel from PECI clients in Intel processors and
> +chipset components to external monitoring or control devices. PECI is designed
> +to support the following sideband functions:
> +
> +- Processor and DRAM thermal management
> +- Platform Manageability
> +- Processor Interface Tuning and Diagnostics
> +- Failure Analysis
> +
> +Required properties:
> +- compatible : Should be "intel,peci-client".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients starts from 0x30 based on PECI specification.
> +
> +Example:
> +	peci-bus@0 {
> +		compatible = "vendor,soc-peci";
> +		reg = <0x0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		peci-client@30 {
> +			compatible = "intel,peci-client";
> +			reg = <0x30>;
> +		};
> +
> +		peci-client@31 {
> +			compatible = "intel,peci-client";
> +			reg = <0x31>;
> +		};
> +	};
> -- 
> 2.17.1
> 
