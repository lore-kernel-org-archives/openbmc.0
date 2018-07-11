Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.66; helo=mail-oi0-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QqmS5zLSzF35T
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 06:04:55 +1000 (AEST)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so51572597ois.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 13:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dQ8H2HVFwVfDiaJrxri6wk8T+W0EVfKM0qsQ/mg1e4Y=;
 b=rjVDy2to9YpXtAMBmrLts3RMyWOdJhSqnNoN0WBEyBLLRDp2iN8U/CxmpxepsMxWCY
 9/iLah5iGUDzddsgpIOGlTknXD9+8QcB6UuEVofsv32kA4MNtW5xRGBw4I5Xn3GXyTM5
 IYG7icBBv0afchiPKwgVuipwz3pwTl9GJbGYXnCKSc0e5heZnET8M3n2sKpheHOWPJgJ
 yOQhxAh6qiNcoTUrCFRRdeUDDeyANCN6r63xfRPYfaf7qkcIAHkAJvV88m7AZh4QzOSi
 XEBbm7Z0E72SmlGiH/TuziLleou6/IiXtbIe259adcAwHpRO+fML8wAo/dX3+HBBC/Nd
 Y4rg==
X-Gm-Message-State: AOUpUlGgxxBURuV5ge7JAoofJq8Nw91qp1FnIIHof5W9g+DdY1ZlAzOw
 dGVs/bfey2kMVBWHDA/nKQ==
X-Google-Smtp-Source: AAOMgpcossIziFliTJNBpzDoAjSHXatxr1HTjquuNYHlE5izi2IsKzDcaTvIXlxp1wkwWkqpix6LHg==
X-Received: by 2002:aca:3bc2:: with SMTP id
 i185-v6mr100787oia.156.1531339492590; 
 Wed, 11 Jul 2018 13:04:52 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id d8-v6sm17792777oif.39.2018.07.11.13.04.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Jul 2018 13:04:51 -0700 (PDT)
Date: Wed, 11 Jul 2018 14:04:50 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 gregkh@linuxfoundation.org, Eugene.Cho@dell.com,
 a.amelkin@yadro.com, stewart@linux.ibm.com,
 benh@kernel.crashing.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
Message-ID: <20180711200450.GB17291@rob-hp-laptop>
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180711053122.30773-2-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 11 Jul 2018 20:04:57 -0000

On Wed, Jul 11, 2018 at 03:01:19PM +0930, Andrew Jeffery wrote:
> Baseboard Management Controllers (BMCs) are embedded SoCs that exist to
> provide remote management of (primarily) server platforms. BMCs are
> often tightly coupled to the platform in terms of behaviour and provide
> many hardware features integral to booting and running the host system.
> 
> Some of these hardware features are simple, for example scratch
> registers provided by the BMC that are exposed to both the host and the
> BMC. In other cases there's a single bit switch to enable or disable
> some of the provided functionality.
> 
> The documentation defines bindings for fields in registers that do not
> integrate well into other driver models yet must be described to allow
> the BMC kernel to assume control of these features.

So we'll get a new binding when that happens? That will break 
compatibility.

> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> 
> Since RFC v1:
> 
> * Add a commit message
> * Minor changes to documented labels
> 
>  .../bindings/misc/bmc-misc-ctrl.txt           | 252 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 258 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/bmc-misc-ctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/bmc-misc-ctrl.txt b/Documentation/devicetree/bindings/misc/bmc-misc-ctrl.txt
> new file mode 100644
> index 000000000000..2c869fcc7ef2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/bmc-misc-ctrl.txt
> @@ -0,0 +1,252 @@
> +BMC Miscellaneous Control Interfaces
> +====================================
> +
> +Baseboard Management Controllers (BMCs) often have an array of hardware
> +features that need to be described but are awkward to sensibly expose.
> +
> +This bindings document provides a generic mechanism for describing such
> +features, covering read-only (RO), read-modify-write (RMW) and
> +write-1-set/write-1-clear (W1SC) semantics.

If we wanted a generic mechanism for single register bits/fields in DT, 
we'd have one already. A node per register bit doesn't scale.

Maybe this should be modelled using GPIO binding? There's a line there 
too as whether the signals are "general purpose" or not.

Rob
