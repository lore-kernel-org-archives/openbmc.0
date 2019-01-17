Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PezxzrDR"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g7lz3jgzzDqlh;
 Thu, 17 Jan 2019 13:47:43 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 189so5157386qkj.8;
 Wed, 16 Jan 2019 18:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rg1vNvR5pbrB66mtDDBifmLfQdSn09IgrAfhdxtpDvE=;
 b=PezxzrDR7iDernYmPx9IwD3FED9nyblCOHyFkvJxWHVwAa1qOVjqaLr+/76p3ugaCZ
 /WguOh2eYTQ1Ujzf6pjnGtlzTJB3VlfyNJcPZgWWQA2mt4lk1iICCPUqfeW/Ubfm8bpq
 pCj1EzorH3dxFc9sz60hzXUyURyTtnGVzL/Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rg1vNvR5pbrB66mtDDBifmLfQdSn09IgrAfhdxtpDvE=;
 b=V8RwadaxSQ352Pp31ZyMG2vFpgSHbvpbfGEYzCzaJN1HPO4OPRvhqTdCbDa2dmMG2p
 nPkP2XjETFncNMhduEVIGMYzjMZ8VuRW1QY+nP+0qcXR0zoIultQrtZpJHLu+3NpdYE7
 oteH/hiv6LzfHktaK3NbnSbrC208kEsqfwBYt7oawuN1FIviwR9Qp39OR+7vLSzz0Gvd
 vsDMjC67OgNTypFCsYGOJYewojP8IOV5Hbe7BJjY64kEN4dxhG9/AvEaniwsL9B15pvn
 mTIo6o948o+W71d89Nu9mQFgVJj/XGlatuScnOKyEMl/0AHNUugEsMdnj4YCdFaWpp8z
 +zew==
X-Gm-Message-State: AJcUukdQy5GFrjJH9XcnQxLjKzZ2XmHbWbd74QyZeSpRb0qRyxZCNplP
 Y+550vln+uOUPB8V+MQcMDfBoGS+mex7SgNd2DQ=
X-Google-Smtp-Source: ALg8bN7MVmbeu1Q3GqsgLUzW/P2tCyvjTvWLcDPvaWwZQoPKRx6ZlZhqRPTC6t/zvZQAlc0roWP5/JNrvgDGr5Qhcyg=
X-Received: by 2002:ae9:dec5:: with SMTP id s188mr9168191qkf.127.1547693261504; 
 Wed, 16 Jan 2019 18:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20181217200405.2904551-1-vijaykhemka@fb.com>
 <20181217200405.2904551-3-vijaykhemka@fb.com>
In-Reply-To: <20181217200405.2904551-3-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 13:47:30 +1100
Message-ID: <CACPK8XcErvKa6ROTonrxc5nd=keDCEL2QniQAwWaAO0FrTQVGg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: aspeed: Add KCS for Facebook
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 17 Jan 2019 02:47:44 -0000

On Tue, 18 Dec 2018 at 07:04, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Added kcs device in Facebook Tiogapass device tree.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Applied to the aspeed tree for 5.1.

Cheers,

Joel
