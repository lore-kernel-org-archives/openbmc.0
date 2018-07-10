Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kimpqIS4"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Q9KP3kL4zDr0d
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 04:12:34 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id a3-v6so6345795wrt.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6FZ0oa31xNPFdlfDzVX74AMF76iUKkeEncwtNfDoMwQ=;
 b=kimpqIS4gOPn7oIY+cKTQrCP8SFXP7Miv+41b5ZP3LWsb12XMtFKxG5AxRfHisFFG+
 KO+5xTfS+kqeGOQYRvkslerCfGOn86ig5KSzS5K+SAqTPXhAOCiC8tL52Ycq2KuXUYz1
 hWAK7SYXCDrPdK6ET73Br5Ov6Bu1Vv8FVbSROVJgmKFd9CU6bNAXWSYSP9pEWesficBs
 2jx1RmgCwpP2ZG/8VxOPW7sWMnZmbINh71PmJqZYBGkJhBBx/Dx1DPaKd0SUBD+0FstK
 4S0c6BuQYEfkoJlKPAabJyyKebuk+V08AHD27E92Vu2+7tElJ1BuAhgMnHQ2fXMlRvUE
 A2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FZ0oa31xNPFdlfDzVX74AMF76iUKkeEncwtNfDoMwQ=;
 b=bKvrovKy/NE9rkxlNkvbGb2hWbgtc+QaWahApVyd/untOdLV6ovdiAwpUh9qQxrZHY
 uQAY1ClXCNXxga1iK/t02tRftkcjLcWnJuXQ886bGqNGDfC9cXpORfQK+jRpBZEBVvX+
 JRyXPKkX8NNjudFhZc61jOrLQ1EiPfxRRNNEPleuKPdkuiIYwOmy3gn/ULcuCuZvlU5V
 MIaRWPufpuK2eizWNLor/Yr9TH61qzYm3Qa2fb8Sl+JjMG2UOK+RcZSZYnyFLg446AQN
 iApuGBdbN9a1fPbgxGhcaInJFPWTEFVnH/lrs76MysxO+JE2fYvzdumLlv4pctAYXd7y
 2g7A==
X-Gm-Message-State: AOUpUlGXRKsNa36oHpYVY7ETgapHp16ZKkAhWTd5zKQ160kw/krO811g
 3PhFXe9BqNZpI4apZIyjoji9Q5xMiUAT4uxgT/9fnw==
X-Google-Smtp-Source: AAOMgpemIqd3m4664cM8V2280MDesXS3LXKFahYHPJvojmwHjDSacAelZlZVNXviOJpQA8hpM8oQl6q9XeFUTjFBG6g=
X-Received: by 2002:adf:9183:: with SMTP id 3-v6mr5214098wri.122.1531246351535; 
 Tue, 10 Jul 2018 11:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180706182531.137362-1-benjaminfair@google.com>
 <20180709075233.GF13479@kroah.com>
In-Reply-To: <20180709075233.GF13479@kroah.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 10 Jul 2018 11:11:55 -0700
Message-ID: <CADKL2t5vaRPYDr0FqpYdZF_7z+Uc1HAxPdZGjK7JcaYyu=tLSg@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: Aspeed LPC snoop output using misc chardev
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de, joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Robert Lippert <rlippert@google.com>, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 10 Jul 2018 18:12:43 -0000

On Mon, Jul 9, 2018 at 12:52 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 06, 2018 at 11:25:32AM -0700, Benjamin Fair wrote:
> > From: Robert Lippert <rlippert@google.com>
> >
> > Provides the data bytes snooped over the LPC snoop bus to userspace
> > as a (blocking) misc character device.
>
> If this is a debugging thing, why not just use debugfs instead of a char
> device?  That should make this code simpler overall, and you can do
> whatever you want with debugfs.
>
> thanks,
>
> greg k-h

This interface will primarily be used by a userspace daemon which will poll the
file for changes. The debugging usage in the commit message is for verifying
that the driver is working properly.

I'll update the commit message to make this more clear.

Thanks,
Benjamin
