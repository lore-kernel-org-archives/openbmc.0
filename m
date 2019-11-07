Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477lhY3hNpzF5nT
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 12:10:53 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id y194so491256oie.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 17:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h3DM1+XLE8gggufePDpkJkrNK38nTztCPScUKfD75qo=;
 b=Y51/Vl7XDz478ztEx4T4DqSfwrgJpQpBusiuDuSC01ZLHNS5j4dIknj1Fsmh4GVL+d
 7ec8+wtFYkJD7K8Y+Jw9xAr5caaBlbjbvESBBnXlN+3+Ewz7xNYeo5Fd16Gsa3NV3pI8
 jNuyq8c8eE/RHC2XuxNXhrjorsDXpIIXuBKLMj3DBZoEfhmO1Q9soko59yhrkgZIwoU5
 u55c/QMT3QJrTldmYD3lauDCawL+5j3tFOy9L6bqrMo7Ot9FGt7KTK6ZaMYWgIFlZAg3
 QqTuQavF9cOl8gBCyyP0b1Q0JBtGKUnSuNPQ8/T5FRMDUNXDIsw79EHhe7g3ee+z7fp6
 jz6g==
X-Gm-Message-State: APjAAAUp42X3TCdKl2PLlPLSQ9bSoJ/V6ydi++p69B2XRbwcXdIz5ReT
 NOEpltBzsuNa1omBlfqpjA==
X-Google-Smtp-Source: APXvYqwm8iRGZ85Vo8mOJRNZ2JHzKFeDGUUzq4vJ6mf4SrinSza+86cRCVi3GgEuKL5IAcdTM3hOaQ==
X-Received: by 2002:aca:d888:: with SMTP id p130mr777850oig.165.1573089050283; 
 Wed, 06 Nov 2019 17:10:50 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 38sm248825oth.19.2019.11.06.17.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 17:10:49 -0800 (PST)
Date: Wed, 6 Nov 2019 19:10:49 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: reset: add NPCM reset controller
 documentation
Message-ID: <20191107011049.GA18656@bogus>
References: <20191106145331.25740-1-tmaimon77@gmail.com>
 <20191106145331.25740-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106145331.25740-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Thu, 07 Nov 2019 01:10:53 -0000

On Wed,  6 Nov 2019 16:53:29 +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM reset controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/reset/nuvoton,npcm-reset.txt     | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
