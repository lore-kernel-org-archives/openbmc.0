Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cSnDNyUt"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44N0Qn6zBZzDqKr
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 13:25:37 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id m18so1312329ita.3
 for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2019 19:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ey1c85B0qxkbBM5X6lxM1xNRdT/aJ+5buDtuth3/0Cw=;
 b=cSnDNyUt7v8aG0FiFv2+3N9GQppcPE6zcmrY3C+sjQCM1ocAk3RNNp2dkeBUC/F8or
 M+HyilT5h4Cf6Tq866hNy3YBO6EcfCT8UVELk7eWxdbPPfKm8DR4Sg3m8AWMW1e+YVw0
 SHmGIFXK8W8Dfiv7LHW2AF9u4IDrqnGXb2uCqqHK8IHE0XOKMhjzncgMUe7XBfGWKMgI
 A/wFCCUB8zGd/xmn97bIpzazfw/G7l2w/fandS8K6AnA73mo2bcr2S76di70py90+PFe
 aTXV17NePxTrq53MKlVyTIMnjpAvoMD70q7w7z8TflA9Xf3jewzEKFPxm3v2+whV3pgJ
 3vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ey1c85B0qxkbBM5X6lxM1xNRdT/aJ+5buDtuth3/0Cw=;
 b=RAxxU5IR1Lf16rIqX+PeimrLzaYo5T1oOaTgy/+enP+p8QeTct04/+wSywPlJSjxXC
 sjufkRzJr3go07W3doHvnuwBg5p+CtLF7mU8VwAZq97IcyI1bPuTjlLy9Nzn2cOFaG+R
 0f2YwgPP4Ow0P1UekqMP0iDBdoR7sHCDXTcFNUHrq1pvHl098SRqTZCsTztPNUeXYXvv
 Fx8OhQgu8TJESUhF4dDv86yqy/tsh97XUB5+MxseBeBS2TOGlY2OIWglhlpUVJgQyBGX
 UfG5taa4xTa0HgfdKlNVlCTvxu+HXqqwph63NUD8IheuIuK7KMpi67OP8a3d0i4wLiHd
 O2QA==
X-Gm-Message-State: APjAAAWH18IJc6eLPftqlf0WePbB6Eqve2j1bbvczvn9XYfsOhjEGr6K
 1cdQy7iyW8WAu1Q/2D0bdPI4Z/oC4Tq/RSFJ64A=
X-Google-Smtp-Source: APXvYqxhkgEt1N+kXcYA8aVhOZ2twkWOgR2XE4zPvxLarhIWBUKBv8BVpsLoXNNF6ahV38wMuRycSZSNyns3A0caUpc=
X-Received: by 2002:a24:4a46:: with SMTP id k67mr8807217itb.178.1552875933787; 
 Sun, 17 Mar 2019 19:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
In-Reply-To: <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 18 Mar 2019 10:25:22 +0800
Message-ID: <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 18 Mar 2019 02:25:39 -0000

> openbmc: ae29d00f227e55192a69f66c87633e1b53fc6e68
>
> I'm using a custom build config for my machine. As you already know, for
> enabling the KVM feature, customization on kernel configs, adding a
> 'start-ipkvm' service, adding of libvncserver package and back-porting
> of aspeed video driver are also needed so there is no one-shot buildable
> TEMPLATECONF for KVM test.

Could you kindly put everything together on a branch so others could refer the
branch to know what the changes are for KVM to work?
Thanks a lot!
