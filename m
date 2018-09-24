Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tbGr/Cmp"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42JmqY4V4bzF3Jp
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 00:31:53 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id b129-v6so9217326pga.13
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6ZPh7pWaeTuXiSuu4+m0dud7U8WgwYOZEVBDVElMuU=;
 b=tbGr/CmpxbDmEmAqlID52uOm9wPyUyCR7bULWx2GLcF8S7L+NWWFvGpwzv448qqU1C
 H2PzNovwgn1V5Pco74J0S+BJQMIpWTXfqsT/XOcZbRe/IgzJTMts2p2wcyucERVhXAve
 aV5aUr7/EIUyMS1o0WBcKJR6YSGxTzLdDZCCGU57rf0k+W7VruAJLr7nhekKa3Eg0MEc
 Ck71L68DezYkT/FHQE9DtlNqg2Zy8B2Obxr4YeQuLXNQnrEbcGrNY9TKdv8Y1XmsIzeZ
 RGYGAsBP45V97zYRpNt4VvEv0BJG3Hv1wnBjn+ZH9xseB5nuttXGbEdrtkAgOptuoqbt
 bsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6ZPh7pWaeTuXiSuu4+m0dud7U8WgwYOZEVBDVElMuU=;
 b=mjwl3ykbEeMcicICxln8hMN3nnQTkMuPQFQnP37hy6Hf6+Xcmupre0CWDbBO9pkBVj
 IZjWkYpcRDeA3IHf7H6letOvB+qSmWA22TMb2yu0nR0vurW2hpuk2X79/SbrLG5OsUu3
 t6UhorZnTy7ctmAS+huxuU7DI/+WoS2RxlnF78tURoSjKFyI/sPzffzKwhyR5bhCzVHU
 M8Pk+HU6F3BJtnTRO6VOHbRRmAcwTNQSfxAlLs8y0efYGohdQS3FXz7dEIQrfRklGBmA
 JmaONFOLGRvMMreKQC/JzlovwXaljiwoq2vbYQS29oLuJNZDRlzLvxCj9iZpu8mVtqFW
 9wWQ==
X-Gm-Message-State: ABuFfoj3T8Tt//HnsvBPnlMsXxPuZyL7uwmbKcRaQ+XFQYKeWKDMnDUj
 S3M4oAjg2Edgv/IBsHPAKFuAsTSSHB7TienZudS59g==
X-Google-Smtp-Source: ACcGV63TzKymVOCxI9LFYpCkOERAqcV0uipGkAfei5Xkr2/Wq4fOf0dbH7QX/emlIbczcgx4i48n+PBr2W/SxZVHDo0=
X-Received: by 2002:a63:1a1a:: with SMTP id
 a26-v6mr9737201pga.449.1537799510122; 
 Mon, 24 Sep 2018 07:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEEMP2VtXa1MuwkngMN_hXup93q49knLzu2=NmvAo-5yA@mail.gmail.com>
In-Reply-To: <CAE33tLEEMP2VtXa1MuwkngMN_hXup93q49knLzu2=NmvAo-5yA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 24 Sep 2018 07:31:38 -0700
Message-ID: <CAO=notyNHuDRpZbtxnv-YB0Byg=FrGjFgNKpkhAOiiU12sfe9g@mail.gmail.com>
Subject: Re: IPMI Commands Implementation in OpenBMC
To: akashgj91@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 24 Sep 2018 14:31:54 -0000

On Mon, Sep 24, 2018 at 1:59 AM AKASH G J <akashgj91@gmail.com> wrote:
>
> Hi Team,
>
> We are developing a custom board with BMC ast-2500 and firmware (OpenBMC) for that. Please someone share where exactly IPMI commands are implemented in OpenBMC code. Thanks in advance.

The primary IPMI handler implementation is here:
https://github.com/openbmc/phosphor-host-ipmid

>
>
> Thanks and Regards,
>
> Akash G J
