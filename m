Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZFF3wgE"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PJRs2mgLzDq5W
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 16:31:04 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id h9so8544612itl.1
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 22:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CgHS5dzYyfuY6qw4cSO6OFkcSkULRrRwTGovEPrcT3w=;
 b=KZFF3wgEFBD34/qXtO/6OhfkaQWgsYO6Th5lLHhck763LGSsZn1PsVF1woeNzbGOWO
 ZO9sM5//+XXVxzSB1KRKUAkfdRtULkovIUGN5exG3ciGCkVvnY4T/jBLQvnRdKcgyWgr
 EQmLplD0FBtgS/jW3y4vZtMYmYUAcg6qNem1UFQX/4rH2kvYyC+XaZdUR8zCyfAusbZ8
 nEKn62wFtehi/kiDwJetLCz1/US8hEJMi9ncA676+O6LdEIfglsqRI3Eu1eEOCCuSTDX
 ON0wi4BR5Wish6OcB7P8SZD2ry0cmScgBdeY1JHbtE9ZnlBem222mqCbOcEEblVN7K+L
 kCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CgHS5dzYyfuY6qw4cSO6OFkcSkULRrRwTGovEPrcT3w=;
 b=Nms0g7RPXqQG510G0zGRJqvOdnoGJ/1jz9DW55cymZ2O6fhHGuGEru5HnLu9mQ68cU
 XbqpF6gqwhiVsDHiRBFsl82YUTubrUk9BT/JkfpiJ4y4RXedxHgSst3brLx5JvqCsZ4o
 9A469zWzqQ4WnAVUyGi8UgO51mPpJnku9ABQlks5Www1PKhN5/+EwW6ngb9cRdiYMODz
 fKn3vlT6FyuYjGGnygYIKBWwoYf4NUfEtAUdGR3hzfgz09FJJWrQ2pMAgNGei9ZMVDr5
 m8v+Kq+EJrj0Anlc2G+reyMEkNd0uUVKhwFn8EYJPXLUbRQk3VPeOjk9VFr+jGqNmxMV
 0DGg==
X-Gm-Message-State: APjAAAWHy2gTOXRpqIucvemKBNn95Lbhl/h7+VDtF59Wtym4YZPUdN9Z
 49oIly9K/ZSFOXASrzhX0UJymQBkt28gLOjamPw=
X-Google-Smtp-Source: APXvYqyNQvEllyGLDZG8mwKmc2JnjXQB+YTvYRN5htnuNr9jvMrSgrCG4RFTX54VlIkw4SvqLCc6rxNXkM6bhn28BA0=
X-Received: by 2002:a24:5f52:: with SMTP id r79mr4033936itb.125.1553059862994; 
 Tue, 19 Mar 2019 22:31:02 -0700 (PDT)
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
In-Reply-To: <2d44c252-94b6-6441-d3e8-a8200d89aaa5@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 20 Mar 2019 13:30:47 +0800
Message-ID: <CAARXrtkkmxHcgvkp1Mi8esY0onqdHxRzaymcf8NaBZSM9uVYRQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Mar 2019 05:31:06 -0000

> Check if there are /dev/hidg0 and /dev/hidg1. If not, check kernel
> configs again.
> Also, check 'start-ipkvm.service' file whether that launches obmc-ikvm
> using this options:
> ExecStart=/usr/bin/env obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p
> /dev/hidg1

Confirmed that both /dev/hidg0 and /dev/hidg1 are created, and the service is
started with obmc-ikvm -v /dev/video0 -f 10 -k /dev/hidg0 -p /dev/hidg1.

>
> Try this patch:
> https://gerrit.openbmc-project.xyz/c/openbmc/obmc-ikvm/+/19392

Unfortunately, the patch does not fix the issue, the KVM page still shows a
small black block when browsed to another page and back.
