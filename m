Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OBJEun8L"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DGFt1MFzzDqYj
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 08:20:49 +1100 (AEDT)
Received: by mail-it1-x12e.google.com with SMTP id c9so268944itj.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 13:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EeySMWRVmx+sxEEGcWazyJdW2M75z29Qh1XBFujLBJE=;
 b=OBJEun8LFIOBVDtTGxL4L+Nix9lmQJC8SlGrca25ChzLP9Iq6l70TQAr5S1CBWTrrt
 /+ooyxHhb6g2vVhwOQnWtleRPejfmC6608AnHkpPlGWANCKeW3TyXqdIWVNFhgLlVnRO
 DA1ZVQQQKiARIk9au+DJq7PieTUmDY4I3CxLXV/Euwuvkp4/CjWGAWTnUgEhlR7pL1bB
 ybIQzu/Q8a9DorjyASQtWRFrIibMDDD0R6Z1qhmiYKbFVQ03aSIZhBRZAZi9m1UsvQsD
 l+38UeAcpIgErZVKuYut4KIvbHG8VLcaw5uiglP6QyOTMDcrgwYa0HHNiKP1b79bIIQB
 T5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EeySMWRVmx+sxEEGcWazyJdW2M75z29Qh1XBFujLBJE=;
 b=B5ko+gaaQ/wUYBKAhMGCOwASeKcC6/vd7e+EomllKoToXiU4eY3u4bA3Bl1VgtA3y3
 sjWmQBPZLQCiymW8wJD46jT37EJ360fGWyvzdIBtEvX5tgTlQkqNdo37FK2Y4tdlx0gs
 GjzcEQTJT3KAHyrALdCE9j6KhcVFw23ijV508KgW8p0YhM6UlxUPQkrps5YPFWX77CoR
 mXya7HO36Uy5OYOhDjD0cpyV3t8kMLovpJ2tYoWT6Wjw6piHZ0heIG8Rdj5ZAE+6tBPB
 YKQuUFmWHX1NEaM1PlV+4uRqOwzbzxm/hHuzq7s2NqzWnNPaNwRj4bTFMbeTM159w7vO
 16rA==
X-Gm-Message-State: AA+aEWaJxMDB0czF/cy4ejWnwvmf47zhPG+LzkCYUSM4bHig+ylCuCz/
 jKv9KEShwrYsnGWMOeFB0PeTvrAe/v6J2ljzxq13rQ==
X-Google-Smtp-Source: AFSGD/W+OKN+KgFRB55iCdvMC9CTvuSkPWfVA4u3EpI019zvV7MJUok6GBllBirN+41UqZgXirR1xEXk19a/stXrflw=
X-Received: by 2002:a24:cfc1:: with SMTP id y184mr44831itf.72.1544476847212;
 Mon, 10 Dec 2018 13:20:47 -0800 (PST)
MIME-Version: 1.0
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
 <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
 <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
In-Reply-To: <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 10 Dec 2018 13:20:20 -0800
Message-ID: <CAGMNF6VP9watHPHcOq2=SsoZ+fd+x-KSN2tfQwwLDvqg1sisgQ@mail.gmail.com>
Subject: Re: New repo request: phosphor-ipmi-blobs-skm
To: ed.tanous@intel.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Dec 2018 21:20:52 -0000

On Fri, Dec 7, 2018 at 10:35 AM Kun Yi <kunyi@google.com> wrote:
>
> Great questions and sorry for not being clear in the first email.
> Responses inline.
>
> On Thu, Dec 6, 2018 at 10:30 AM Ed Tanous <ed.tanous@intel.com> wrote:
> >
> > Can you go into a little more details on what this repository would do?=
  A quick google of "storage key management" didn't really turn up much in =
terms of specifics.  Is there a spec or design doc you could point us at?
>
> After some internal discussions we feel the design could be more
> generalized. It is better described as a BMC binary blob store backend
> with simple read/write interface through IPMI blobs. The
> characteristics of this backend are:
> 1. Support for read/write of short binary data onto BMC persistent
> storage, or any storage device that BMC has access to
> 2. The binary data are stored at compile-time known offsets and can be
> accessed offline
>
> It is *NOT* meant for storing keys despite my original email
> mentioning a "storage key management system". Our internal use-case is
> basically placing some strings onto BMC persistent storage and have
> them accessible online(through IPMI) and/or offline. Again, due to the
> fact that multiple entities have access to the data, no keys/secrets
> should be stored using this backend.
>
> I could definitely send a design to the docs repo for anyone
> interested to comment on.
>
> >
> > Some initial questions I have (assuming this repo relates to key manage=
ment)
> >
> > 1. How would this repository relate to phosphor-certificate-manager?  R=
eimplementation of the same interface?  Different?  What are the major diff=
erences that would warrant not simply putting the implementation there?  So=
me of my confusion here is that phosphor-certificate-manager has an impleme=
ntation that can store certificates and private keys, and has gone through =
many rounds of review on the interfaces.  I'm worried that another key mana=
ger would simply be duplicating functionality that already exists (although=
 I hope not).
> >
> > 2. What interfaces and workflows would this implementation support?  Wh=
at does this implementation let us do that we can't do already?
>
> I hope my response above clarifies 1) and 2): it is not similar to
> existing keystore infrastructure since they serve different purposes.
>
> >
> > 3. When you say the storage format is SKM specific, what does that mean=
?
>
> My original design involves some specific metadata fields, but those
> are overly arbitrary and can be replaced by a generic approach.
>
> >
> > -Ed
> >
> > On 12/6/18 10:19 AM, Kun Yi wrote:
> >
> > Hi Brad,
> >
> > May I request a new repository: phosphor-ipmi-blobs-skm?
> >
> > It is a phosphor-ipmi-blobs[1] based handler that supports simple binar=
y data read/write/enumerate operations from the host to a storage only visi=
ble to BMC. Google uses it for storing Storage Key Management (SKM) specifi=
c binary data, and it may probably belong to the openBMC customizations tha=
t Google want to publish and permit others to use.
> >
> > Currently the storage format is skm specific, but it could be expanded =
to support other use cases, thus the "phosphor" naming. If you feel that it=
 is still Google-specific, then "google-ipmi-blobs-skm" is acceptable as we=
ll. We can always rename this later if the use cases expand. =3D)
> >
> > Please add myself, Benjamin Fair (benjaminfair@google.com), and Patrick=
 Venture (venture@google.com) as maintainers. Thanks!
> >
> > [1] https://github.com/openbmc/phosphor-ipmi-blobs
> > --
> > Regards,
> > Kun
>
>
>
> --
> Regards,
> Kun

I have uploaded the design doc at
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/16584. Currently
added Joseph, Brad, Patrick and Benjamin for review. If you are
interested please add your self as a reviewer. Thanks!

--=20
Regards,
Kun
