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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Llrs2ZSSzF37q;
 Fri, 28 Sep 2018 05:54:52 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id k64-v6so3246588oia.13;
 Thu, 27 Sep 2018 12:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LxQxeMg3qQzlvwbSIdSa4I4cNVZis+K1vnNKhoQ57sA=;
 b=MUxbbS8pGgQ48ph3xLr2SbmWUvakZdH4XsyEHDqum5QEo8VFlDWRe8rYrp45vXDoAZ
 13HQDjEt28+fRhpXm2lXBZd9PMQ+IdKdXP8Q/V/Ho1fCRxxNISBQEkd1V1ZTbUDYcEYN
 n+giSbMpQ9FNBo/ohyHWiacxHEQ1dBO6LJPBDGZvx/Wmhys35uL6And4lZVUbIbiz4WG
 2SAam1sZLR7RLolTpX5fUywSIapxMgs/huAuU8sEom8D11wbQGUDSCh7oW72l+zss+RA
 OszPl51S0H3hcTQ/guPhsQePvsMJu3tzogsHjg5a4jnXrqOwJPpcVyqwB4aDJum0+w2v
 1qEA==
X-Gm-Message-State: ABuFfogYL3SiYqv/wPBnaCv50BnwdDXPUw9ccUysEz5zypyOqf4q1jo+
 6sxCp3PzUSxLJssA+KZ68w==
X-Google-Smtp-Source: ACcGV61MI3p0yxE/f+/x4wTKKwn+nM4MKUeCXPrVmjmzROMlUlm3XY/PtOI0XQf7USSAr2o89AMEEA==
X-Received: by 2002:aca:3946:: with SMTP id
 g67-v6mr4174992oia.145.1538078090206; 
 Thu, 27 Sep 2018 12:54:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v20-v6sm1057734ote.48.2018.09.27.12.54.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Sep 2018 12:54:49 -0700 (PDT)
Date: Thu, 27 Sep 2018 14:54:49 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 andrew@aj.id.au, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, joel@jms.id.au,
 hverkuil@xs4all.nl, Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add Aspeed Video Engine
 binding documentation
Message-ID: <20180927195449.GA25789@bogus>
References: <1537903629-14003-1-git-send-email-eajames@linux.ibm.com>
 <1537903629-14003-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537903629-14003-2-git-send-email-eajames@linux.ibm.com>
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
X-List-Received-Date: Thu, 27 Sep 2018 19:54:53 -0000

On Tue, 25 Sep 2018 14:27:08 -0500, Eddie James wrote:
> Document the bindings.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/media/aspeed-video.txt     | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
