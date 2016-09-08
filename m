Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sV12w0LKdzDsFt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 10:11:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=o0WNS82M; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id v189so1195819vkv.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2016 17:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=89OwDSgbjdZq2+/m4kkv5sybCGH6h6FYCdSSNpHQfCQ=;
 b=o0WNS82M/3LzDT1e/l1AmoxAKvOD8frZ9u8gjTs2/qVXw/zjheZx67wO2VtEWzp5Vc
 Cb82uFRBhCVh88G+oK+zmJcZ317Mer6EhFGc+1Mz2mE/Tc0ShxmgcFT8vxD6k8UAW4de
 GLF8W8DSeB5PO1hc0KxR9BRHfmiY81k3qrPIFjdd4U+nftirCJf40fzibJoYVksoiHfe
 h3eWQpX6zBI7YMdS7UUgfDhO9DCAI1oERNvG34NBnj4rYZJR5craYXuAwoSr3tjnmwDY
 wiURfvC7dWuUdh1CRk/+uOUbHsw002s0Pzz+R62+xvPjppuxVCjG3W+LNC5XJN9aVCGA
 8QOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=89OwDSgbjdZq2+/m4kkv5sybCGH6h6FYCdSSNpHQfCQ=;
 b=Ald7565ukSJJ9do7rqmc6DTM3+IFMFSjA3JhnMBC5zy1Qp6TKiV0ZCfkmf/xtsuShE
 xdCxa+CkLfWTuQv6KDxkuPWcfmy7GFElpKcvrnnr/SiCgxP3Q9qCzFBnkMIlMaHMWc6e
 bQja/s3NUFTlWfUNHuKLX8UOWkysJReYiYiVIITREQQpMxuz+Pq1GZ3TacfRsQ6FIjPW
 eNGOG3vKbTIGTqh44glTGarBFgKJ8mqxE1UKRwUHMpXFnK91sm9jm9szCt8M4j235S0P
 6+nrMQS063sOI5jMcFMviGNEffP/825ouOPH4wnGRKaYLVFAtc7KOZC+pxp++qLiZTFN
 763w==
X-Gm-Message-State: AE9vXwO9KHzuvDoKCgXHCooKoYuIr+rPHhKLKer//o+Yl25IkASOQCNw96SL/F8Y5Ze1G7AOwN2GHqP4VI9x3w==
X-Received: by 10.31.0.198 with SMTP id 189mr11905032vka.149.1473293477215;
 Wed, 07 Sep 2016 17:11:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Wed, 7 Sep 2016 17:10:56 -0700 (PDT)
In-Reply-To: <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Sep 2016 09:40:56 +0930
X-Google-Sender-Auth: ibF6CPVd_vYxNLoFijdX9C6ZPt0
Message-ID: <CACPK8Xe7LOX-kK5KbRNNdRC7RkbTZinsor-7pP9aubnUhanjjQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/7] Introducing the FSI device driver
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 00:11:20 -0000

Hi Chris,

On Fri, Sep 2, 2016 at 2:35 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Chris,
>
> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>> From: Chris Bostic <cbostic@us.ibm.com>
>>
>> Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
>> driver. FSI is a high fan out serial bus consisting of a clock and a serial
>> data line capable of running at speeds up to 166 MHz.
>

I've taken a look at the patches. There doesn't seem to be much
improvement over the last version.

> I was wondering if you have had a look at Jeremy's implementation yet?
> If so, are there any ideas you have incorporated into your series?

I recommend you consider these questions and get back to me.

Cheers,

Joel
