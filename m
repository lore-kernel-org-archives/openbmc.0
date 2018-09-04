Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.68; helo=mail-oi0-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424SY13DsqzF3MP;
 Tue,  4 Sep 2018 23:36:36 +1000 (AEST)
Received: by mail-oi0-f68.google.com with SMTP id m11-v6so6740181oic.2;
 Tue, 04 Sep 2018 06:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to:status:lines;
 bh=YlFbnsToxsnpc3NjnngPfpOYy7SJWqr5vXFP23sEd6A=;
 b=RERckqACBzhI/LtPrChCVyJ43p+qDJ3lHPAbm5aBWO22qvSgXf61KmGO0CV/m8bgUg
 3yFF3WBsQhrYx0fg1Kdd75JuZubsfvtiPU/OqAXzwaZaT9q2eyHqlazrjCsfsM7CS7da
 OFb7v3uJ4V60vazmdoWGxFy0sTONZ8dGEQXCATDVeOQcNFeRy3zVpl9EHWm74K4OMCXW
 cxU4ta1dK39SvdjPtnZW/2oW9UhUl7+SIWCPKDMZpM58VgfCikLz1SamE7O401iyMiCi
 Fk9L/WE9bslO9jClycY4zqOfl6DNYovDpjdJEmJwqnRdFUi5qsAlGbWoxw/ghUdjKRo6
 OpTQ==
X-Gm-Message-State: APzg51Brxn82woQT9uW1j6YZENHBbCl2a68HB68dYqcAktH0yb99DNpe
 /7N5l0TS/sdXvdo0hSe+Yg==
X-Google-Smtp-Source: ANB0VdbEc8By2fChLJ5rGmeh9p5+H565YqHXOZv+e/2nnZPmJZDYziJNr9Gfqh1APRQhbKfgCRBjew==
X-Received: by 2002:aca:e6cd:: with SMTP id
 d196-v6mr23701051oih.94.1536068194895; 
 Tue, 04 Sep 2018 06:36:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t3-v6sm12493498oie.52.2018.09.04.06.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Sep 2018 06:36:34 -0700 (PDT)
Message-ID: <5b8e8a62.1c69fb81.6801.2c0d@mx.google.com>
Date: Tue, 04 Sep 2018 08:36:33 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] clock: aspeed: Add VIDEO reset index definition
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
In-Reply-To: <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org, joel@jms.id.au,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, Eddie James <eajames@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 04 Sep 2018 13:36:38 -0000

On Wed, 29 Aug 2018 16:09:30 -0500, Eddie James wrote:
> Add an index into the array of resets kept in the Aspeed clock driver.
> This isn't a HW bit definition.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  include/dt-bindings/clock/aspeed-clock.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
