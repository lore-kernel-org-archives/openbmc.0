Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ey0zfcYg"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q8Gb0RTczDqQg;
 Wed, 30 Jan 2019 14:38:30 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q1so12901987qkf.13;
 Tue, 29 Jan 2019 19:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvQzkXhLPeLTgOpbEGZkyycdIgApjN7ax2QwNyqnteI=;
 b=ey0zfcYgibOQGdFqjPX3227zGgdcaG9Tj0pT/7QDkcrVnKKfNEmPUyFFijSQkfXWIj
 /FMcNC+NZ35wmaoDwJgBHccMEOA1G0R5c0PMvQ5BLSCghHYJsh+oQjDbYkXusHc2ZW3b
 Ov+2qt4vGLJgmzb3BSs6n3HLKU016d41tAZD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvQzkXhLPeLTgOpbEGZkyycdIgApjN7ax2QwNyqnteI=;
 b=HIOj0OvGXtIX38eqh35XoJSQpLbW5Z+qE8oA+J9IiSKHfw/vA/k12XCF0lAkwDQIz8
 rFh1OrEV/Bf+UMpb/7nCQfN79FWktYNXZNLgPY1p2B0JTXPYtEzwKb2R7rwFCHxZRqP6
 yJdkbknSCFuEVDyxpY8VR7UwT20YbFknzJX8uYizidD86QFIxlR7VVmbqWoU+6HZC3D2
 ZSq7n5LkZv2U3Or+m7bKPqd8fZiWOpto5WCBhHtZGWBzbUbc/EiyrRdPqNdiPGPEq8/n
 LtPNNHjYSTViRLlPoENgd/nuyunWKyG0FHmolLz4K3NTr3ISqRKKfCXMFJWRET/0fQAy
 p+Uw==
X-Gm-Message-State: AJcUukfFZZXoQY218HvlEjJAVDFB0QsDi+5WtWX8H+z2lfYoUc66lF6S
 0+RsZYd/a1us63Ar3cY2r1Pl8ylaiUSUk/3pHbI=
X-Google-Smtp-Source: ALg8bN4JOiF64YPw5l1msQix8HtFd086FzSEg2HOYTNVQInCcekKKD2qj7EfQ/r1BM/tIDwHDkyZtrJjasFGPdT2V18=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr26444903qkb.25.1548819508774; 
 Tue, 29 Jan 2019 19:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20190129214703.119694-1-venture@google.com>
In-Reply-To: <20190129214703.119694-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Jan 2019 14:38:17 +1100
Message-ID: <CACPK8Xfz5m6++SWoN-E_sT-n6y68vvrcvunhso4nD5Yq3vN6+A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: quanta-q71l: enable uart1
To: Patrick Venture <venture@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 30 Jan 2019 03:38:31 -0000

On Wed, 30 Jan 2019 at 08:47, Patrick Venture <venture@google.com> wrote:
>
> Enable the uart1 node such that the clock will be enabled.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to the aspeed tree for 5.1.

Cheers,

Joel
