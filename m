Return-Path: <truongmd@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=truongmd@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f7zdfG26"; 
 dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42l8kG4lpKzF1Q4
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 11:44:54 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id p144-v6so8280986oic.12
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 17:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0f0P6CT5CPHynoJyHVB+4xwJL0f0dun1TEgYDrv7QrQ=;
 b=f7zdfG262AoKRgxOhDkRCVgiEyJ2UpTqHkHC5TlVkjnbAwASbWA38ikk3TK7KnmVqy
 V4URkjD2Uq/HRSKuNRjigV2wO3auG0q0F3XuiYJrQMmNWsLTlC6ZjeRdHHEyFoLr7Wob
 eopZhcR6EyR0yk+RwrRaTGzakBHkVJYvYClJ90APtO9OPC8nm1HYb+7DFNDX6RJvePav
 /9jDFNgE8vpnnxPcYsT0i4L64hr9C/QUrYViI2nMQmRCr2WbFKbcVDSEp7Osf49t3jX4
 V1aStxiyXuiuCIEu58peC6voS2QUyuoCEpjLP17EFx6cEuqgyneoVkDASTtYwGR2tgZu
 UkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0f0P6CT5CPHynoJyHVB+4xwJL0f0dun1TEgYDrv7QrQ=;
 b=QOrWgsKXzVDfvrlAnDxTcNtG8UsGlCuDVq/uweSBl37rPJ+9TzX+WPHhhyCtU9uOPl
 EbVhmLpx/CPVRuh6QtV4Y/L15g1l1Fj/9vckuz1vPp0GtCwpLFw3a+TmjZpknz+uUIKi
 bWvtkeKViJxxxmAedUIKEA3oIcVNijIL/H0rfv03/pdb1U86duqqJjqP2SI73tH1FvM1
 SC1kEdumJVtax77eDv7aEAJB1pADwwdBztfA48SjOj102i9sLq3zWHf3brWu2W2cmO8j
 /I08bggPUj9uCoOJdDGaPUwxEUzJPjLr0ssZKRBnSfmWaKUnQAOJy2uPn7pDwv32W6rP
 vwaQ==
X-Gm-Message-State: AGRZ1gKjwQs7I3cr6VyM65WK3TI+pAhca+eezo1FHqeDSWnRLtshKElL
 VtrTKA4zHkK2CNV9V0oAsvPcsBGghJ1yZJC5wZE=
X-Google-Smtp-Source: AJdET5eezq3hLveFL6T4u9m9u4VZuPipQaa4uNRXmAW6S3oWW6wCb3gviRz0OTvG/Km3SyUr+UYXsemdbPu5bXZz/rM=
X-Received: by 2002:aca:895:: with SMTP id 143-v6mr551507oii.309.1540946692319; 
 Tue, 30 Oct 2018 17:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
 <CAARXrtkbSKRQ0wB+HkpLA_4EDx9rizeOuL7unTOSpkgytChFuQ@mail.gmail.com>
In-Reply-To: <CAARXrtkbSKRQ0wB+HkpLA_4EDx9rizeOuL7unTOSpkgytChFuQ@mail.gmail.com>
From: "M. D. Truong" <truongmd@gmail.com>
Date: Tue, 30 Oct 2018 17:44:40 -0700
Message-ID: <CAEx7e2QofcFmzd614-kpi+kmVjNZmmAhNTxy7HtkvTvCNuUz4g@mail.gmail.com>
Subject: Re: OpenBMC Raspberry Pi
To: mine260309@gmail.com
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 31 Oct 2018 00:44:55 -0000

On Mon, Oct 29, 2018 at 9:47 PM Lei YU <mine260309@gmail.com> wrote:
>
> This is really great!
> Looking from the changes, it seems to support not only RPi3, but all RPi models?

That's right, in theory all the RPi models are supported. The CM3 was
my focus but happened to have a Zero W and 3B on my desk for sanity
checking shared parts of the build. There's a bit more work before
everything is 100%-- the 3B needs a bit of massaging before it will
boot with u-boot and not directly to zImage for example.
