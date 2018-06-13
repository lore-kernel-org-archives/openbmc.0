Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::243; helo=mail-wr0-x243.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="bwbN/Q6V"; 
 dkim-atps=neutral
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415Gjr0YLczDrpC
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 16:16:43 +1000 (AEST)
Received: by mail-wr0-x243.google.com with SMTP id k16-v6so1376233wro.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=iDK+1EUPLUB7R8V3Kbss7QTSO3E9BRgNyrHpzR7Abmg=;
 b=bwbN/Q6VMOqXDC7et1lDb5dy7cemHjUVgmfnxNMgvC6/Zs3JX7iwOdJzMRrlhv7CLM
 WQDgiEJ5WfTNE7F/xs4XvKDJxG39hp74NdZeRgZ1KOHdj2y4OyjmDqQC9Bh7wOZcBLWb
 gtyafu5zLi6htCxxIZsO7qO0wEm0lY5BJyr9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=iDK+1EUPLUB7R8V3Kbss7QTSO3E9BRgNyrHpzR7Abmg=;
 b=gvZiJIdEcvt72yyG60GL2xRPEicxy03yTIh6BvALXEebYh0H+smMxJZwt2bEiArC2U
 QIAw1/z/sCuuyb3QDCC3D1ss5Tn8MGWOXnc/AXuviLwbNNgVMsafjueBtdeMXCulh3SK
 Vyh6jU+Oo4FOmse8sE4XkpArmqT6D0YEJP7Widg+7MEnpC7KyuLGjt+SQl0wMCtOj1Jh
 zJ0ruelPmkHhhTkJFqfvhzxbC91x9mAvMNOjCxoMtxKXU/MlGS+aQh8OLfznMMUbdSDJ
 GidxgPpKG/jo0ekFOhzfnmbj1hB5coo/X2ElmvvYRxY05jfscN9Soa9vwkxC1thyHTbV
 9UlA==
X-Gm-Message-State: APt69E0Zq/Hmi+UHYJWHLYBXSe4SerDsqybZJy4jLI1Wxa6ag0OgjKIf
 8ZBHs67+dukJdrU8GN8PJbQVNjm4trI=
X-Google-Smtp-Source: ADUXVKLc291Rg6xhYwyGlWiyy6CO6lhl0dgoef4uwp5BkvOkjAN/eHQ2n0BmKTeb0J2V3kaxSchvDA==
X-Received: by 2002:adf:98cf:: with SMTP id
 w73-v6mr3090176wrb.209.1528870599820; 
 Tue, 12 Jun 2018 23:16:39 -0700 (PDT)
Received: from dell ([95.149.160.78])
 by smtp.gmail.com with ESMTPSA id l10-v6sm2154321wrm.29.2018.06.12.23.16.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Jun 2018 23:16:38 -0700 (PDT)
Date: Wed, 13 Jun 2018 07:16:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for
 PECI client mfd
Message-ID: <20180613061637.GI5278@dell>
References: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2018 06:16:49 -0000

All s/mfd/MFD/

> This commit adds a dt-bindings document for PECI client multi-function
> device.

Multi-Function Device

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> ---
>  .../devicetree/bindings/mfd/peci-client.txt   | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/peci-client.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/peci-client.txt b/Documentation/devicetree/bindings/mfd/peci-client.txt
> new file mode 100644
> index 000000000000..4eb8f6bb6ca4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/peci-client.txt
> @@ -0,0 +1,23 @@
> +* Intel PECI client bindings

Now it the time to expand on what a "PECI client" is.

> +Required properties:
> +- compatible : Should be "intel,peci-client", "simple-mfd".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients is starting from 0x30 based on PECI specification.

s/is starting/start/

> +Example:
> +	peci-bus@0 {

0?

> +		#address-cells = <1>;
> +		#size-cells = <0>;

No 'reg' property?

> +		< more properties >

Remove this.

> +		peci-client@30 {
> +			compatible = "intel,peci-client", "simple-mfd";
> +			reg = <0x30>;
> +		};
> +
> +		peci-client@31 {
> +			compatible = "intel,peci-client", "simple-mfd";
> +			reg = <0x31>;
> +		};
> +	};

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
