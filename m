Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RlZ8R1JK"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g7lj3Q9vzDqkc;
 Thu, 17 Jan 2019 13:47:29 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id u47so9773502qtj.6;
 Wed, 16 Jan 2019 18:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jhUYHlWsp4dPPCUUpYGivzzrUbq5nG0j5/GyKUMF+SE=;
 b=RlZ8R1JKHdUHs1UOia+dTIgj4dWHMJN220b4Zfmw0OoGXX8CW3WsSHtH0CX5n7YaAO
 sTQaJ2V+dzEYl+w6UmgRjlJxlhxBYs35b/WqWxYZZr6pdHoMPvwLaKNQNpjtmlRprC2Z
 4zP4XW0CJFhAiVlfjnCgmx3s9vQsgZ9yY8b7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jhUYHlWsp4dPPCUUpYGivzzrUbq5nG0j5/GyKUMF+SE=;
 b=qfA9d8iVCEcVFR7mdjsrmROOgedDTlQ2fbYQSbyjqHTcOtiVLP4ntVHrOVKc5At3oV
 xLd1YKkznIxxQU7kdRA+h1lVnl7aZzZfyWa9u5ruhCO+vCSt8LKn2pq/jMeRbcYsjPvW
 QoQ5fBd695YCjNqZbbuMmS9lpd35ygMxBoLjPLymVrRpym5eCcBDLaHcobZHux2p3HVO
 Ga2GzIMjw2Qpl/LFMDybf8Sy6U4AUwMUeULOCP6+Zny6CLiT4f+LVlGrhujtEQE/yRro
 O+l/Y9Fw3Buia+KXr+DoorEICTXy95tEK2KA77XQSXwzj508h72yaAr5UC0Kqu/fmDRv
 JOHg==
X-Gm-Message-State: AJcUukeyqEfxKfp0izBUF+YvWc8WBTV4v1Cvmm/iRCZkg4HeekWF4JzJ
 ffkn+H3dPplKOtJWGKCp7XerUy9XTnbeV/ckVQI=
X-Google-Smtp-Source: ALg8bN5/9+t2WoEt4JnZeWiSXM/fyx3B4LuA6Q61b5VpQmLE39xvSZZiUASfk9dyCE7X8KzSY6olpwG7yy5+rcT1wTA=
X-Received: by 2002:aed:2764:: with SMTP id n91mr9903046qtd.37.1547693246995; 
 Wed, 16 Jan 2019 18:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20181217200405.2904551-1-vijaykhemka@fb.com>
 <20181217200405.2904551-2-vijaykhemka@fb.com>
In-Reply-To: <20181217200405.2904551-2-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 13:47:15 +1100
Message-ID: <CACPK8Xe2SbmxoY+Fj3jr7eZ7qA9bqgSgpuS=L9iVcL+wu26_wQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: aspeed: Add KCS support for LPC BMC
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
X-List-Received-Date: Thu, 17 Jan 2019 02:47:30 -0000

On Tue, 18 Dec 2018 at 07:04, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Added kcs device support for lpc BMC.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Applied to the aspeed tree for 5.1.

Cheers,

Joel
