Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LD1T6d0czF3Hk
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 09:00:29 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id e21-v6so648113otk.10
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 16:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FhFKhqwwYWIR+bNIbKqE3fMUNzt43/EaYVBPb3MQ854=;
 b=LZfziN7ouTTx78brCpRdb08GzTeizIXi0deIMu0LhAhuF8rv/vjf/IEEYC8AtFJJdE
 ExKNc2zFgSRfcOZ8I9EByiYbM3KQdsPgg90XTfLjG/6a8GO/DXVYtjLdg/Bcbd3/8fzl
 W+mIVEWpTEmOZyq5kqabUu62zyGHv1HY58OfYIlSzm6TYmVjfLk7yvX/mLSrF2J6osSe
 R7pm88zVYdv1E1cIU7ZRrF00TQC8ybUAl5wd9XjpdDIMXx+/1/oveY4gs6IDp8Up2C/J
 +6JcqZqmgBhGd7cr9BnGZvBb3oQSDmefWkPt+k0JBs0vM+pI/w0PSlCqaLUPKUsn5OGh
 vwzw==
X-Gm-Message-State: ABuFfoiPG/rdkn/LvR0W4TCiVUGV+01Z/RxF27UpNeiaKelBgVEB/WFe
 zx4U3uqb/vPFw45Encskgw==
X-Google-Smtp-Source: ACcGV638FDOT7uvBkFUe2EdWhu4GChMvtFYwEJFqwdh3o4jYjmBPcAsyA3+dLZ5Fcs3cCUwyJkFniw==
X-Received: by 2002:a9d:2b0c:: with SMTP id
 o12-v6mr5311025otb.92.1538002827708; 
 Wed, 26 Sep 2018 16:00:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t82-v6sm24051oie.11.2018.09.26.16.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Sep 2018 16:00:27 -0700 (PDT)
Date: Wed, 26 Sep 2018 18:00:26 -0500
From: Rob Herring <robh@kernel.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 vijaykhemka@fb.com,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] ARM: dt-bindings: Add vendor prefix for Facebook
Message-ID: <20180926230026.GA26508@bogus>
References: <20180919164712.4030353-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180919164712.4030353-1-vijaykhemka@fb.com>
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
X-List-Received-Date: Wed, 26 Sep 2018 23:00:30 -0000

On Wed, 19 Sep 2018 09:47:10 -0700, Vijay Khemka wrote:
> Initial introduction of Facebook TiogaPass family equipped with
> Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
> with a ASPEED ast2500 BMC manufactured by Facebook.
> 
> This adds an entry of Facebook in Documentation for vendor prefix
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
