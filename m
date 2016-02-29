Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF1911A0344
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 12:01:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=iobN5g3I; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=k5+cNw7X; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id u2so9225012obz.3
 for <openbmc@lists.ozlabs.org>; Sun, 28 Feb 2016 17:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uosvn2zMFcbDYKKKCw7GTW8BNNtCZG7uT4/RTfOEzfU=;
 b=iobN5g3IVD3J94xfdCv1Nfq6OrQc4+C7vAuRRQmj7H40dn83m6MC9geAobo+XITm9B
 EAVmU/xbBITp34GhAGe3hoLsETaTD1qrxsrI9SyuNB8rJOy0GMMSRxk6RXMevRaPBI/0
 a2i9kmEaSBzbPPpTciKko1xHhE0FG3+juk1I9z9IZkKasrRzVGRHR6mKb5omElYlWdnm
 7YXTYCgHUancnjt7L24yZuqblFEeWnf5S8f52vHI4vnTXxOG1nXl2izfiuXz57oSghBk
 7kCDhpa8p7Vrg0jE9zUh8RxqMrH2HhaMnJKo/P3y0gt0Ck7iZ+sbWHtG8fdE/cX+EcpD
 0xIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uosvn2zMFcbDYKKKCw7GTW8BNNtCZG7uT4/RTfOEzfU=;
 b=k5+cNw7X85HF7Q/cL9gtGD1oUR0EN+CiXMVVrdZgpoGdoaSs8wpoaKqDMBge5G6KOf
 3uXOpKv/6V3wQDRzINlS/3rnNABR+kaf0j+fXd5d6q49MwYW8VZ54iukxV7JZrEAbPsg
 aoaxd4X45SHQ5CkUcs1Hfi9uxsMtqluB/qsS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uosvn2zMFcbDYKKKCw7GTW8BNNtCZG7uT4/RTfOEzfU=;
 b=G0jI0ccunP0vUe41x0QwksFXe9upc4/bbG9B/iJ0+R9V7DaiVxoy9CArSlDZhaUQ/X
 +DCqFgHVPIGgmRqtTxui3VqjYexctuuhR0wIWSO8sC1YlsG5Va5GhI9XUf9ym7WBJbFA
 D0oulPJttN2P7vToLd6r4qgkz35rcEXmEenrrZOpLOvyWgtgJn9Y8TKxYz3/sLqKuF5v
 wzSomaYMb8u6KWut/2sBADDrHL7s4yfBV23Sydg5JxljuW1OZuD138sR9lOl8fOG79XW
 jWoH7iO4dgJbrDiOsOwrDPrQlJiKGnuruYMkm1gP9dTh61X2nlIlXGmWmhM2wVtVeCBQ
 utZA==
X-Gm-Message-State: AD7BkJKEBI+8NhwV0R4YGmKlO0FuRpXIW2zkKDzvfrqQkgQKooqoxsZ1a8RlyI/a9Yo/dncRvxbcbd9e/zRsnw==
X-Received: by 10.182.144.133 with SMTP id sm5mr10296890obb.69.1456707678275; 
 Sun, 28 Feb 2016 17:01:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 28 Feb 2016 17:00:58 -0800 (PST)
In-Reply-To: <20160229090853.3559a7af@camb691>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
 <20160226163612.4491a525@camb691>
 <CACPK8XcNM2j-ehHWC9mF_HXLUeuqc4M2HZxE_=ZXy1OMoEAyfA@mail.gmail.com>
 <20160229090853.3559a7af@camb691>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Feb 2016 11:30:58 +1030
X-Google-Sender-Auth: mJLAUN03a0db4N9YlbhPGmF_YVs
Message-ID: <CACPK8Xe4XQu9EcoJZ5J3q_LFgS_n_D36dfG+9fh_i7VRhvXUdA@mail.gmail.com>
Subject: Re: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 29 Feb 2016 01:01:21 -0000

On Mon, Feb 29, 2016 at 8:38 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> On Fri, 26 Feb 2016 17:09:40 +1030
> So that is the preferred workflow? Happy to not do pull req but I've sortof
> just gone with the majority.

Yes. Doubly so for kernel patches (I'm the maintainer of that repo).

We want the project to use the same workflow as most of the other
projects that open source developers are familair with; xorg, kernel,
skiboot, etc.

I think the reason we're using the github -> mailinglist bridge is
down people on the project not having access to real email servers
they can use with git send-email.

> There's simply no way with stuff coming from GitHub? I find myself misreplying
> to a lot of those...

The github to mailing list bridge is Patrick's work. I suggested to
him that we pull the author's name from patches and cc them; he's
added it to his list.

Cheers,

Joel
