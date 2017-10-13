Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbH3PzLl"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCw2j1NNnzDrFd
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 15:38:36 +1100 (AEDT)
Received: by mail-lf0-x242.google.com with SMTP id a69so8178893lfe.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 21:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OfdLfjIplxy/T7aleA/h5jnVdccakP7mBSOjiS7Z+fo=;
 b=gbH3PzLlNnnlHvB40xbqumpgNBs94dCiUND8RjHL/iTrSV9MaY0OeNAYlz+lsRZNKv
 7CBvftBPKF5KHVkby4uqzyS3vL53VkN0xh5FjKMPC9/NtNkU6X1Sp5tdnk91ibelFlgg
 Bk/v8NYLrrWphWbJnSMmHVJVmXg6susIFqARPyExlK2axFibZmqLjtMrVokoD2SSGNSN
 ZC0nWUojUzz2Tu7uSKp+MPoncxjYm7XEagqJGoGfbmh9hqGkYziqky/bjRMWv5pbfGdP
 +W0S6OSuOR1q2RStqUbNLzWARNqKPBy2I1rgyFykf9l0nv+oTg8qebX1eP0OFX4HOnwx
 G3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OfdLfjIplxy/T7aleA/h5jnVdccakP7mBSOjiS7Z+fo=;
 b=BlQFp+2HdRuWnM7g1Umc9gDDHUmBWv3biu1VZyzsUjHdmExaJBdXcHlp40Td1HkeLb
 ikRTSLNMngqCPYcDf+rzLMWCF6dnkKyVtLmpfrOeJ+6WDfi6bbUWr02hpeaD/Q3QviVm
 ywt+kREyVNHRlajBAX0b2zP9YMeqZavvXWDeLSN5BF6Q32yeepeGYQD2Dl1vjJygHAEc
 qMxweAz6Zww8OFhGLBgml0udnOKp9GWVIktMQSgHo8vfmZhdsA/aKAF00JdaZSqt51wA
 yEEEbJI7gDa5U8eaDcsVUghWX34phyzn4o4xMgST2ClUiqDp8KrHb2E4/DyzfMX72kRc
 ctww==
X-Gm-Message-State: AMCzsaWSBvJTkGhaLP/mDc08PnGaUJ9Z5kk6eHvBQMRLb2sZSOyavI06
 p+gANLVLkeOzcXsF2rTAMzNsI5c0XRPFKhUW1d275w==
X-Google-Smtp-Source: ABhQp+REyO9z+64kFSSb7umSROMlQev38g9W8Yrk1SGnN/oXw27inFpo+hXCTxw7Mx2UL6BGwMuC+gRaYwFBY8Ih+po=
X-Received: by 10.46.93.75 with SMTP id r72mr68775ljb.182.1507869511307; Thu,
 12 Oct 2017 21:38:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Thu, 12 Oct 2017 21:38:10 -0700 (PDT)
In-Reply-To: <1507774637-13084-1-git-send-email-mine260309@gmail.com>
References: <1507774637-13084-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Oct 2017 12:38:10 +0800
X-Google-Sender-Auth: oJvp45p5VIZwAhNk5nTl7EQViOc
Message-ID: <CACPK8Xdn_Wp=oyry27djN7WGGp=rp0_4ndbpw7PZM_YeCS=DdQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: firstone: Fix occ and i2c
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2017 04:38:38 -0000

On Thu, Oct 12, 2017 at 10:17 AM, Lei YU <mine260309@gmail.com> wrote:
> 1. Use updated p8 occ driver;
> 2. Enable i2c buses that are used.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Acked-by: Joel Stanley <joel@jms.id.au>
