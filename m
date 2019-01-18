Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NqNfvFRD"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h9QM6Zl8zDr85
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 06:06:03 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id z9so7050429pfi.2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 11:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTpRpJvlnz9ZiSv1VDPivfKtr1WtFt5sFS12EgAOL/E=;
 b=NqNfvFRDYYKIphWNJ6p/7Nirw2HpRxGtkF1Uz6wqOtlOGwyE4oQvT6WusNrl268Ybz
 JAAxO7b63BSTPElycJ23GsFjQXCwyw/AvGCSG+r2ueDngE4EqDB4iqmwB9IGfDbOK3vV
 GQ41egG2MOKKaL/sZqYmjBszwtPO1sLJRMYTTmdHacVPn0yEUOfkvbldQbrgYPoVoaQF
 hLuOrilnEsGqjY0dLxMS5iW80NRTXIkEReaLBlXlXEMkRziZnj3JHVQATreNrRqom0L6
 vS1DpBYgxk4yEVjOM5I4gQ43LjjACIDPqVSk15iEAVexAXlEwkFurePsRtmqbEp1Gwv3
 Oe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTpRpJvlnz9ZiSv1VDPivfKtr1WtFt5sFS12EgAOL/E=;
 b=PgLjwftChjas0P4nWUqzbMB6SWSLmtpQ7EOAqrmAhRlgK6IMFYTxlH9EU2mQMNVSgS
 vQmot3Zt1KR4saQtq8EJiXlxtKssgHwv2ZAwzmyJjXdmPQuWNcTZ+pQ2rioz1jntbo5i
 pojbO5SSfS6aMbEw1xHRkY9L/ofb5dwYlibswVQMjQcGWa/CmWfOvKBG5B4Qb1pn5yVj
 LKpx7msNsnuiszSWsW1YQ2g9A1a56ay1fp11OAr9fyEVfRWuMUhixzaFqQEyNDuhxEuS
 /2fYlf/y9QUQh17kGFpsA3bhHvnbkbxnJk8Bq/eu5sWQ1NZJz25gIjmnD81qYHeZ1Jt7
 EfRQ==
X-Gm-Message-State: AJcUukdZFYTXI9S54XgonVExkEl0Qfj3nuk2DEehBIowQkCK6+TrQh4b
 GaEl3cOwQY85KMayeBTN+qyffV6v0bgufuEWjWtUAyxGPwg=
X-Google-Smtp-Source: ALg8bN71z3tOqSks8odQDmJEAmM5ImasfTVT8FXJELRljTnzb1tfBvsswf/U4gP72B87MytbybA1ZtrDXabHEa5Nhes=
X-Received: by 2002:a62:ea09:: with SMTP id t9mr21484498pfh.228.1547838361571; 
 Fri, 18 Jan 2019 11:06:01 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notxJck9xYXKv=BYADuZV1Ya771bS7Mc_-1OUfDp4iFTq2A@mail.gmail.com>
 <CAO=notw=47cYNHD05s1gi5Hbef=+d+WNXoapdFMS+vY+vYq1_g@mail.gmail.com>
In-Reply-To: <CAO=notw=47cYNHD05s1gi5Hbef=+d+WNXoapdFMS+vY+vYq1_g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Jan 2019 11:05:50 -0800
Message-ID: <CAO=notx0RWapHUzccB+Gbb6HxMUX9NAdzy8eGBnAp-HoJg+Zpg@mail.gmail.com>
Subject: Re: Using mmap against aspeed-lpc-ctrl device - weird bytes :D
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 18 Jan 2019 19:06:05 -0000

On Fri, Jan 18, 2019 at 10:52 AM Patrick Venture <venture@google.com> wrote:
>
> On Fri, Jan 18, 2019 at 10:38 AM Patrick Venture <venture@google.com> wrote:
> >
> > Just to give you some context snippets:
> >
> > System DTS snippet:
> >
> > reserved-memory {
> >  #address-cells = <1>;
> >  #size-cells = <1>;
> >  ranges;
> >  lpc_mapped_memory: region@98000000 {
> >   no-map;
> >   reg = <0x98000000 0x00800000>; /* 8MB */
> >  };
> > };
> >
> > &lpc_ctrl {
> >  status = "okay";
> >  memory-region = <&lpc_mapped_memory>;
> >  flash = <&spi1>; // spi disabled, but needed for lpc_ctrl to probe
> > };
> >
> > So, on the BMC, it receives the host's memory map address --> so it
> > can configure the window:
> >
> > https://github.com/openbmc/phosphor-ipmi-flash/blob/master/lpc_aspeed.cpp#L42
> >
> > Then the host tool, mmap's to the host set-aside address, 4KiB, and
> > tells the BMC to copy out the 4KiB:
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/17505
>
> Reading the mapping code more closely, I see I'm setting the offset to
> the memory window -- this made sense when using /dev/mem, but for
> aspeed-lpc-ctrl maybe it should be 0.  Testing that now.

Using an offset of 0 in the mapping call, which makes sense, is
providing bytes that appear to be legitimate.

Thanks for letting me think out loud.

>
> >
> > Keep in mind, previously this was working by the BMC opening /dev/mem
> > and mapping against lpc_mapped_memory -- but now we're opening
> > aspeed-lpc-ctrl.  In the code above, regionAddress ==
> > lpc_mapped_memory, and regionSize is 64KiB.
> >
> > Can you take a look to at least sanity check this?
> >
> > It ends up copying out data that looks like this:
> >
> > 00000000  0a 00 01 00 0a 00 01 00  0a 00 01 00 0a 00 01 00  |................|
> > *
> > 00001000
> >
> > Patrick
