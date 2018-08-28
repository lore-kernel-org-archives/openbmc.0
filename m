Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aTQWS50T"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420GFg0y9TzDrM8
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:38:46 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id j8-v6so1019876pll.12
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RPcJqZ88PNoADUpXisr7pmZRC/rMsu/9kiyGllqrmsQ=;
 b=aTQWS50T05oys3BijLE6AjJFFmdeUlMNoujnrkSIE1BM/5GY/VfYG4yNFwyb75zQIk
 6/xg1GYTacEMyHiufeMNvnWEiIytC1irRH2gxbRyhODT7WG4wT0prCDRXXErWGmDQjCV
 5n4n6PM25Rd4seS2hSdjaBk2GxmFLs6bVMcpwWAS+S+Yl74coB+It6vmv+ghLcRMKPC5
 wK58GLwK9ZZBU5Eb7E37Ag+g/c3zYTPEIpOzHEc/0NK9T0cWuC/IFR7NJcUhXn0UjVkc
 +sXKIWrqFrYd39ZrjF7Eq5Abr71seotsZbRPug0S5fh6u/B8PZZdPEkaRoey2xDbzqaE
 mQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RPcJqZ88PNoADUpXisr7pmZRC/rMsu/9kiyGllqrmsQ=;
 b=pDIkPrgMuUHP1FlMaKDQDCTEzAZozJ8wiB2OGuPk7YTR7GbnVLJWxGtLxiRZlvgNix
 Vpws75ozjEdoBq+hTefZpMO5WqU+vme9CDBUH2h/yA0RDgOZ+WRf88zw0i9WUSHGtMrw
 tn+RAyYZ6zzEBZpVfNSCzz96K+a9aLjzl670SnYCoeyTf/fz8dHjv4y6ML+veee1U2PA
 cLA9Mi11o+a3mKI/L8U68mSz61Cm4eGqPFqShQ3SFjOm11VnNwYZBFn3WZ0O3DbN+G6W
 XisR9VgoHdLIXhWS6Eyx/zHPYrIKACX0R8TVpmAXI/Gv7POTPWsPe9IbSlsJfmQ2/1oO
 XAYg==
X-Gm-Message-State: APzg51A+jQJ9VrAawNCFjLUI9GWssDG1+irc+jWVojLtIKtJXS7nGr6U
 KWdLOftHuhHYMfVwWxiA13xO6lKluJPcT2Lt2UfpXA==
X-Google-Smtp-Source: ANB0Vda3CevZ1COAFQCBUCS6X1Y8UsUi6lNTMpINL4Nc8l9kIKTUQucx2vhAX5hs2fAwIUKfoxLre4/p4pnCQOgZ9Ns=
X-Received: by 2002:a17:902:28eb:: with SMTP id
 f98-v6mr2454618plb.149.1535477924430; 
 Tue, 28 Aug 2018 10:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyOhkCDeTOJ57edK8z61_6HKDtWahahx-U_fk8JukBctw@mail.gmail.com>
 <6F027861-92AD-46AC-83AE-61D7C7E0A794@fuzziesquirrel.com>
In-Reply-To: <6F027861-92AD-46AC-83AE-61D7C7E0A794@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 28 Aug 2018 10:38:32 -0700
Message-ID: <CAO=notyyr9Z3qBL=zYKu8-2q=69FYsc31HBpBqsV0k4t5bMzMg@mail.gmail.com>
Subject: Re: meta-google subtree repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 28 Aug 2018 17:38:48 -0000

On Tue, Aug 28, 2018 at 10:31 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Aug 28, 2018, at 12:19 PM, Patrick Venture <venture@google.com> wrot=
e:
> >
> > Brad,
> >
> > I'm looking to send some more OEM IPMI code upstream, and since we're
> > using subtrees, perhaps it makes sense to have their recipes live
> > under meta-google under openbmc/openbmc instead of meta-phosphor.
> >
> > If you think sure, then please create a meta-google layer repository.
> >
>
> Done.  Once you have merged an initial patch please let me know and I=E2=
=80=99ll
> add it to the combo-layer config I have setup for assembling openbmc/open=
bmc.

Thanks. I'm going to work with Nancy shortly to determine what to send
up first and get this train going.

>
> -brad
>
> > Patrick
