Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ro9hBGXU"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420qG00GQQzF325
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 01:25:59 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id z25-v6so2476418pgu.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=inNMuyScyCQnJ7rFCjN1XrXDMncXhpR05WR2DPJ3jDU=;
 b=Ro9hBGXUTMPY6LidHyznVw3U6KApc+5EQmPmovj/BwoCp+cS+Vcg44wS9Q+lq86UUW
 ENXKrRdf5RlArOmn9W4tBc3Dx8aiNaVPHKsc3ptrXZaAI7mCqhVgj0pEtf0O1Q2tq85j
 C7TKKPj1XdlPiUzhWvpiJPXoEEw0x3alNM6D1T+MPliOujXWDiolW/ZBIPQhfi6Lyvg8
 bbA92PNMUn3N2tbqWF7rtetL47MzH97OdMa4b4lZooxW6dGuXz85B4hLE7DMsAIEhYA7
 0qDeQs4IllgRaFx5fE1mFadF9Eu15bA10SiQnHykMZsdb1A7nh8aKpi/HDerAF5r12Cy
 jdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=inNMuyScyCQnJ7rFCjN1XrXDMncXhpR05WR2DPJ3jDU=;
 b=TmrFVSYFqwGlZ2B+SKzw+NE6FVwGqACRNfmE+Faunt8dIAzOIIKH2ipjEotfts+Nz1
 F5tZI3z6nTLYR4q2uwbtlxL6lkWJVsEhExavzRbm9E5AuEL5JuNhy1QFEnbxfHlEm8jT
 xnb1GaZFpVeoOcO0Pb1OuO5Q7ozE9hDg+GMhhxLvZZzjMKqpOTQr/lr21umrWZD67Hr/
 2Yyz7XZJ/37Pg2GBwNBxza8zryc7I3APpTGsGlvFbgem4g8dmr7QZy1xTCurjiVfn2pR
 FDIWtwdQYGIOAlm5ZBwH174TAL17dl12KKJu3Ygne37h+zCyg/UtHETvk3hp2BjJAOoS
 9X0w==
X-Gm-Message-State: APzg51CF8GNTH+U0aa/OnA4BKBVQ0nGnnjjXuHhLOCISXLOR7Z9i6v5H
 N9bq/gVYeIo5njGVSnuF18lJwTZlZ4+N9ukNZHvhTg==
X-Google-Smtp-Source: ANB0VdYsgoBXDIy5sktCqeZa2vYYKU9vC0HyDHzVh+N4RLQ7WswC0ForsiqeZIzIz62ch9b0PPW+K6C1w1zKnH8Fays=
X-Received: by 2002:a63:6745:: with SMTP id
 b66-v6mr6379943pgc.248.1535556357779; 
 Wed, 29 Aug 2018 08:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzut2sd4GZvA3gMzoB+J7g48nXnXKONhnwNfJC8jPWPAg@mail.gmail.com>
 <c3d8f4e3-86e2-8fae-5c6e-49632262b8a9@linux.intel.com>
 <CAPnigK=420eP_9d04FMCyvCzyoDB=f7i+ZbNMkxa5kGL9avd3A@mail.gmail.com>
 <CAARXrt=Mq9PFZ-ia9pE5WKxbSUYatx9R9Uj7Bum1AHiyFvP5VQ@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169934583716B@ORSMSX114.amr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345837197@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345837197@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 08:25:46 -0700
Message-ID: <CAO=noty_GHeVisSHZzqbAfbpKjRUrz-dMG0ETD7Kh4WUSaEJ=A@mail.gmail.com>
Subject: Re: Header inclusion ordering style addition
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: Lei YU <mine260309@gmail.com>, William Kennington <wak@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 15:26:00 -0000

On Tue, Aug 28, 2018 at 11:59 PM Tanous, Ed <ed.tanous@intel.com> wrote:
>
> I should also mention that bmcweb already uses the clang-format file to order headers based on some specific libraries.  It might be a decent example of how to do it for other repositories.
>
> https://github.com/openbmc/bmcweb/blob/master/.clang-format

In this gtest/gmock are put above the other headers, which I think
makes sense for the test code at least, I will grab this explicit line
and add it to the review in progress.

PTAL -- also, there is a review of this clang-format under the docs repo:

https://gerrit.openbmc-project.xyz/12180

>
> -Ed
