Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.65; helo=mail-oi0-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428GSv1WmSzF38s
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 04:16:14 +1000 (AEST)
Received: by mail-oi0-f65.google.com with SMTP id v198-v6so24316274oif.9
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 11:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DOtMaM82IZTVqmXs3l1GX72EOchfCwYYWv9WfsnCDJY=;
 b=ACg08oBrcJpNo4Yt8BjsFBCx9WgRrfEK+OsOqwEB5ptb2uaI34dYIik79zMVzt75LT
 Q7+LIPPBYv48N3Y8a3OMyD9xIL214jXXyh8e01gemhyGdY/YkpCGBYDoxInaI4U+l+gC
 mwg1cey9ZYdPnAmGQolma8FxbthpYNU41nrwbmlcF+2ePvJGrGn2YLkOYhKlV7+1GplC
 PsmX/jCMQifO/O46wz5GIi5WcPVlFWwg5xvkaEIYm9VhT9wRJdLow5Xkka90xzCicOuF
 dywtNLi9mTaXFSzKcfsRPR5IPV3EYmLKn2e847tAlpxSRLUuFhMYW40WbllzKDDKoIcc
 4VvQ==
X-Gm-Message-State: APzg51A+RYTSoglKr0Bcx44O4U2Z7qiyEnKlokliRu7s/Vz5GzeHKcwj
 O6d3qFhxNk1/7+9oUmIYkw==
X-Google-Smtp-Source: ANB0VdbCDZw7ooN+GHdDG5yYdDuT0ZrHtHvMVPzbGuQz58y8RfMzX7R9GM1cEsCdZrfHM742WcBlcw==
X-Received: by 2002:aca:cf44:: with SMTP id
 f65-v6mr24430067oig.356.1536603372478; 
 Mon, 10 Sep 2018 11:16:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s145-v6sm33180305oih.16.2018.09.10.11.16.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Sep 2018 11:16:10 -0700 (PDT)
Date: Mon, 10 Sep 2018 13:16:10 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 gregkh@linuxfoundation.org, mark.rutland@arm.com,
 linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org
Subject: Re: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device documentation
Message-ID: <20180910181610.GA5907@bogus>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 10 Sep 2018 18:16:15 -0000

On Thu, Aug 30, 2018 at 04:32:32PM -0500, Eddie James wrote:
> Document the bindings for the FSI-attached POWER9 On-Chip Controller.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> new file mode 100644
> index 0000000..46372f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> @@ -0,0 +1,15 @@
> +Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
> +---------------------------------------------------------------------
> +
> +This is the binding for the P9 On-Chip Controller accessed over FSI from a
> +service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> +nodes.
> +
> +Required properties:
> + - compatible = "ibm,p9-occ"
> +
> +Examples:
> +
> +    occ {

FSI slave devices are supposed to have an address according to the 
binding doc.

> +        compatible = "ibm,p9-occ";
> +    };
> -- 
> 1.8.3.1
> 
