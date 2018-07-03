Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.213.194; helo=mail-yb0-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
 [209.85.213.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KqmR6TtyzF1MY
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 02:47:35 +1000 (AEST)
Received: by mail-yb0-f194.google.com with SMTP id i3-v6so980970ybl.9
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 09:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zAuH4LH1gGeLkLg1XUekchSwnDFdQ8jOV8OkLjv4TjU=;
 b=ecifK1ufNjt8YixnEJAz2e/wxt4qcfGlhibm5zeRVWAj7iAYQz27ljMXoIk7Nvm4HX
 1BC519wB2/9emm4+IzBrrQOhbHUJ43GY1gDetfZOt35GZ5kD8ua1UBriNL03b+sJPHVY
 QRl8KVKU2USpRbNOupfmSHkirVDWtuU/uJsTCCSsITXNIjuIYV0vd+9jMwF/+iqxIiTg
 E36QN0zYmPJEdT1dVbeEjWMqNzTrCgdLeGyvgF8p+yFGRPmgu1zDjjaUZ0rRSUFTZj8Y
 cKlL918+uyDa917aN2fE09YhaJLXIwkQgeyVM6IpB2fAsqWE+4V6z6DjyZ1ASqUobg2E
 cwSA==
X-Gm-Message-State: APt69E2jloGxqQGl0Xw4/I4yeH/ih9Y/e6tdXNBkZJAbNUF/vk31nxce
 3AXAfW2sCo0Su18RVnfbDA==
X-Google-Smtp-Source: ADUXVKKU0PYMF9GX8+tgI4fGfUlk0bGLGlb+o39Y2LuVyCbUTpSaMd5+APV6cLlHz4RmRMkzzpWeNQ==
X-Received: by 2002:a25:da11:: with SMTP id
 n17-v6mr16135444ybf.409.1530636453408; 
 Tue, 03 Jul 2018 09:47:33 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id x129-v6sm501002ywe.61.2018.07.03.09.47.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 09:47:32 -0700 (PDT)
Date: Tue, 3 Jul 2018 10:47:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux-next v6 01/13] dt-bindings: Add a document of PECI
 subsystem
Message-ID: <20180703164731.GA9150@rob-hp-laptop>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
 <20180621193947.20645-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180621193947.20645-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 03 Jul 2018 16:47:36 -0000

On Thu, Jun 21, 2018 at 12:39:47PM -0700, Jae Hyun Yoo wrote:
> This commit adds a document of generic PECI bus, adapter and client
> driver.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/peci/peci.txt         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci.txt
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci.txt b/Documentation/devicetree/bindings/peci/peci.txt
> new file mode 100644
> index 000000000000..5583aa80b78a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci.txt
> @@ -0,0 +1,60 @@
> +Generic device tree configuration for PECI buses
> +================================================
> +
> +Required properties:
> +- compatible     : Should be "simple-bus".
> +- #address-cells : Should be present if the device has sub-nodes.
> +- #size-cells    : Should be present if the device has sub-nodes.
> +- ranges         : Should contain PECI controller registers ranges.
> +
> +Example:
> +	peci: peci@10000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x10000000 0x1000>;
> +	};

I don't think you need this section. It's just the parent of the 
controller, right?

> +
> +Generic device tree configuration for PECI adapters
> +===================================================
> +
> +Required properties:
> +- #address-cells : Should be <1>. Read more about client addresses below.
> +- #size-cells    : Should be <0>. Read more about client addresses below.
> +
> +The cells properties above define that an address of CPU clients of a PECI bus
> +are described by a single value.
> +
> +Example:
> +	peci0: peci-bus@0 {
> +		compatible = "vendor,soc-peci";
> +		reg = <0x0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +Generic device tree configuration for PECI clients
> +==================================================
> +
> +Required properties:
> +- compatible : Should contain name of PECI client.
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
> +			compatible = "vendor,peci-client";
> +			reg = <0x30>;
> +		};
> +
> +		peci-client@31 {
> +			compatible = "vendor,peci-client";
> +			reg = <0x31>;
> +		};
> +	};
> -- 
> 2.17.1
> 
