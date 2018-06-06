Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ramtkX5G"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RITOXshX"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4112sc3p1MzF2vj
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 19:08:52 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id d3-v6so5595283qto.1
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jun 2018 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0vSCtS6cvgu2nQBmX8TjOpEA2weVYl0D08dZh4IosEQ=;
 b=ramtkX5GA5zTBm0Y2ONus6c0O5cSrDZetlUhFvpV4i64PWfrkPmuXHyQGRxEeg05pC
 iDlOoVB0XDxiyGoYMAUpK8gua/0MWWNMWKzMJZN7DqcQqlZmPpA0ZLZoZZ/ofWGD5tM3
 GTFEQz7eQGHfq6WGHWrOIrY7iCnGDAifIYSmc1nneU5bMEGosdquM5BCMIbuGMuKmaW/
 q+6UD1hlTZst4mgCXq3genD7ZL4m8GQF/MQx2YfIDGMX+KDSw9qwwLinPEIwUjvd4O4b
 fRSkr0ANpvL5a/tv2gycdRYRGTNGspst0AIhcNkAvd4CYIAGler7oUCP4x92fvHPAn9b
 OKWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0vSCtS6cvgu2nQBmX8TjOpEA2weVYl0D08dZh4IosEQ=;
 b=RITOXshXh/WKohEREGAm3/E/SaYhEUTjz490IYFSQc19bQlz7vCg1jV7yOVSYgv6EL
 vuBv1PWj2UrHR1fSAgvJRsI8RS8d0XWbjp10Xpx6TDQ4uo58iooP7dulOAuJaX3vhQpm
 RytSANjLxL85x0/TnAI+GWgzGnTbMypgGn6cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0vSCtS6cvgu2nQBmX8TjOpEA2weVYl0D08dZh4IosEQ=;
 b=q4znuoDZ5BbytjqY0SU0QmWcCerEE1ZkHioyATYcaGObXV78GiD8OcOgBUjcT1LU62
 N75RgIyspocKKLittMsKOuz8Mv1zB5aJ5fLotU3So0qGaO8eJrTcQ/qcQJh6Uftcen3k
 FOzWHkSLVDKIUIgu3/jL0FH5F1ZxWtL7C7uC7BzyK2Zb4Poj7LFbO/3/n4MG9uPXr37U
 2dx/9zxJr+LayJMUpoQPZhqn2jR2ksnfAgcfOz8sYkP6L0juwdFtGmXF1gzkiB4TWBOk
 iQpaeZ4E8x08J76IfZ1fGU1Zo7lxLT20ME0RnidFh+DiQYKSIh0+liD0IAbvcmVYDgyw
 PBCw==
X-Gm-Message-State: APt69E3J4rH7JXnZqPT1dhlGGumTzMsXtUEpvXkyZqBod+Hm0eWfBxnc
 RV88VwrbWAVzx03oR59L9jSlqbUnlZ9v6Y6HXJA=
X-Google-Smtp-Source: ADUXVKJeFco+uKZqiRRgLsnaGUghy9C76sUVbT6n8jmj+vrKG2QYVk5DBVKo0EtpxMZ/XIiKMKb0gsYhVNc9crJclzs=
X-Received: by 2002:ac8:3b49:: with SMTP id
 r9-v6mr1985256qtf.368.1528276130143; 
 Wed, 06 Jun 2018 02:08:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
 Wed, 6 Jun 2018 02:08:29 -0700 (PDT)
In-Reply-To: <CAJoAoZk_uf8MCyp_x-RwKh44YSHPhk1eGAO_R54WuAO52qbJAQ@mail.gmail.com>
References: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
 <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
 <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
 <CAJoAoZk_uf8MCyp_x-RwKh44YSHPhk1eGAO_R54WuAO52qbJAQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Jun 2018 18:38:29 +0930
X-Google-Sender-Auth: ww7vaAo0_iMWEgCg0kU3DQE0ZeI
Message-ID: <CACPK8XfUS5q5f-Ezg7nfyr0fh9m=56CSeYpC=Vzsxz=i6LCssQ@mail.gmail.com>
Subject: Re: Hackathon - Sept 18th - 20th, 2018
To: Emily Shaffer <emilyshaffer@google.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: James Mihm <james.mihm@gmail.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Mihm,
 James" <james.mihm@intel.com>
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
X-List-Received-Date: Wed, 06 Jun 2018 09:08:53 -0000

On 6 June 2018 at 08:25, Emily Shaffer <emilyshaffer@google.com> wrote:
> I'd like to prepare an entry-level talk on various types of testing and
> tenets for writing good tests, if there's enough interest, considering that
> there's an overall push for more testing in OpenBMC and some confusion on
> which kinds of tests we want, and why.  If nobody else is planning to cover,
> I can also try to dig into what kind of test tooling is available on
> OpenBMC.

Andrew J gave some IBMers a presentation on testing recently. From
what I hear it went well.

Andrew, would you like to present that one at the summit? I think it
would complement Emily's ideas.

Cheers,

Joel
