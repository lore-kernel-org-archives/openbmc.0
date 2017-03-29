Return-Path: <robherring2@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
 [74.125.82.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vt7zF6KnJzDqY6
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 11:33:29 +1100 (AEDT)
Received: by mail-ot0-f196.google.com with SMTP id y88so91723ota.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 17:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vqPs6eQKd7MkiP+8IXyO0sBAcu75Frnk8cRoAQ3sQLA=;
 b=b5JtAx/AQC+UonPdEdNUgNOVdNQj1F5WIy2R8DFPd1odVImJ1WCe+3VpPrBrGEG8MF
 L75Vz/0ZD1EnccB+yc5bmw6WXXvT81qwFHg/fm9oOSD7cvTiZPVvLcF6axRdgpqW+EMY
 5ih2qwvlOhtN4fANMyvRBKS4x7mV1zWJ4oYUoNdr3SmMl514Q5meqS4FPgxCVlfdZo8z
 Xzm9ogDwHMxhIwGwN9UGMWWnPfpaM1fpeGMn0aYiAq+uJF6HaRxQwUyZCf5xMX2q8iso
 TyjCWp3GC8M658nYMZYcoyDFEZTgCaBcmUj4vOgUxvB1udxjLYHEzGgMeJnaa9qSf4ka
 l2Kg==
X-Gm-Message-State: AFeK/H02EQX6AgCX7tW2HkNmSGoyBU7keDK6NBerRjCDtIrQWl47WpmxTGmJt23fjfeUog==
X-Received: by 10.157.46.10 with SMTP id q10mr18402861otb.28.1490747607835;
 Tue, 28 Mar 2017 17:33:27 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id u100sm2526288ota.12.2017.03.28.17.33.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Mar 2017 17:33:27 -0700 (PDT)
Date: Tue, 28 Mar 2017 19:33:26 -0500
From: Rob Herring <robh@kernel.org>
To: Rick Altherr <raltherr@google.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: Re: [PATCH v2 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed AST2400/AST2500 ADC
Message-ID: <20170329003326.hhz6qz4o5vorugnh@rob-hp-laptop>
References: <20170321204828.31303-1-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170321204828.31303-1-raltherr@google.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Wed, 29 Mar 2017 00:33:30 -0000

On Tue, Mar 21, 2017 at 01:48:27PM -0700, Rick Altherr wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
> 
> Changes in v2:
> - Rewritten as an IIO ADC device
> 
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt

Acked-by: Rob Herring <robh@kernel.org>
