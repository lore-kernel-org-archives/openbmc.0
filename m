Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DEB1F1A0324
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 10:18:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JFHfJKE4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=OfZJXnC5; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id k81so2384182oia.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 15:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FlF3wQuCxXGVL3kPGm9+h/j0KZoq6HijZ8mABNatAhU=;
 b=JFHfJKE4mMCtWKr3Vhirbrzf/nSll9poOw48WhXST8jWBtalHEyZt8Q4rAR90t3qAG
 SglS8PomYK2lMCTZX8oqSF3aDXw8Ik1oDRIktN5brBDAeQl/rO6PqTeJ59tdwQexRhhA
 hqd2DbWFzTOfF4Uettz+csW8k67h/BsxBV3v08Xwjo6wHs/rXOxV7GbPPA3DKwwb/XuJ
 suqvDBfY8URMpHQjAyWEZUS/J5HJrAcwZ06RM644FFF5t1xbvfPuN+MGo6whpkapi7jD
 tvzyduLYDgHe4qPaEFRkRDqpewaSAuzUYF6qFDvHRV21trAUcYr6m7zWNgfVjAe+scoi
 1vsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FlF3wQuCxXGVL3kPGm9+h/j0KZoq6HijZ8mABNatAhU=;
 b=OfZJXnC5aPUxPHEuX0sZO4GQNNY53iM0htFLt3HBJKFuZV/fxxRK301He+LdG29dej
 AtlsetFxh7I5abdTNllrOZhUtVUuAaEZAIeep2SkBzsetFyGGST1T00dC5Rc8Hy/AUS5
 F3n2kdP/zAnvJMeRfP0awYwZL9dZXLCTBSdPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FlF3wQuCxXGVL3kPGm9+h/j0KZoq6HijZ8mABNatAhU=;
 b=hZ/AIVE4CRACrdXyAZfin+eDvEaTp6ocogzaME3AhOXdO7IWJJDxytSszQmqY6HOGU
 ma5uZTX963YYvEx9YsxMI+xqTGKBKmyATJ1K1VmjLPut6R18r1x+nqaujjn5x+JDAt/d
 iJG5DGJIBgSGYwHwfgJpAj9HCmNtarLCioGNs0X5TCV8AgjchbhxnTUbappbuJLGZ3n2
 LJL0MYSQ5FMbSdeaHqVAeICUA2t28WsYhVV3easMqmUQeiHbv1iD7NFeTLbtgebMMmjW
 MhFYBBG+Ea+AVgDjm5ON6MKjYWeSQcchAv1rIl6QeZU0Vov8KMN4t0pBRY71zDyDhUU3
 WIig==
X-Gm-Message-State: AD7BkJJpTyzMmDGe7pyA9nCefSr/lUKMj6n9x4hwfHcIq+L8SH4KHYs/CVPfO9ftW+PSomNGbPoa1ZgnWBwqYQ==
X-Received: by 10.202.205.196 with SMTP id d187mr9625135oig.119.1456787900230; 
 Mon, 29 Feb 2016 15:18:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Mon, 29 Feb 2016 15:18:00 -0800 (PST)
In-Reply-To: <1456771223-7654-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456771223-7654-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456771223-7654-3-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Mar 2016 09:48:00 +1030
X-Google-Sender-Auth: _y-QeFNsUGT5nSGwCSYCg7YV6W0
Message-ID: <CACPK8XfDDWHhCvn1romazcZ=1HaS0Sd_HFrHWOfjvk9YkyGYRg@mail.gmail.com>
Subject: Re: [PATCH openbmc 2/2] Don't inherit image-overlay by default
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 23:18:24 -0000

On Tue, Mar 1, 2016 at 5:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> This attempts to address a race condition in the build where
> we attempt to build a complete flash image before all the sub-images
> are available (specifically the initramfs image).
>
> Any classes in IMAGE_CLASSES are inherited by all image recipes, including
> the initramfs image.  OE-Core's live/hddimg recipes address this
> by pulling in the class configuration in recipe scope, rather than
> global scope.  Copy that behavior here.

Nice work Brad. This fixes our build failure issues on the Jenkins CI box.

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/classes/image-overlay.bbclass            | 8 +++++---
>  meta-phosphor/classes/obmc-phosphor-image.bbclass      | 7 +++++++
>  meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 -
>  3 files changed, 12 insertions(+), 4 deletions(-)
