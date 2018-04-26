Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="i12TZjgb"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WhRW4bjrzDqyL
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 12:51:50 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id h2-v6so17584675qtp.7
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 19:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3aSt8nZPodfAq4WIJsorfz0fV3lSRzdx6YDx5K4cRCY=;
 b=i12TZjgbkEbFPM0afUK8k3EnNA+RFmpouUILdglghpX9/X9k1ICdGKBXFJdtXBveds
 zfDJbsJRuU397yv+9um1hKKuHWOm9ZqRK70gsSlHyqAEZDFe+OwcAuAJPItjfeJfm1Jh
 xfbczryRh8++l+p2NQi2h8sRgbErRSHDKDtKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3aSt8nZPodfAq4WIJsorfz0fV3lSRzdx6YDx5K4cRCY=;
 b=Pq3NwlcQ+dKnGKRoqz1Nn8DHDs5q7HPVC6HSrIDF5ZE7lVg/w+e4rpNT4i9O0aUvZ3
 ydtqCHlrBDJG0UDLl81YLSVj6KszBPUx4Ch/PLBFOBKUXmOmwDy1S9wcCYJXChV/tsB7
 /XqeEs0mJMSl0DlibkknFJF2xW6Gu7//XEYfSmzR4x3lZ02+jauqE7ed0RZjO3d2TSTS
 vqMWZvc/4LGRuNwkmTRdT8HblmpyTng+AwI1Ivbpv3PVoDh4OwTajhrNPPKvse3pZfw/
 KnL30xVr169fIX8HpbkpElxLGIv4jax6ePwOJ6Pr4NoOTGsz8hypoPZ+wysPBgrtidvu
 IrMw==
X-Gm-Message-State: ALQs6tCpfgIdOQLEgX3qYeI7hJa6nkJf1or5ZmVPQ4syCH2sYO/KERTd
 P+/XHeHru27ASohjJjTX+DX1qEpwdFEUQlM/EHE=
X-Google-Smtp-Source: AB8JxZqa3LoT3+hK7XWSToZh9LQ0a4h2vo+xEvbaefno8YHOtrlrnx6B1N//ln3VwxRfgT9vptzhVgnqN77760prvUY=
X-Received: by 10.12.155.138 with SMTP id o10mr10663014qve.89.1524711107901;
 Wed, 25 Apr 2018 19:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180327001149.2980565-1-amithash@fb.com>
 <1523244826.776074.1331045080.070C8C03@webmail.messagingengine.com>
In-Reply-To: <1523244826.776074.1331045080.070C8C03@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Apr 2018 02:51:36 +0000
Message-ID: <CACPK8Xc9uNvEqesS2OJDO-8sNT+1CNm_zVOo2d_yUJUwR6eekg@mail.gmail.com>
Subject: Re: [PATCH v3 linux dev-4.13] ARM: dts: aspeed: Add Portwell Neptune
 machine
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Amithash Prasad <amithash@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 26 Apr 2018 02:51:52 -0000

On Mon, 9 Apr 2018 at 13:03, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Tue, 27 Mar 2018, at 09:41, Amithash Prasad wrote:
> > Initial introduction of Portwell Neptune family equipped with
> > Aspeed 2500 BMC SoC. Neptune is a x86 server development kit with a
> > ASPEED ast2500 BMC manufactured by Portwell. Specifically, This
> > adds the neptune platform device tree file including the flash
> > layout used by the neptune machines.
> >
> > Signed-off-by: Amithash Prasad <amithash@fb.com>

> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.13.

Cheers,

Joel
