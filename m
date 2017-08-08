Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRZ3F0ZqDzDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 22:49:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UymjVpj2"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id t139so2309554ywg.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eONME5VRj4DriUZvuWvAzRojVVuwp2yQpLeRfcWX/Gs=;
 b=UymjVpj2NdsM8UxEVYMTDpTY9tyEngeYE9dHaYejPAFGUTreFyVu//xpR2s+dN7OxA
 1Xvryq6Qh8DPo6iv+SpxYv1at81tOTlrk9o0yzY/n6zF64qTXeRgQ0q8sWpIsjyWIXbw
 +Y0YomW1yeBFl17DrqhOa8fBXMIRr2FItVFbzDgAWLBgSOMMNZ0e48aIyOG4abVdpfDg
 zVvCussov/f8P0rUudQiZnpoy6g3gRS2yY71fLJo1Aoc7UauAMWvXQWaQP+bucFFSQu+
 T5fPqdGDDyujhKYsMXbj/pUi2Ytl0aDI+ZFkcQ+VTBqyKwtQA9whxlN5p9UWsaZPZorN
 ToHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eONME5VRj4DriUZvuWvAzRojVVuwp2yQpLeRfcWX/Gs=;
 b=dw+NBLNNyI67k7VnNGEZhN+A8xMyaMhORqRtxxjEoTPbkls4n2BzC9IWRt26021iDy
 Q81GlBkIU51F4oKbTGPXrQSxgI7qT5Z0pxBK4icSgqrB28crt3xGQ8jJTlOWUQC5vokV
 UakEOFW7+Jg12KJF9/T+pd6Ql9mxpIMUFAUt1/D9Us09QnxLJjzokQtrTTOrvZYkNKIR
 p68mizksb6jI0jZSyxKALf8vjprGrD/YQX1jafB2rPmdnpe9SFZWbNjUR5++41GV0P9o
 8/WxHeiNJiPhkGdrRIoHm7S5deChGIB7xGnUVW+01VPiYSdOHfwsGBkkIezN7bg8fHt4
 wzjw==
X-Gm-Message-State: AHYfb5gh5JYS2IYhv4HngsicigeHdtGs6w2NJ+iot4YsyVC/xBTvwoV/
 o0zlSEhiTswng/jRze8cFFCEpMeSC8+Q
X-Received: by 10.37.17.3 with SMTP id 3mr3160791ybr.252.1502196550719; Tue,
 08 Aug 2017 05:49:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Tue, 8 Aug 2017 05:48:50 -0700 (PDT)
In-Reply-To: <1502161302-23286-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502161302-23286-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Aug 2017 22:48:50 +1000
X-Google-Sender-Auth: Eb4yKc-zOe51ntMoQrlUob0PvM8
Message-ID: <CACPK8Xene-ZtHV3_tBwU2s5HDSppeor4HruKV1Go+mC1R35hQg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/i2c: FSI: Fix bug on remove() and
 reset to upstream state
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Aug 2017 12:49:13 -0000

On Tue, Aug 8, 2017 at 1:01 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Deleting entries in list on remove() even if the list was empty...
> Also a few other fixes just to get it in line with what I've sent
> upstream.

Resetting to upstream sounds like a good idea. Next time please
include the upstream SHA or tag that includes this version, so we know
where we're at.

> Resolves openbmc/linux#138
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

Cheers,

Joel
