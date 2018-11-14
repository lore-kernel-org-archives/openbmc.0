Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VtQzPnNa"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wLyX5BcHzF3Wb
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 10:57:24 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id 189so29106569qkj.8
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 15:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ep8kbWnpFB2BJ88fe8Hdd3AISud04dN8gg1qQ4yQgWo=;
 b=VtQzPnNa+fVr++FJJO/t0u6qwgjx3xAwB7bkzXOSp9Jc4NdYUbS5mlxDJ9mv45qUDF
 0k7g+CJEnG0YS4waoOC0BvwqzBYH5yFUqMcTZDUaa7wXxfvOEJDxghA2Z/Lgm+fZgqNT
 NJU5v4sO48+rkKwDkkB4TFdkr5JYI/iuovQ8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ep8kbWnpFB2BJ88fe8Hdd3AISud04dN8gg1qQ4yQgWo=;
 b=X+VOUeqWCYt4qLLV6n29K8CQdyPj2Y3Sqsh76WEzje9MrCES5GJyQr96/UH4WA7JUC
 I4zX4FgEftPiIAakxJSOrjXaGzr5D3OjL/RjAEkPEzXFJzC9U8YMJ2YZ3YyBtMB3amx8
 a8UX0eogk3eSiD/9nN/+ql76uTe5ey2HwzVZ/M81mk7N4CLeprc/rHcqABFoFxrmDAoj
 IhMpbdVBfKGEo7WQIwTcmchhrzWqjxetakq+wIdECNcrcluPknAOn6X2rAotzW7mMnM2
 IBpxeYj2rNZH/RNn5jMPScSRw/g0H0e0bm56NM4x2BkILlcWEPZsN7hFWZS5RPhhpbPH
 zikA==
X-Gm-Message-State: AGRZ1gI5i0c/Ew1GM7U8PHPpLtY1DmPmXTyhFV1DZ3k3V4byaSXBWq+i
 J7f7aW0w/fQ7PbJVp+TvbEL7/H4oesm198qEtyk=
X-Google-Smtp-Source: AJdET5eTmns6D4CS3kYyfl075MxjsvueXkk4BIYqZKvAt0VWVsXXLP5HrbF6Jw7TlUdSdUIkdQaKUfU/7UcVlzOaTA4=
X-Received: by 2002:aed:2764:: with SMTP id n91mr3942758qtd.37.1542239841855; 
 Wed, 14 Nov 2018 15:57:21 -0800 (PST)
MIME-Version: 1.0
References: <D7F4B5CE-3638-4877-B3BD-B2BB726E493E@fb.com>
 <a010895e-042f-30cc-6030-42ccc021d7c5@linux.intel.com>
 <E70E182F-441C-4CFA-BB14-9A3FB55DE6C5@fb.com>
 <6bc2b289-ed9a-854c-ae92-ffcd74ea5cf3@linux.intel.com>
 <0cfecae9-5ae7-2bf5-16de-20bcbd9ad50e@linux.intel.com>
 <3e929e2f-5e08-3f13-2ee9-8af10f88c1f3@linux.intel.com>
In-Reply-To: <3e929e2f-5e08-3f13-2ee9-8af10f88c1f3@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Nov 2018 10:27:09 +1030
Message-ID: <CACPK8XeEh+atQgu8pbMLR6Uf5cizMGPwA6D6MCHXXPrDxgpVCQ@mail.gmail.com>
Subject: Re: Adding sensors for facebook
To: James Feist <james.feist@linux.intel.com>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, vijaykhemka@fb.com, 
 Yong Li <yong.b.li@linux.intel.com>, Amithash Prasad <amithash@fb.com>, 
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
X-List-Received-Date: Wed, 14 Nov 2018 23:57:25 -0000

On Thu, 15 Nov 2018 at 04:07, James Feist <james.feist@linux.intel.com> wrote:
>
> On 11/14/2018 09:23 AM, Jae Hyun Yoo wrote:
> > I'm still trying to upstream the PECI implementation into linux kernel
> > tree. Meanwhile, you could back port this patch series for test.
> >
> > https://lkml.org/lkml/2018/10/15/670
>
> Joel,
>
> Is it possible to add this into the openbmc/linux tree?

Yes. Please follow the process documented here:

 https://github.com/openbmc/linux/wiki/SubmittingPatches

Basically: rebase on dev-4.18, test, and submit to
openbmc@lists.ozlabs.org with [PATCH linux dev-4.18] in the subject of
the patch series.

Also submit a patch to add it to to the in-kernel defconfig, so we get
build coverage.

Cheers,

Joel
