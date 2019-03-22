Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12a; helo=mail-it1-x12a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fH70ROJr"; 
 dkim-atps=neutral
Received: from mail-it1-x12a.google.com (mail-it1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QTnP1F9YzDqR7
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 14:35:18 +1100 (AEDT)
Received: by mail-it1-x12a.google.com with SMTP id e24so1586410itl.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 20:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zqm+8LtN7dW9IyCZecXcIxc6aNwWitLquvCX0HeoKGQ=;
 b=fH70ROJrz6DnXxjf12USSsT0kS3tih/PX0KX00q+b8zLEsjQXDNQRQSKWIkK9Vsn2S
 rdfYhfKM6zM8WUqtHsDfjC19NHmMTcwHCeosUxVTvaOY7kETAqdSmpQ1yRj5YHLGBeRG
 LnyJHBb4xoj6wS0d3JElqrHOHFUAeG4mbmrJHlAMq55PyJxRRp1PqpQf2MeofunC8O3D
 hRyEWcQD8rqyXCdq2rXaZw12g/VjTVhrgK1alEOSKDEI9Oqq5cacrcGR2putEKvieKfE
 LPV5IPSaJ7ciJfb46pOEKuISu7a6S+czixvLLmFN1zSfxaHAWH2XbzW/NS/R2PdKANNU
 I7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zqm+8LtN7dW9IyCZecXcIxc6aNwWitLquvCX0HeoKGQ=;
 b=MPMVHQSsIlFEGkjsYbNUNpDYbgJqaWaAAhjgFJKADa1IXNzkotCXd1vMhy/Zt6+Qsd
 0B2Awypm8i56K8gR07gAs2+pZEigpDeY1gPXVeFozgNttxsEsfsY5OSQQRHvTdJ0fj2Z
 Ur0bpNV1YPK8EDvJQdbjhB2WY6GNz/drqNZA8pQvr6ZjLVOKYKqiT2WrN0p6ASlM2Rm7
 kNSOnwjw/xywymKETQrnWnt6J0ydyb0c7Yk8UKOvyZ0Boer7LX9/EhxAe/SSrYWxnBsM
 lATm0NJ914Yd8Q3aNFO9VZmotXx+PLGMJlF9aQK6UOZI6zBgMTR2WqxFP7lJ2U5uIApT
 uB0g==
X-Gm-Message-State: APjAAAW5fqQVKgKuoDrBVvBoJ4+V2udOUV/Mn1In0grfZ+rOZ0FjUydI
 B61y/CLLBu6um5arx8Io1Wd4w1+fEYqyJ6MLRks=
X-Google-Smtp-Source: APXvYqwt4n+wNnIns1Ya93OWr41Lbt7lCtAzmBvxT1xFRvcLxwhJ9o8LGTModsnuQqFydvbo9nXk4pGIFsIemiTeElI=
X-Received: by 2002:a24:5f52:: with SMTP id r79mr1493477itb.125.1553225714745; 
 Thu, 21 Mar 2019 20:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
 <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
 <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
 <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
 <CAH2KKeajTT96Y6rOdKGct+EBLdbFxGo97SEfWzMrcu0hqRh_Hw@mail.gmail.com>
 <77cb1f2b-96c5-bd14-eab7-0da527343ce1@linux.intel.com>
 <CAARXrtnAURfEDzTHZLHgOojRuD9T4DbUmuQLwvwsS4hvW-Sk_Q@mail.gmail.com>
 <bbc0ffe8-b30d-7d64-807a-b179a596a9ff@linux.intel.com>
In-Reply-To: <bbc0ffe8-b30d-7d64-807a-b179a596a9ff@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 22 Mar 2019 11:34:55 +0800
Message-ID: <CAARXrtnPYfxVUdkja+LyzHPvrvQr0124KNoJva8_nuLKKeeN+g@mail.gmail.com>
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, 
 Eddie James <eajames@linux.vnet.ibm.com>, Thaju <tajudheenk@gmail.com>
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
X-List-Received-Date: Fri, 22 Mar 2019 03:35:21 -0000

> Are you using a web browser from Windows OS? It seems that there is an
> issue of Windows websockify/novnc. Use a browser from OS other than
> Windows til the issue is resolved.

It's Ubuntu 18.04's Firefox and Chrome.

> Did you test it using Tight VNC viewer after enabling external
> connection? The reason why I suggested that is to identify whether
> this issue comes from KVM web proxy or from KVM server.

Yes, TightVNC behaves the same as the KVM in browser.

> Need more information of your test environment.
> Server platform:
> BMC SoC:
> Host OS:

Server platform: OpenPOWER Romulus
BMC SoC: AST2500 with OpenBMC master + patches needed for KVM
Host OS: Ubuntu 18.04 server

There is an update from my testing:
1. If the host is in Peitiboot (this is an OpenPOWER's thing), or in OS
   without X, KVM sometimes works, sometimes does not work, as the log shown
   above;
2. If the host is in OS with X (e.g. lightdm), then KVM always works well.
