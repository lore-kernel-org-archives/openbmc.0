Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HWomjOWx"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="D8+HxoJt"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS5l0DyczF35J
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:33 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id q12-v6so20371820qtp.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
 b=HWomjOWxrhhIfOG35wJdCj2Eh4+aKN7YLaBZN3vhjq46UyzvDFwnoemQubQ+HrH7az
 fuSH2gfea2I2vNDJxxrmVjMsK/z1iSPeCg/X4S0WclukuDpyEbsXcz0ACy0sK3G+NtqS
 xB8oF17QK2nJEsA/T+d8x0PtWSzsobNgYvlsSCOcHv6XhOMOqdU03o7gMpu8jYSVHyRW
 Xtc6W7rBBQ24npVryN9AdQGHiaffTCwYWuiVxGHAJO1vaZfC8iFBpEYxekx0YX0X83oS
 BVRTjTWrPJi7wk3xWuK9NS0MFVCED78NBu29jLjf0A0+UlQfbLwypH5IdAOAyJDvjBfl
 0ieg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
 b=D8+HxoJtKCwILhIADMdFRzLUddjgwRtuaZ8Xly/c88xukN2pcA8AjbUhQgB/VqtaTY
 XPAdstWrR4MYxWdv2Ms8Asv3PYPsZezfwRP7OsBeuDmQQ7cAdGEXYzf0XkOdqHzR+eAy
 Pt1vJ8AWEAgXAQRPnkiyuw3KbV9BLqcxxybVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1E5CvcpRKCGQtGfxXR+UxfgXkMFrBocafB0ntKdmP6A=;
 b=FDc176QXH2t/SRxOn/t+SK6zmfWAUeR/nqvQ0Z8jsMxr5TP6KXyJl3d6SeeOzZYU3j
 2jl+jAWnOfn+Al2J0r1pswgAFvNHT3GowqXrNkFgVZgSAS1XiQOPsK8w0EywogDyhvEk
 MduLwa2Ieoodc0wAo5rd48khM5eD6/qe3THjWgcwSg/wgNiZCVBElEzWYMDhId6jIGBw
 N49LAj8wqqjegnYaddHBaZyJJGY/QnU1y15DhzKcJnqcwFgzg+VqMmXQUXolWeNeMAFb
 zLdcTcwDn1ld7XmebTxJf7SQ+FMb69ndmZIoIshw8ekbxdARW6acCdh3vjsYgxSVppyC
 Gwmw==
X-Gm-Message-State: APt69E0Ux1MBkkvEsShMFKxSZ3g0JmfUMxFm1TfYlTi/5VqXefcvlaZj
 zKEqfuGeFT2flCRAeb9s1wdnV5tLFJ29u7JTAQw=
X-Google-Smtp-Source: AAOMgpfEWnzxEpabNbd7SjRP+s0b7paY8avcEUpifoHQ/bMFpWR4MpVoHQOLerFCYMMNKJHtEElAX/I7PHLUpyC00TA=
X-Received: by 2002:ac8:679a:: with SMTP id
 b26-v6mr26755437qtp.347.1531286309215; 
 Tue, 10 Jul 2018 22:18:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 22:18:08
 -0700 (PDT)
In-Reply-To: <20180709143524.17480-1-andrew@aj.id.au>
References: <20180709143524.17480-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jul 2018 15:18:08 +1000
X-Google-Sender-Auth: ohaF99jUsWcaiMJJLtM9oTY4ui0
Message-ID: <CACPK8XefwXLyAzga+8ya5i3iWQoV5XpBJ2zqGTFRsD2A45OPqw@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 11 Jul 2018 05:18:37 -0000

On 10 July 2018 at 00:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> The AST2500 SoC family changes the runtime behaviour of the hardware
> strapping register (SCU70) to write-1-set/write-1-clear, with
> write-1-clear implemented on the "read-only" SoC revision register
> (SCU7C). For the the AST2400, the hardware strapping is
> runtime-configured with read-modify-write semantics.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
