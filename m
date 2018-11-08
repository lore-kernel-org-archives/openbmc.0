Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="V5B6nXY5"; 
 dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r48z53jNzF3Kl
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 11:36:35 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id q1so23735559qkf.13
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 16:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gm8hkzCLhoh5xULPp1SXyW/o43RMvNw7IjllWyXu5cU=;
 b=V5B6nXY5qizeFEI+ZGu21vZXn3NIyMvZXb0xtCB6AdhGq2JmKfnohTRA0pQ8bakus1
 fTPfWUBsttfZ6Y2Hdly+Bws787nM6iD3XhYYtZAWGm/8G6Qe4FB9iiHjzaKCs0NXhmLb
 MRDNyg1sLNXgqJmf7gXezITR+z+V05559bXoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gm8hkzCLhoh5xULPp1SXyW/o43RMvNw7IjllWyXu5cU=;
 b=Yir6P9J7BK6GoU9Pe3ic/jEtQr/Ix3LOTLieWasIUzI0Us03F2291bbo22bWXPOgRR
 EdPwqNQ019af7KnKTyLDb3V4Lc7qKydJCK7fgEaJy0M5dnMvlTyVV9gTxaf2OXOLhCsj
 YOWB2SxMce6UyTLFlGIRQWfwCRTwwPdTd3ZSl1eEjyhb2H4Bmr9kjOOjwJwj21Td0wKo
 7NFABHZ0Sw3QT87QLWMuQaGs6Y2acJAwDmVDNSxolGf50a6wY4fUx9ORAGLeF7c+GyRh
 9bCFM0OPyeWC9EhBNirja2JaT5K026KPlldei4IcskxrY5zdIEgaHYWJgKpvWOV/QqE6
 CVaw==
X-Gm-Message-State: AGRZ1gIW8+qrkdPWfOFVNIg0zWjZnFPoGuSfS0N2RZnw6TDFMFKc/uI7
 rwWn0vSTcruutyUz0y6LlfUnSSVM6pG9Q3Wpn7r40w==
X-Google-Smtp-Source: AJdET5fw4gaq2kH/UVmyTVRSVPL6twY4u9mu2jp5PT09Jswt36IlzJ9/VrG2bRBV6pRiLObyv9lgWtF41dGSp3Hm4zM=
X-Received: by 2002:ac8:7308:: with SMTP id x8mr2502161qto.284.1541637393444; 
 Wed, 07 Nov 2018 16:36:33 -0800 (PST)
MIME-Version: 1.0
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
In-Reply-To: <3ff8d429943e44139b73cb16199a560e@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Nov 2018 11:06:22 +1030
Message-ID: <CACPK8Xdiyno=CMFBB3_bSR4bFwC3NCeCm9ccFCN7D+Yx=9YpHQ@mail.gmail.com>
Subject: Re: pull request to the u-boot-aspeed
To: a.filippov@yadro.com, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
X-List-Received-Date: Thu, 08 Nov 2018 00:36:36 -0000

On Wed, 7 Nov 2018 at 18:03, Alexander A. Filippov <a.filippov@yadro.com> wrote:
>
> Hello everybody,
>
> I would like to publish for review and discussion our implementation of the aspeed i2c driver and the VPD parser for the u-boot-aspeed, but the gerrit said that it have no such repository.

I'd encourage you to submit the i2c driver for review to upstream
u-boot. Cedric and I have spent some time recently in improving
upstream u-boot support for the aspeed SoCs.

Cheers,

Joel
