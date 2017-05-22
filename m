Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wWfCl0P5wzDqLj
 for <openbmc@lists.ozlabs.org>; Mon, 22 May 2017 23:10:27 +1000 (AEST)
Received: by mail-oi0-f67.google.com with SMTP id w10so22591549oif.1
 for <openbmc@lists.ozlabs.org>; Mon, 22 May 2017 06:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RUXLNviOYyZu9KZrTanfULM0LVlr4N0g7ZxPD08T29A=;
 b=Ox157v1UauXpkVLNPS8DLpJ1Y03dD4mBwxVOPOchRzQV3dllucWj3BfC9d6ACPnWpp
 T65lCTfmUkGAn6PISNNt1SfzjP8HgabXMdNSg8onOLzpjBqYGj9dCd4JKoR1o3edrECn
 Si2BIeZDtvLNxegYOx0Z9MDYyPi5leClxcRgl+jJ6nOXEMPaLEq7eqLe6V1EsiBhbYl7
 xKT7lfEerDAldt1LWL9ebqSt08Hk+KRla7Rz8hSXeizdF0qBnd5hVUeJIqlApgLv3pvs
 7XWyKYhoVOaZP/SwC3Dz8+8hOsupeC1X/BgffsFlUOEAc36xijNTpnxx1VJti8g1bCGd
 8lVg==
X-Gm-Message-State: AODbwcDPzJR5aTekqabfN6xDI7rxH/JHjRRO9nzbl07gUcULLo8fuaCD
 INjslKoWQGA8tQ==
X-Received: by 10.202.84.205 with SMTP id i196mr12043256oib.145.1495458624925; 
 Mon, 22 May 2017 06:10:24 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id q206sm4779666oia.2.2017.05.22.06.10.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 May 2017 06:10:24 -0700 (PDT)
Date: Mon, 22 May 2017 08:10:23 -0500
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH RFC v2 1/2] Documentation/devicetree: Add specification
 for FSI busses
Message-ID: <20170522131023.rawtmyrdalxvobrd@rob-hp-laptop>
References: <1494910285-20856-1-git-send-email-jk@ozlabs.org>
 <1494910285-20856-2-git-send-email-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494910285-20856-2-git-send-email-jk@ozlabs.org>
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
X-List-Received-Date: Mon, 22 May 2017 13:10:27 -0000

On Tue, May 16, 2017 at 12:51:24PM +0800, Jeremy Kerr wrote:
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
> 
> The FSI core will be responsible for matching probed slaves & engines to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.

Missed this the first time, "dt-bindings: fsi: " is the preferred 
subject prefix. No need to respin just for that.

> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt

Acked-by: Rob Herring <robh@kernel.org>
