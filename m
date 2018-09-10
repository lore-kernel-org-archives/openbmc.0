Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ef8ozdZc"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428CTG0KcNzF3Fk
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 02:01:21 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id j8-v6so9941184pll.12
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mgN3FouiSnhwAJv2mU++u29hpKJikWoML07D90PBoqM=;
 b=Ef8ozdZciV2EXVrKh9wMO9y/zN2oMig/9o12VzP5HK1+XcVNjdfS1wqHuo3iE/l0KN
 7I6WbRLGqmvs/t7nClZspz6kq6T6Pq7APNv4pJ5bigVCz0WI+2ykcyuxjCCIs8GIJYb2
 gpg/56TLIJ8sQBcJlLsHH5pAYM4aQSx4ZYaXN/QKdAOpZZJ7UrFheeJgXG5FQ4cuJ10x
 6+RnwWyjgOHmCvE7bgSl66E5Og8XcoqqlFsmb6OesdxKzMWPYK74NfwlMHFLwtr4zXDO
 iBiU6o6Z9aDg4dZB4XBs33JhFySYclf/J0VfGeefCuIbkAYe7K1ZOumgUpZnheSjkkli
 jYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mgN3FouiSnhwAJv2mU++u29hpKJikWoML07D90PBoqM=;
 b=PpchiPzPHlqPVHScw8F2ElBS9Q+yoFzyAGowuDESnauDl1uPfBHcV2SLukFBsb3Zr6
 pe3vX3XeuHUeFU/oz3uiPlVo7m0ZolaBqMwVw/T3sj5rcG1TlW776t73xV795CxnLFS7
 ziy1gdK7V8UIgJe4r5F38g1wMKatKnfyUZg1F+72ylvNiWl1zzQQO+bKD+X2DsK0TVXy
 x+T5qld0FokL1ZtaIJ1g9wh9bHFL7OqXyFMNtDsxewGZYYpxUfZ8XakH0SS4uTr/DBUb
 ZU+BNYEDjh8NmLLBrLFBptksrn1mPabazMouSKSJ64PW4qyZHovi568qeoHjRFhAVR+5
 F/hg==
X-Gm-Message-State: APzg51BtgPYy1EuqU8r45L96dsTlr7UB0aoHDJqW9td2vJIbGe0chCXI
 EKEfWWBrrij+cr0vOUZdl1yp7E/JhFfFGSmA0kS33Q==
X-Google-Smtp-Source: ANB0VdYgyMtUrNcR/8llpp0FKrrUaRxc/1Td991HfLFzH33sQpr0UiB2jGF+LqHBZbowg1781O1WABNeT8A8Y5gMf+I=
X-Received: by 2002:a17:902:6907:: with SMTP id
 j7-v6mr22739950plk.323.1536595279021; 
 Mon, 10 Sep 2018 09:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
 <EBD6A54B-2862-4DF8-9E03-5343C29349DF@fuzziesquirrel.com>
In-Reply-To: <EBD6A54B-2862-4DF8-9E03-5343C29349DF@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Sep 2018 09:01:07 -0700
Message-ID: <CAO=notzcJFGD6fJn_LpKQgHUkyU_whW-2CiTe26kcq-+G3T7Ww@mail.gmail.com>
Subject: Re: phosphor-ipmi-blobs
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Sep 2018 16:01:23 -0000

On Mon, Sep 10, 2018 at 5:49 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Sep 7, 2018, at 7:51 PM, Patrick Venture <venture@google.com> wrote:
> >
> > If there is a phosphor-ipmi-blobs repository, I can push what code base=
 in one
> > patchset along with the design in markdown.
>
> Sure.  I=E2=80=99ll wait a couple days for anyone with any objections to =
speak up.  Please
> remind me if I forget :-)

No problem!
