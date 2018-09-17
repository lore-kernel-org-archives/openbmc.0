Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Mn1Mv0rT"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DXvr4ylpzDqSL
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 03:20:56 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id p5-v6so7741312plk.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0EBSC80t/XUGC+wx3K7u4mSJLfmfYqLNZSXZqAOcVjI=;
 b=Mn1Mv0rTyoh5fpORmUX1oNmalAv4ZgyHSdX1ZvhMPVtUnZcitOjDVYyxeVzMtod7hO
 qyS29plsE8l4KNIumjbVWnvRwQ98ZJhTXUeCPzQstgVgP8CzId4LvlxNBW1X03lnBH9n
 FTwbBfBZ1KogwSSJB7xRLUPDZlBJlXnJ80bW7FBD+619y3LoDKhaKZ6qdwMKfQUqrRFE
 tj64aNfi/kR3ChL/UozheLNmooelPNhYuNeCky05PPf9AfqLS149xRvc6r5XqTofdUVj
 C19JBahd/WpuUcdKBMHftlStPP4EUq3LlOyuIKGLzqI2z3wYlATT2tMZE/hScqI5jNQt
 RT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0EBSC80t/XUGC+wx3K7u4mSJLfmfYqLNZSXZqAOcVjI=;
 b=eS7n9m/QEr+aMi7A8oYQ1hpP0mvCzEHcUIdCApmxM/uFAuzpPR9yvIsxvqL22Gccu+
 VpTaSJaaCAh1t3LhA+WPpdELgvbHDc+0Oj93AAyfhCvWYEpPzbQR4T7qKzIGXTddaDZj
 rXSMxTo6fnDYV8AeZagKsB+m/1T4VB48dhtPDXDaHFLNdhw10yBu2AZFD5Z/hps0cWyu
 XTjeIu5kwFGicVrinxwgA2XFeHrrXO6MuZTYtPwMK1i2T5CZGnI8xYRE1jVIj8wde28M
 iCaJQnXtEHBp7TZC6VvHSDFBDDwox3PJVNHNt7hq/dnT49YCgvHllxdwa877uE1nSrJM
 aScg==
X-Gm-Message-State: APzg51Bl4DtjX/mVsHQUC+RVMWavzSBiSEB9dd9Kep9omV4VNH2O2+dP
 k+ROSp7FzDO7Vr5egqODTejZtnASSHoUC9kUshG+xFWv
X-Google-Smtp-Source: ANB0VdYchsTnCb3wu5oGTefOf0bq6BSWG5ujYxRjSohT437SowzFVcAS2gw+h7aGeLUaoIiSGokklyUNo52di3VTOC0=
X-Received: by 2002:a17:902:5301:: with SMTP id
 b1-v6mr25652866pli.149.1537204854085; 
 Mon, 17 Sep 2018 10:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxkKpZMyPktPjJ+HeYYuOnwcGMvV6ewdEvdMBUqioLvGg@mail.gmail.com>
 <62B77266-3919-48A4-91E1-BF6EACDC4E47@fuzziesquirrel.com>
In-Reply-To: <62B77266-3919-48A4-91E1-BF6EACDC4E47@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Sep 2018 10:20:41 -0700
Message-ID: <CAO=notz2r=s3+Odk5x9i-d_VSD0m8q5VnmmHzQ4pnDuQtzpmgA@mail.gmail.com>
Subject: Re: New repository Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 17 Sep 2018 17:20:57 -0000

On Mon, Sep 17, 2018 at 7:03 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Sep 14, 2018, at 7:57 PM, Patrick Venture <venture@google.com> wrote:
> >
> > Brad;
> >
> > Please create: google-ipmi-sys -- this is to hold OEM IPMI commands we
> > want to share with the community and vendors, but dont' expect to be
> > picked up by OpenBMC at large, similar to intel-ipmi-oem.
>
> All the existing OEM IPMI repositories end with -ipmi-oem.  Does that not
> make sense here?

So phosphor-ipmi-blobs and phosphor-ipmi-flash are both ipmi-oem
libraries.  As well as phosphor-ipmi-ethstats.  My thinking was having
-ipmi- in the name was conveying sufficient information related to
this.
