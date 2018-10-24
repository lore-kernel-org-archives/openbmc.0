Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RgbpV57z"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gDbw2PMLzDrHb
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 02:25:47 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id f78-v6so2600172pfe.1
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDr8eM2wBgy7OqTfUFox9FAIy+inGOtaSoractuTpCE=;
 b=RgbpV57zkIPBcwVwK6SwriK346t9hxR7Cl4xnls2xxkPDw2W24gHm/+4SCQKwIJNJv
 /6BmgSuC+smWEE/DXTc+H4yOjWaKIMhwDErh4zbaiCBA/iDV4CJFjC940NaPMPoQYUY9
 LFi+CrrKsqFUkMP4FXvjtZaBG//h/USW5esm+kDr+WGfXXoNQQiyw6cVWjPQR6xGdBGU
 ZjQhFFWrynicqgRbDO/mrM+5pWFD4eF8HkPfE40K6iU2IuNpLPo2HXJPta46U2Fo59Lk
 M36H80ywtz9dM4raDM9237DKl0wLl1a6mKf1d+GEjG/3CTQVXYRst2o+H/FJblphtcSf
 cYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDr8eM2wBgy7OqTfUFox9FAIy+inGOtaSoractuTpCE=;
 b=LE2FHivzjRl8DcD5Kr4RhMbvdet1O2VoHMD35pmVDlkjo0OuEnfpF3MVtqPEqY3pSK
 /hCTZbbLvRKQtmM2RrRaK13jRLUywVC2nLEimo3yWl0CTzdVtD+KQMKvIeBXPX/R8L2r
 sRGCW/GoKSxzOtedLwmOtUsLf4co4CCr1dFEhfK3BKYBIHYJFh0m+VsR2d61gsuOL0kA
 SDMN8VT6iZuGiu5GDqf/t3PwNNRswjlx3MNJco0sGaBpewH61Rsb1JGqxBeX4Wd5jfk+
 mcc/i4+oyjIMTr4KP5HmU2gKAGoR2ja8vsGFWeI+ql5In9ynL/WolRp1s2sbad68fU9x
 oNxw==
X-Gm-Message-State: AGRZ1gJ9WdHSffCECX6f8QQwsDLWeuVCZDQ1oZ28PN9E5JtvKl1UUixD
 IdWR/ODiQfE0MtvinX6jopMXyJZy5vZjJuQFcJzdug==
X-Google-Smtp-Source: AJdET5cnLTqPedGCNKS015GRJbpZz/ZA59ExUU+9JFl0OAsfF/kkc5bizqDlD2VIFwoIpXmD18eSHVmubrsrA+uL7xY=
X-Received: by 2002:a63:fc49:: with SMTP id r9mr2013076pgk.209.1540394745609; 
 Wed, 24 Oct 2018 08:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx4Csmkf8f-PkrTST4kKu_petj4+CF4f_oC4venws2FXA@mail.gmail.com>
 <A943BC2A-1FB4-49E0-ACA1-174AE684BC10@fuzziesquirrel.com>
In-Reply-To: <A943BC2A-1FB4-49E0-ACA1-174AE684BC10@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 24 Oct 2018 08:25:34 -0700
Message-ID: <CAO=notxevcP7_JWrKNr_wkN1Kz-8uGbx6Hua5CiwQyPD6H4K=w@mail.gmail.com>
Subject: Re: New Repo Request: google-ipmi-i2c
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Peter Hanson <peterh@google.com>
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
X-List-Received-Date: Wed, 24 Oct 2018 15:25:49 -0000

On Wed, Oct 24, 2018 at 5:57 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
>
> > On Oct 7, 2018, at 6:25 PM, Patrick Venture <venture@google.com> wrote:
> >
> > After reviewing the use cases, this extension to IPMI may belong as
> > part of the google suite of openbmc customizations we want to publish.
> >
> > I request a new repository: google-ipmi-i2c
> > Maintainer permissions list group thing: the same as meta-google**
>
> Sorry Patrick I had forgotten about this.  Created.

No problem.  I'll work with Peter next time I see him to stage his
patch on there so it preserves the original author.

>
> -brad
