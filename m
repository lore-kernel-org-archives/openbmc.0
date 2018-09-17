Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YGt1woPN"; 
 dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DZ8d61QfzF13h
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 04:17:05 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id ba4-v6so7800887plb.11
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rzifEWB2cJtOWMFGg4IzkBceBifQLMKVn2KYd2IaSAM=;
 b=YGt1woPNDzPLDn7J6NfU3u2xHPKhvC8vcm3EnMer7ri2tNU3uB0LlMHTDKn0AgzKi0
 52ncSRlIbrYy8M7znIxRF+5lLYw/ipbEp1nneZpDa1xCR9EWqfnNAm8FyVk0sgdjLPki
 4OT8CgBoE8AgOAvaP4bU16OZOgtcQjIQzir8KuVRhzSr+zl94M2MaI2M8XgMKDNCHwvW
 RLK9HQ51WIw13352Kypl30UvgTjc0wxqVTHDBb8LtxZLrr/oa3w5LKLX1Sdxfh2gNy9Z
 qLbp6u+gVz5sPy9odiwCNvNb8isd3Q287GsYnjo9aqG/b6gc3J3s6Pds5w9WmRv4/NdU
 HJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzifEWB2cJtOWMFGg4IzkBceBifQLMKVn2KYd2IaSAM=;
 b=OwD5EjLI5JmYsiwHrmhQ3MhVFi8/Y8A4jRNe7Ii/gI6LT2xzHqTyWx4qtJw85WKatI
 uzXEVob97DHMKmQsUpRR/8ZUDrdCSoCOwA3ToU14c8msEssxO+Srh02Zo24Hdzwgs4Ym
 DXlo+Emoo1R3qGIzqAEjoeexflZfPhMGDfhaFEA32BWznbmxXSkajYQL0llsrJgaCGzM
 V8bQw9xJILgLnbNk3H52gQcsl3GpJwLz0m869dPxWSDknUn+fIsWLvCpEZvE4mJcigsK
 lYGLIDHFysFEMP1+myltgtfx2gRvKsego8frc8syAqN6l79AbAC1+1FoGNTEDFHQGWdB
 wtXw==
X-Gm-Message-State: APzg51Bo88NUM7vTGHUjRlAC+SUO0qQpAGSklLapKDkonYNsga3PuGXl
 iVyT3A5/GLLXsvlKEjNehwWCfnRkmA4FbdmcqEFV6A==
X-Google-Smtp-Source: ANB0Vdb9BgViCn0bA4umQYMAPtEog+QKNFs1iWMO8MR6UiUUvozbxoWMr3S85kw+CXl7aig1kYk6+kclrwbCcx7BcfM=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15-v6mr26555835pls.53.1537208223460; 
 Mon, 17 Sep 2018 11:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxkKpZMyPktPjJ+HeYYuOnwcGMvV6ewdEvdMBUqioLvGg@mail.gmail.com>
 <62B77266-3919-48A4-91E1-BF6EACDC4E47@fuzziesquirrel.com>
 <CAO=notz2r=s3+Odk5x9i-d_VSD0m8q5VnmmHzQ4pnDuQtzpmgA@mail.gmail.com>
 <4FC9A818-10BF-4383-8508-38AA81FCF9E0@fuzziesquirrel.com>
In-Reply-To: <4FC9A818-10BF-4383-8508-38AA81FCF9E0@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Sep 2018 11:16:51 -0700
Message-ID: <CAO=notw12JJ3zjGH3RHtUOLY-CXE0O48PyQYuHtiF+ORQmnS2w@mail.gmail.com>
Subject: Re: New repository Request
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
X-List-Received-Date: Mon, 17 Sep 2018 18:17:07 -0000

On Mon, Sep 17, 2018 at 10:54 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Sep 17, 2018, at 1:20 PM, Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Sep 17, 2018 at 7:03 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >>
> >>
> >>
> >>> On Sep 14, 2018, at 7:57 PM, Patrick Venture <venture@google.com> wrote:
> >>>
> >>> Brad;
> >>>
> >>> Please create: google-ipmi-sys -- this is to hold OEM IPMI commands we
> >>> want to share with the community and vendors, but dont' expect to be
> >>> picked up by OpenBMC at large, similar to intel-ipmi-oem.
>
> google-ipmi-sys created.

Thank you.

>
> >>
> >> All the existing OEM IPMI repositories end with -ipmi-oem.  Does that not
> >> make sense here?
> >
> > So phosphor-ipmi-blobs and phosphor-ipmi-flash are both ipmi-oem
> > libraries.  As well as phosphor-ipmi-ethstats.  My thinking was having
> > -ipmi- in the name was conveying sufficient information related to
> > this.
>
> ok.

I'm all for consistency in this, I just assumed -ipmi- was sufficient.
