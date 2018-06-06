Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22a; helo=mail-qk0-x22a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ttfxbFIr"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hKsvwLBF"; 
 dkim-atps=neutral
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4112zm5Kv4zF2vj
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 19:14:12 +1000 (AEST)
Received: by mail-qk0-x22a.google.com with SMTP id d130-v6so3479000qkc.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jun 2018 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gdqjI+9LNKIzpfFDvzXFDe5DGZ6NPPsYtjVT6ylPBaQ=;
 b=ttfxbFIruLioqFEkvt0KXNcKanlYm7CO18jjhX/IbW+x5meypasqVCEILtseG7KM6b
 V0QsYEnvVgswQNJh0CxEvVFi68sVruELv2Dc75pyuXghoTsIkHx+MvrQkXD4f88KWqlS
 ufQOBV8fXmIduTzjBoW+V2QcHuKtgWxrfPAmsKHkLcsHMcgzUKOv7oBVYKqEeEutGRXO
 X3SrF1TFxxFPriRWa8vEIW57xhzWzC8EhjVrg6cCmJDXXgljb5wwJMo7O/CJP6e+0n2q
 N1b2rmunn6/XtKxy9cKnrfTUz71TU4XZsXOc3ErfuglUFIOtaKkIsHD8mAsODAkyY6cq
 EzCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gdqjI+9LNKIzpfFDvzXFDe5DGZ6NPPsYtjVT6ylPBaQ=;
 b=hKsvwLBF5jIerzZJ12R4Z9MHZpzIXrUlfW/slH2FXo9E8eYF0ywun75bGavjx9t6bQ
 yar00kniXb3OAmnlbrC4C3kalA6Xv5tGhPXxxasAnTjFAtHSw79zS8g4QIBBjBwEiRkW
 qo2UN0JUt8cupskCE2jjGV4dLzzA5kzDnZHA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gdqjI+9LNKIzpfFDvzXFDe5DGZ6NPPsYtjVT6ylPBaQ=;
 b=QQURh5/e9i20Q9EMl7Zc0ZPcKu+MRDJ3fBLBXQrPee8XZhCMgGDr82y/UBodJBRWle
 W4gcxRnOkT3flsBLfkWUyGhyFsEbWAdWmhcjPuo1tYQme7bPRfFqhZjUMCjFhXhjT9Sx
 Ss5z3Y07Q3l2hPvmUIthNGWL42otMJ8OH59RELk1Qu1Kp92XDWad1pjCAkmkGW+LAfBY
 3uqZqaQQmoBE78IaRdk8JxfRBVT/+LTUXi0miYEJB2pfXrBeuk4/euWmiYJNLj0vTqAl
 uNO6JPijLMAhT6z6ttxjbURurKqNndZChNt6qv8AfDs3lLNd3jrMmscHbJZr58X4Sak5
 hnkg==
X-Gm-Message-State: APt69E2M4P97kRqGK/5Q3+lEsXrlBOM1xGY7SA7IWS+IZJVpVqxdgJ5B
 FFn8J3k80kdJD6SCNg/Em2Zt2WldL2StlKBF1vI=
X-Google-Smtp-Source: ADUXVKLGyq25Ho9a1S72Ol00XQcdkNRm8R/UfXC6HZ7Y+Rlp3nkmFzB9H2J4rkwchlEJBcGWya3j6mpxTB8prCUJakk=
X-Received: by 2002:a37:1286:: with SMTP id 6-v6mr1720714qks.158.1528276449350; 
 Wed, 06 Jun 2018 02:14:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
 Wed, 6 Jun 2018 02:13:48 -0700 (PDT)
In-Reply-To: <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
References: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
 <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
 <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Jun 2018 18:43:48 +0930
X-Google-Sender-Auth: Lm8VaeMLPdjEMYHK3qukvB_3X_U
Message-ID: <CACPK8XcWry4PK56xsuvocD=9B9Y+YR6ObKeaSNDrQXA8iAar_A@mail.gmail.com>
Subject: Re: Hackathon - Sept 18th - 20th, 2018
To: James Mihm <james.mihm@gmail.com>
Cc: "Mihm, James" <james.mihm@intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 06 Jun 2018 09:14:13 -0000

On 6 June 2018 at 08:18, James Mihm <james.mihm@gmail.com> wrote:
> Thank you Joel!
>
> This is meant to be a community-driven event. Please share your ideas
> for topics of discussion or work sessions.
>
> Here are some additional ideas I'd like to share and get community input on.

Sure. Last time we met I gave an overview of the Linux work. I could
give a status update, as we have made good progress since January.

 * Linux kernel status update

Here's one that I would like to see progress on:

 * Common update tooling

>
> Community Networking after 5pm
>      Pub-n-grub
>      Brainstorming sessions

I look forward to these sessions.

Cheers,

Joel
