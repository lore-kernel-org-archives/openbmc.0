Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.161.194; helo=mail-yw0-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
 [209.85.161.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 414Lnb1hXfzF3NX
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 04:16:50 +1000 (AEST)
Received: by mail-yw0-f194.google.com with SMTP id t198-v6so745038ywc.3
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jun 2018 11:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iEV5UPO6kCcstLk6E4Ssxa6zMBliSE1fNJWNsKzC7uE=;
 b=aSXycIlq2bjgQmBrPLO7vhcEmMmAUGCPbnDV/au+LQ/AxiTAwNldjMTuc5WJCG4Zbt
 AF09zgjX66jhW8P576uGsnC6BsIk4Iequ2eU7WBGOMJIkb/RjunFmhgjBPX7yk7nVRyX
 +7ah2v5cgbwNGChabCCNrYRYADDLOkCbvzBvldk83S18Png+HlnaAuzwRsU4oHDe6C1Z
 9SVY5ptl64gJvVdOwwRqDB61XoKJzBj8BZ5U9MCXxHkwFxMusZ1oar/Caebc2xSSd5I/
 dkrE5Fw3EpkRYOPl62O/SSz7sS39s0z2b1tKdLWYkuLNkzbOs/+nKukd3FTNM6lqR117
 XAiw==
X-Gm-Message-State: APt69E1fZ0MjfqF7Azxk5yR10pAaJLZ+8vT/5YTEZKQvlxw0lEx+gBgR
 12x92YqFKE5HJ6yJt+TeiQ==
X-Google-Smtp-Source: ADUXVKKKzd8evpJupPo1G5UkUcl++GNUe5eXeHL+0q4flkwLqV5+ggdYRN/EqhvO1BJXHNq6eWP55Q==
X-Received: by 2002:a81:710b:: with SMTP id
 m11-v6mr161815ywc.404.1528741008206; 
 Mon, 11 Jun 2018 11:16:48 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id h1-v6sm26882983ywj.86.2018.06.11.11.16.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Jun 2018 11:16:47 -0700 (PDT)
Date: Mon, 11 Jun 2018 12:16:46 -0600
From: Rob Herring <robh@kernel.org>
To: avifishman70@gmail.com
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
 brendanhiggins@google.com, mathias.nyman@linux.intel.com,
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr,
 chunfeng.yun@mediatek.com, tony@atomide.com,
 baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com,
 kstewart@linuxfoundation.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: new ehci-npcm7xx dt
Message-ID: <20180611181646.GA5537@rob-hp-laptop>
References: <20180607145821.322979-1-avifishman70@gmail.com>
 <20180607145821.322979-3-avifishman70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180607145821.322979-3-avifishman70@gmail.com>
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
X-List-Received-Date: Mon, 11 Jun 2018 18:16:51 -0000

On Thu, Jun 07, 2018 at 05:58:20PM +0300, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Device Tree documentation for Nuvoton npcm7xx EHCI.
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt

Please add acks/reviewed-bys when posting new versions.

Rob
