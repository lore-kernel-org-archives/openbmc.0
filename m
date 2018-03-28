Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::236; helo=mail-qk0-x236.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxcz0q1K"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="lte2kx+f"; 
 dkim-atps=neutral
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409wBJ6QkGzF2HF
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 15:38:48 +1100 (AEDT)
Received: by mail-qk0-x236.google.com with SMTP id o5so1145535qki.11
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 21:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6jIKyyuvzAjgGUgmRIvVCLj8mMcXLRc/FLtLxmL8wLs=;
 b=mxcz0q1KxR8xUyTZqEb4IIk0uf4Z55ovUJ1EiZ9xV9WmijcuaaGzUneUxaySqjcvtT
 HoKb6hMVhqBpiaG1Xr7z3mX2YzoFjmax/BX+LIOildA0mZtS8BV2WBTUNHIN6tkOHLLb
 pZ1rqS2qxPcLBOjzg9ZcBwGvOH3EazYu8F2AzmxgnFjJgTitPBQfaPC35M5JqpNGljsR
 CbhHDYH9Oa2X/ohvNeE8Lv9NpIbumdi3TMeBZ+Gv8uql0FE2jlwNPyDK/fd9cBOnPswI
 4q9p6QXjtuBgI5/cvhP/u9ssVhi/qoiGeuNqbYhb6daRmxjmwpHcHUPMQnkf2kqgyDkn
 LA4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6jIKyyuvzAjgGUgmRIvVCLj8mMcXLRc/FLtLxmL8wLs=;
 b=lte2kx+ft6UNFipMhd4kEZ773Y0K/Xs5HjheCgC7mc3tIMGt6J8H2XLCIXMCLrt/ag
 H+KHr232PSh4TaWUiwczQ4lakG/ApBtnYY47nGDvW6I/xOahadVAMQXb6WU47+MhKh7A
 eFGFxXpMToMTpGZc3X/tbrMpUBeQINkWHveEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6jIKyyuvzAjgGUgmRIvVCLj8mMcXLRc/FLtLxmL8wLs=;
 b=Ys7GUE5D/FhRHWRwBj+FbmVd7FW/cLZqE41Bx4NgbxsqZY0vjjKcVqhBQAM4Tmwwz4
 sAFFiEWEMM/qV6a5xxIMSkhmj9lcFXjDI8xZPf0+zVKePo1gRbM3+FOlvRoZlbr703zX
 UcB6Kt08vnqh6wBSfo9gD1h4NT92FQ0LOGl4gviQQ63U3xlDSW0FpBTlqRdKDuVeXMs4
 t9lgsHUV9pMuW4o6IE0O9m6pjI2m0eJcXYU2HGpb6nBMOxIb5L8qAqL6FKAIbFJRTV4O
 zTZz24f3/z/MrXb5UIlxxA62wHhLClcD5UlHgSbmHpvyf9YIhpNa5BuEsmV0Dk6NT0sI
 d6Iw==
X-Gm-Message-State: AElRT7FGfzp6wrfMihDFTSSOlckBytet7Hgf5G4EcDeNGmcLyeQx69sr
 vsGeObNyBEqdhsFIU9oabk5ncj40Vl/3Uxfva+A=
X-Google-Smtp-Source: AIpwx4+UGc5isU4qLkXGet8/TAmyfU2F5AsPmOOfW2jI4M2/dLOGVBJRGPiv5DZJtmQnzjidEfVuKfzXOUXtnGf+mC4=
X-Received: by 10.55.111.66 with SMTP id k63mr3102860qkc.25.1522211926109;
 Tue, 27 Mar 2018 21:38:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Tue, 27 Mar 2018 21:38:25 -0700 (PDT)
In-Reply-To: <CAPH-5w6f25PWLwhZ6669eB9HrjH50Bq1-L+YqC5R21RAE2aOXA@mail.gmail.com>
References: <CAPH-5w6f25PWLwhZ6669eB9HrjH50Bq1-L+YqC5R21RAE2aOXA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Mar 2018 15:08:25 +1030
X-Google-Sender-Auth: KrtQN10I4AbJnkLFCHy7sOMIx5A
Message-ID: <CACPK8Xexitu__0UQ=Om=Ao8b-mmsUhCXeHOpoFB9LbEcGO00NA@mail.gmail.com>
Subject: Re: Xo deactivating
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 04:38:50 -0000

On 28 March 2018 at 04:28, Xo Wang <xow@google.com> wrote:
> hey y'all,
>
> Heads up that I'm no longer actively working on OpenBMC so please don't
> expect expedient code reviews from me. I handed off my Zaius machine layer
> maintainership and nobody really touches skeleton these days.

Thanks for the heads up. Who should I ping about Zaius related kernel things?

It was great to work with you. All the best for your next project.

Cheers,

Joel
