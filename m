Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RSEDVtAm"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L6Zn705szF3Lk
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 04:55:29 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id y81-v6so21320oia.6
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1Z77zNLqpJbAZ4sH3cmgqIzyHpQvICq1ekg+bFQC98=;
 b=RSEDVtAmIAMKNSzlNoGUXsnBIfAlOhexFnoXdlM/FNItwIH7TygJr6Rddz/OyZ+ArP
 ukoedIEz9XYm674jwEyPs1c2EnXkBvNkc5pR+kklfgREc4529GeVxfzzptwwL9U0CJY9
 KTAnbbtoZdSDoRxDFSreMwjL8wHkXO714/vQ41h07Nml25MAMjhryVjR0sWrfBnZRV5x
 M3Qrpq+U29XzN1gl6FE2i/Cy/wf1aC39fSVIZ+zgm4yPzQQ5y69qOU7dCKQHB26dHoF8
 X2lmzf5MwvjkF/2MOQvdKC9E7QranfjR6EPlbqM3PQxyVd6LaSI4koGrXW32Qa4efXaf
 7Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1Z77zNLqpJbAZ4sH3cmgqIzyHpQvICq1ekg+bFQC98=;
 b=Nnu7odoD2Fsa6nTeqKvPIOKIvtlMCZGdd+fo/kc2BQ2p9PbFAztdLJbaJIcPno/NIy
 904kwl4aWrBMc39NMNPAf2EPSaLAspxHz6Vuet4wsDJmphm+95qDx8Gs2x/0jkPh+YU8
 5XWblmBY1l+IdbEgmyLRA3WzoeTK1+tO2SHem7/KRNh9WSb1cFID5+mfGaI7RXOf/lUC
 ejs3d9Pimj9RoS/5Vs4KYPEbRNjnR8FiKmwXO+D3ATO2SqsuJBujmuneUJfn93ByGGhg
 oFT5f+oMS4kSvserJXrhzh5ebDu1NVOMi5QSWeWp5O4XiR1NlHtvRVPCdZwZwmvH0iU/
 D2gA==
X-Gm-Message-State: ABuFfog00fu8L+vHuC+h2rBIMEMnNo5Xeuc6TEe93qc312yVHxA3R7KP
 MPfWNb9XIo7KfiWuHL/wCX5xBodKXMwst8zRobw=
X-Google-Smtp-Source: ACcGV62qPeyj8YCzgVHTghrY6EzfPmf48Kae1a91nhSi+YFozbiUsjb5otFYVCdIjWVCkCxmZD4E/YG4V87+ns+jAG8=
X-Received: by 2002:aca:d447:: with SMTP id
 l68-v6mr1428786oig.222.1537988126729; 
 Wed, 26 Sep 2018 11:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
 <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
 <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
 <CALLMt=o2y0TpXZCwjw--MiLJWo_5tg38i2K00Ety1AScO1M9Ew@mail.gmail.com>
 <ED9FEA73-985B-4898-8255-F60580024A82@fuzziesquirrel.com>
 <CAO=notwdKFmckUgOCHdGWUsyAb3iSDd6aLoAg=PLULnFyFyJAA@mail.gmail.com>
 <MWHPR15MB1486F7ACD2A589B82CE0B9E9B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
In-Reply-To: <MWHPR15MB1486F7ACD2A589B82CE0B9E9B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 26 Sep 2018 13:55:15 -0500
Message-ID: <CALLMt=oj0mZwOKpKodC12r_vjCQ9n6Ysu5DH0bVP-NW6VsM+vw@mail.gmail.com>
Subject: Re: Link-up between Gerrit & Github
To: amithash@fb.com
Cc: Patrick Venture <venture@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 26 Sep 2018 18:55:31 -0000

On Wed, Sep 26, 2018 at 1:40 PM Amithash Prasad <amithash@fb.com> wrote:
>
> > > I did the restart and saw some of our new repos get synched up
>
> Andrew, I think it's time to restart the gerrit server again! I don't see patches +2d on gerrit for (the newly added) meta-facebook showing up on github :-(

Done!

>
