Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::129; helo=mail-it1-x129.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QWpoTvXy"; 
 dkim-atps=neutral
Received: from mail-it1-x129.google.com (mail-it1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43JcVh2FpNzDqgH
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 10:16:59 +1100 (AEDT)
Received: by mail-it1-x129.google.com with SMTP id a6so1613403itl.4
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QbmkcqU79NWsCyQojaqufB3XKSUxk/YSf2qD8NeMt2g=;
 b=QWpoTvXyASrc+OY9mNP2HBt3OEAt/ocylR95aAwe8nG4Cg+t4ZhjfVJUnVeDV58cPr
 XpUHmsbLu23REpuU/Eu50+W8nGtSqWSqzVVTU1kF8VEkToAno71Jza2mTjbzBCDfzIG4
 M5ao9b5X01fHVJvX0PI4nuDtaIc2wQ2g4K3H7LMFWg9RJQ8mJgyMwxV55AMKCLhJvq7/
 /vuRr3Dj35DqXI/1s5Gf3hSc2xa1XWEzbdchE6TRc4NZvi/k65BkzYduLkqcAsk1FCo3
 BUc2axGOFAvMxLl1UffPaKropoRoC9SuJY9kA/0Ri9SsNSlVdghjxeFf08KsJnpsDSnk
 Nlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QbmkcqU79NWsCyQojaqufB3XKSUxk/YSf2qD8NeMt2g=;
 b=clCZ8hhKYORXqjyyhNZhwB49TRJec/Tb4VJMYgS8hnA3dY3B7CXLNVNppJ6ivQ41Si
 zqU8LmliCDZijvJTAsVPE0hzHVzpthMtrawNIODpErnvZmPNcvMxGBugAICSbNcmvLse
 7nDva2atEga84QJ0t7BJ8/bj8mvvt0DdfAdINr4jy/FMTxCrepB7eHBIeTf3tj4D2469
 C96EyVT6dCdhFYviRTvJ5BsR6N8Lt6zpT+/gUFh/Po+Bg87Bo7RXbMm4c6jefbMjTvOF
 AAZC8Hnhrj+H843hsw872hL+b09po88Pfjsw8oWqXUhPPTXknlCINvn4GbdEywF7sCvj
 sDfA==
X-Gm-Message-State: AA+aEWZr36TB3XWmLydPw8doSnzdsE+EzrLoutWlOSvk+EDfEsGVvNy2
 jwT2wgDa7D2wraA1U0AJOp5xj8Fo9xNunlJYpVwZRA==
X-Google-Smtp-Source: AFSGD/UgJoqKRqifzPIdml7/YDcc0Jojb1ikEqY6xGTBu/1JUkZEt0WlJdtBbZQDmM9RvKkWsk6TtL3Kv43QiDvwOkE=
X-Received: by 2002:a24:cfc1:: with SMTP id y184mr920094itf.72.1545088614930; 
 Mon, 17 Dec 2018 15:16:54 -0800 (PST)
MIME-Version: 1.0
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
 <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
 <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
 <CAGMNF6VP9watHPHcOq2=SsoZ+fd+x-KSN2tfQwwLDvqg1sisgQ@mail.gmail.com>
In-Reply-To: <CAGMNF6VP9watHPHcOq2=SsoZ+fd+x-KSN2tfQwwLDvqg1sisgQ@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 17 Dec 2018 15:16:28 -0800
Message-ID: <CAGMNF6Ura0a-+N_ApsZfBEAcMxMWk=xxtWYMZ9kP_DaC13gCVg@mail.gmail.com>
Subject: Re: New repo request: phosphor-ipmi-blobs-binarystore
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
X-List-Received-Date: Mon, 17 Dec 2018 23:17:01 -0000

Hi Ed,

I hope my last email and the design doc address your questions? =3D)

Hi Brad,

Since the handler is made more general, the name should not contain
SKM anymore. Please use 'phosphor-ipmi-blobs-binarystore'.
Changed email subject for clarity.

> > On Thu, Dec 6, 2018 at 10:30 AM Ed Tanous <ed.tanous@intel.com> wrote:
> > >
> > > Can you go into a little more details on what this repository would d=
o?  A quick google of "storage key management" didn't really turn up much i=
n terms of specifics.  Is there a spec or design doc you could point us at?
> >
> > After some internal discussions we feel the design could be more
> > generalized. It is better described as a BMC binary blob store backend
> > with simple read/write interface through IPMI blobs. The
> > characteristics of this backend are:
> > 1. Support for read/write of short binary data onto BMC persistent
> > storage, or any storage device that BMC has access to
> > 2. The binary data are stored at compile-time known offsets and can be
> > accessed offline
> >
> > It is *NOT* meant for storing keys despite my original email
> > mentioning a "storage key management system". Our internal use-case is
> > basically placing some strings onto BMC persistent storage and have
> > them accessible online(through IPMI) and/or offline. Again, due to the
> > fact that multiple entities have access to the data, no keys/secrets
> > should be stored using this backend.
> >
> > I could definitely send a design to the docs repo for anyone
> > interested to comment on.
> >
> > >
> > > Some initial questions I have (assuming this repo relates to key mana=
gement)
> > >
> > > 1. How would this repository relate to phosphor-certificate-manager? =
 Reimplementation of the same interface?  Different?  What are the major di=
fferences that would warrant not simply putting the implementation there?  =
Some of my confusion here is that phosphor-certificate-manager has an imple=
mentation that can store certificates and private keys, and has gone throug=
h many rounds of review on the interfaces.  I'm worried that another key ma=
nager would simply be duplicating functionality that already exists (althou=
gh I hope not).
> > >
> > > 2. What interfaces and workflows would this implementation support?  =
What does this implementation let us do that we can't do already?
> >
> > I hope my response above clarifies 1) and 2): it is not similar to
> > existing keystore infrastructure since they serve different purposes.
> >
> > >
> > > 3. When you say the storage format is SKM specific, what does that me=
an?
> >
> > My original design involves some specific metadata fields, but those
> > are overly arbitrary and can be replaced by a generic approach.
> >
> > >
> > > -Ed
> > >
> > > On 12/6/18 10:19 AM, Kun Yi wrote:
> > >
> > > Hi Brad,
> > >
> > > May I request a new repository: phosphor-ipmi-blobs-skm?
> > >
> > > It is a phosphor-ipmi-blobs[1] based handler that supports simple bin=
ary data read/write/enumerate operations from the host to a storage only vi=
sible to BMC. Google uses it for storing Storage Key Management (SKM) speci=
fic binary data, and it may probably belong to the openBMC customizations t=
hat Google want to publish and permit others to use.
> > >
> > > Currently the storage format is skm specific, but it could be expande=
d to support other use cases, thus the "phosphor" naming. If you feel that =
it is still Google-specific, then "google-ipmi-blobs-skm" is acceptable as =
well. We can always rename this later if the use cases expand. =3D)
> > >
> > > Please add myself, Benjamin Fair (benjaminfair@google.com), and Patri=
ck Venture (venture@google.com) as maintainers. Thanks!
> > >
> > > [1] https://github.com/openbmc/phosphor-ipmi-blobs
> > > --
> > > Regards,
> > > Kun
> >
> >
> >
> > --
> > Regards,
> > Kun
>
> I have uploaded the design doc at
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/16584. Currently
> added Joseph, Brad, Patrick and Benjamin for review. If you are
> interested please add your self as a reviewer. Thanks!
>
> --
> Regards,
> Kun



--=20
Regards,
Kun
