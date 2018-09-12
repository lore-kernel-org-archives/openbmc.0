Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VfusYFca"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429QyN6x0PzF37B
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 01:42:20 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id r1-v6so1251668pgp.11
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RCa9dJqpBUPSj5zE6B1n/Lb9qV16ucPXdZOqSG5it2k=;
 b=VfusYFcac5RblrR146+fW4j8Orf1x1A9DdM8mx5YtBNSHlmu2tYFMgUhI61kis7c2w
 I5xQYxO/cerRCuqM0mp4EdmvzhRUZvsTScjxaf7mEtofqUsbk3O0bkTjJxBomOjqDR45
 aLa4wKrl7/PFVtSENkyhIOX4p9XMAKKtlAIEj+hBCRpn89wlhs3qF9cmLapkLrPmWux3
 k5NyP9g4pwzbswkqtr4H3nJrMDyZ1FVjYh/DAoAghZGKeYGJjZt37RSxIbNEBV6lDAi9
 T1vKJnErNv1jzVuAwDbDuiWCs0L9AB8+C4alKF9fqUD5/DAxYcxxO2OFsFmzhiODWXxZ
 Rfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RCa9dJqpBUPSj5zE6B1n/Lb9qV16ucPXdZOqSG5it2k=;
 b=Tp52OMQZ0hmGKOWLcMXvM6Wuuh57eLVPtCal+HDpxFbC78E4F+04ihLL5lZPuQJzA7
 vG5yW9c3U2BqVcl1//C8VNLzZUqzGSkpfkWicxscXInDdk1uH7urcA5/PSNutlj1PAeQ
 3+Jx7GTeYs5gkUf9GM4SXf4N3YIyRXcGDbV0efokP8sWJafS+nvdfVG4/n9R0KalgZc1
 4gXgAnUmaajl77vaBhbXBPGFQHCwidAJzt3F7pz2kL5LXS8LBCbGX5tT/WHHWDFXl8Fd
 CAt44zQH6pWBvq4zMl61nDCYYlMYx84aNTcrCNUVx1UOrjj2jpNSaMS7Rx0SU+xXPTda
 LDtQ==
X-Gm-Message-State: APzg51B7KHOsCShXqaDsWwI2XTOwccUOtJqVxONawGcfhYQA+pnMPIg1
 yr3L5hrAeEBJN3eBZGrS4hPvLKreMPt2ICupaHK3xA==
X-Google-Smtp-Source: ANB0Vda6fh680CGOS2F0xZM/JigV4jeV8Lr6EHOBfDTSVb58QEO4eSn1CE32D9/QWvT0D7m4Ot5QYZt0Ay3M74ZwRfA=
X-Received: by 2002:a62:9101:: with SMTP id
 l1-v6mr3062086pfe.226.1536766937692; 
 Wed, 12 Sep 2018 08:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
 <EBD6A54B-2862-4DF8-9E03-5343C29349DF@fuzziesquirrel.com>
 <CAO=notzcJFGD6fJn_LpKQgHUkyU_whW-2CiTe26kcq-+G3T7Ww@mail.gmail.com>
 <CAO=notxmEwWc1Ti4LFj963E-Su2Sy8Hp6NFOaYM1w2k0mf+jOA@mail.gmail.com>
 <31306F60-60D3-49E3-AD31-1A3A2F6FD190@fuzziesquirrel.com>
In-Reply-To: <31306F60-60D3-49E3-AD31-1A3A2F6FD190@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 12 Sep 2018 08:42:06 -0700
Message-ID: <CAO=notyha7Tw9jjvfKykPzOcPm=AiL3Y5J8utx-2N9rgj1VK0Q@mail.gmail.com>
Subject: Re: phosphor-ipmi-blobs
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
X-List-Received-Date: Wed, 12 Sep 2018 15:42:22 -0000

On Wed, Sep 12, 2018 at 7:57 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> > On Sep 12, 2018, at 10:17 AM, Patrick Venture <venture@google.com> wrote:
> >
> > Brad, if you create a phosphor-ipmi-blobs repository and set myself
> > and Kun Yi (kunyi731@gmail.com) as maintainers via the system (I can
> > create the maintainers file).  I will submit the code in one patch.  I
> > can put it up for review first to gather feedback -- since we haven't
> > fully integrated it into things, this is a great time.
>
> done!

Thanks.
