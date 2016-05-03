Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzPys5GYQzDq62
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 12:20:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PJ9KKWK5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=JF2SR/s6; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id f63so665469oig.0
 for <openbmc@lists.ozlabs.org>; Mon, 02 May 2016 19:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Ejj9pWi10nycFDpQRfAt6ff+/ZVDx/cFCtDBcUdR53M=;
 b=PJ9KKWK5ed77msX+fyTCXonwv3yN3EXSemy6c1H98XUUh7CuIwzjdFMpoMrGc7oqtD
 gTSDDatUDY7wsw6dZMYmturBZHm52YkR315KMoIIZS87b8eGXpypzhytx4y4qLv/2f9b
 cqMwG33ka3tJQSW9VaO2ps9qHaIsc4AHuV7es9rPwDEO5RBibXnximGzHGRaBKakuwJg
 jL/bBXYw2VlSzrxGWMt3Z4Wu3DYvJxRZ9zC+Ldc+apOlccssdBYmvCR6iqk6CroEpXGz
 WbZfbWwIyX9YqPL6ksXj7wbH7wH7Li7L4XPPiXq/2kXUaz/o0KG56dquDxGSADvRO5HQ
 R9nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Ejj9pWi10nycFDpQRfAt6ff+/ZVDx/cFCtDBcUdR53M=;
 b=JF2SR/s6e6FYdPnbadsl8TGByo4GBGTvY9xkKIYttgKweg4s+tJA97bW2ObGrXh+JS
 bb8BT2qhcTEvLMVcn6fdxIVWEqI24JBu3UA1EflGimYN1ffzOoDTjzJRBzvKwy03w2/2
 dthsXDzpKeTuiAjzI/3ZlUW1O6SLOIZaSH8gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Ejj9pWi10nycFDpQRfAt6ff+/ZVDx/cFCtDBcUdR53M=;
 b=RyQEfdzQAY6KXiVLxrxJIjDYqiPxgKZo99PocbvPqJeCR0IKu+H9LeVhe/LM39UWFx
 UTi4OoAnGusWLZD7cp+71doPvVSsX4WYZh0wf5RkffoSemEGdVvSyC8h4oIC+zP11DEq
 aBF2/Oxpln/Fshh4VyrZxsXyidY7Cm8b3gANhcTs56mQO7cKKCDdHllRo9OTviT2P+Pk
 h6aShJYlxOB87Rni4Kx8BtDMk1XLG/Nl5QQcuKIIsliZAwoJQVMCtK/qHtuXrx1MSIF0
 fzoEzAMTQ8u+sKYlKQOgkff7ajErCx9BjrKSHDQyDuwgfzWWt/VFFLVlUx7CAqpR1t+a
 xQKA==
X-Gm-Message-State: AOPr4FV2vBLFIyxnsVRyGt1yb38C8r4UMGiqcNF6ALdX8BQBMXiWFVdeKB8JxC+RNalI91fLu7XeykOIt4CFnw==
X-Received: by 10.157.14.82 with SMTP id n18mr15219431otd.188.1462242019796;
 Mon, 02 May 2016 19:20:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Mon, 2 May 2016 19:20:00 -0700 (PDT)
In-Reply-To: <1461949847-22156-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461949847-22156-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461949847-22156-4-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 May 2016 11:50:00 +0930
X-Google-Sender-Auth: cFV6IL029k5nVQ4CXQNWApFjsFw
Message-ID: <CACPK8Xd_eSDN4tOPNY-=Zr51WV-98QQo4-6Or0dLuzR432+gVQ@mail.gmail.com>
Subject: Re: [PATCH pyphosphor v2 3/4] Added python to dts encoder
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@us.ibm.com>
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
X-List-Received-Date: Tue, 03 May 2016 02:20:23 -0000

Hey Brad,

On Sat, Apr 30, 2016 at 2:40 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> This is a rudimentary python to device tree encoder.

What's the purpose of this code?

Cheers,

Joel
