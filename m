Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22a; helo=mail-qk0-x22a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJxuLTY2"; 
 dkim-atps=neutral
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFqyT4GVlzF0cc
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 09:41:52 +1100 (AEDT)
Received: by mail-qk0-x22a.google.com with SMTP id j185so5440738qkc.5
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jan 2018 14:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=YZRx0Jb3lGrhJxN2A31y0CIhZYI9T5tEwSOcyHgREIQ=;
 b=JJxuLTY20bUz/mfv1UFbLeKBLeJESWnCBk/zEpw2zZerdvgJVSZWDiaKZI6+89Yrqa
 E8reWPN5O70mflJVSdreWfv1uIzkRyBshBk1GFyyiHHhuk/MFYgQwTFsEP3lnv8eAnBo
 9AhJPbQRfyfvhNbSPXafiu6+gl3MgYQTLGv5InOWckP+l5JkkLXfF8tewlOJWW4J4VIl
 hvPY/v0lS3Gap3TnbqTXz4NhSzZBciIJ3IqL7SHbY/nmB9BnasqTtZ2yyQRW0KEoiYXx
 6TS77uCzmNQhXSGurNxqTKHHwfyfFROLrPcvrQDDa7Jk6C7XEzq9bTfmWuiMTQ5DlPM2
 boHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=YZRx0Jb3lGrhJxN2A31y0CIhZYI9T5tEwSOcyHgREIQ=;
 b=TSW22ALQvh8qva7ImDAUCvG1luImqjyCf3TnaYTgG0r6Pjp+CGiBF3xddTPlEgR+1G
 gIb+/Wz+ifxCplEmt/y1t957CacBENGLretwWWWXDrkcEUS7xrHeCj0+7aRmG8OxE3Yw
 H//NhDGiXNVNV07GqF1ggYfihkl4oAuUgyCrmWQdF0Xa/vcqee+eHzjyfN4AOPohuDou
 X6wkpDKcblEOpC60yCR7EWdqLQIUb40KMqQApLRwDGlIAxXYmIR3kSavCq2a+w3gV4V5
 GBhAeahHB1Xu9xmEMEwyV5yniuWuCr2EsmIHgeIle4WiyF4uwllaaHZZ7X3ujXCwNb2f
 uP3A==
X-Gm-Message-State: AKwxytf32AstK2QE4jXSEfsiq0T8RIA66raX2F9W6wA9iSqu9k1KCVS3
 bpgx9zUByc4IhtdsZVej+FVvPOAq85P2tKL8ces=
X-Google-Smtp-Source: ACJfBousc7JmOpfRPn7oHbp3/PqAnlbJSRfm4wy6see/T1KxaIiO4EIR54FsfRiHCMEK3zEWg/DKdCMFKNJlVuJC0lQ=
X-Received: by 10.55.182.2 with SMTP id g2mr17393730qkf.273.1515451310105;
 Mon, 08 Jan 2018 14:41:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Mon, 8 Jan 2018 14:41:29 -0800 (PST)
In-Reply-To: <016614e372d440c0b2f0970d048bd477@ausx13mps334.AMER.DELL.COM>
References: <016614e372d440c0b2f0970d048bd477@ausx13mps334.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jan 2018 09:41:29 +1100
X-Google-Sender-Auth: RqWNcHlVPBwjHQrO8Hnfi2GH3QQ
Message-ID: <CACPK8XeJiBDLESERMfOuXyoMxX3QYpbPe4ZFv0vu6xGC1Y4RQg@mail.gmail.com>
Subject: Re: SELinux discussion at Hackathon - call for input
To: Michael.E.Brown@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jan 2018 22:41:54 -0000

On Tue, Jan 9, 2018 at 5:27 AM,  <Michael.E.Brown@dell.com> wrote:
> Hello to everybody who is going to the hackathon. I currently am schedule=
d
> for an hour to talk about SELinux on Wed.
>
>
>
> What would people like to know? What is the best possible use of this hou=
r,
> and what does everybody want to walk away with at the end?
>
>
>
> My background: I led the implementation of a full SELinux policy
> implementation for Dell IDRAC which will be delivered in our product
> starting later this year. I did the initial work of setting up the
> implementation strategy, did much of the initial work to get everything
> building, and then supervised the implementation. Where I=E2=80=99m less =
strong
> right now is actual details of writing policy, as I=E2=80=99ve largely le=
t our lead
> devs on the selinux team write the actual policy for the past 2 years of
> implementation effort.

Cool!

> What I might suggest would be helpful:
>
> -          Outline of build requirements for selinux
>
> -          Example implementation strategy
>
> -          Example project development rules for dealing with selinux

This list looks good.

I would like to see a demo of OpenBMC booting with selinux in
enforcing mode. How far are we away from being able to do that?

Do you plan on submitting on SELinux policies for the default
applications in the phosphor layer?

Cheers,

Joel
