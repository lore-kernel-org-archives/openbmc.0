Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lUyf74vo"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43djhf1DjzzDqVy
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 06:09:53 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id l14so100503ioj.5
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 11:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sUm/kOjd9SCim1PJq1A8N1f6SsUVHdvBqBt6BhvbEtk=;
 b=lUyf74voHkezCtSDaat+OsfLvUNNDeBQaFfswn1yVPRcIXVUAeUtMiBAIaxMJMWOL1
 IDLO1ZKfjKibdefQ6sO/2iJ2uVGpgLUChh4EAV2iUIULT50BTxA0dne8PisWs0895Npm
 HQnyR1QUXkq+EpEfnjdNcyjbnAQeQCDixkxHbGIYP1gAs8F+dxvvP8xIUh53eBS15BkE
 CwBarFPwHpQGKGuJpDxl6+NCocN+OeO7/ke9zJIap/96+dq/sEr+bB5B3NYMTN+uhTqP
 /XbK8gstEvxvpXtF6jQWo07IWRAw7vhRqOaXlx6CPS5qi6M76qdVlHGTgHUpQtwTjV5I
 01Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sUm/kOjd9SCim1PJq1A8N1f6SsUVHdvBqBt6BhvbEtk=;
 b=pyJDRMkVc4/qsMrEtRRz+0gCJ9GS0c+Ys4/aOAh0ea+SNz792h1ypsnvO9B0A8Ryqr
 6Q/ezKzgcbnQasXAYztf6HBYoLNscFtJ7XwnNnhGiQvqmhehOBzr9lbdYiTFrYmLdY3Z
 STqzG9JdQnp54CrgYfSJk9guJ5bsEBQuKA+nIOEFZ+2LD2aZMHX4Amc23V135H9mzJlX
 eOT3dr95OFQT+Joy+20Ck8BmeWGrIl9q+qPjfzDkHoIWSEIIZhdIJ8EO0SkocvxjGcT1
 snMri+5ozXyw6zzi3iVZ8N26EF5LpGBH1X/vqLLX49UvrFMSZrLFzoHZLL0s1qxjf36O
 V4XA==
X-Gm-Message-State: AJcUukdcILNqNYlQztfZaZagejZx+rzdlDXeNoA4kJmuxpxXp63ln558
 NZ1Hclq/6ZLNkhTM46gs310RJ1WADXr1CW0s0JR+VQ==
X-Google-Smtp-Source: ALg8bN7HgPNB3/XfB9O+ypXo5a28OhTmjSRPkU/3yjYa33MK/vucssStLVhtaTEHW3aUfSgPRq6WpvhdOD/6130r/+s=
X-Received: by 2002:a6b:fa01:: with SMTP id p1mr10748695ioh.271.1547492989162; 
 Mon, 14 Jan 2019 11:09:49 -0800 (PST)
MIME-Version: 1.0
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
 <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
 <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
 <CAGMNF6VP9watHPHcOq2=SsoZ+fd+x-KSN2tfQwwLDvqg1sisgQ@mail.gmail.com>
 <CAGMNF6Ura0a-+N_ApsZfBEAcMxMWk=xxtWYMZ9kP_DaC13gCVg@mail.gmail.com>
 <8ED680A1-41E3-43AE-B12A-722AC71B518E@fuzziesquirrel.com>
In-Reply-To: <8ED680A1-41E3-43AE-B12A-722AC71B518E@fuzziesquirrel.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 14 Jan 2019 11:09:23 -0800
Message-ID: <CAGMNF6Vdf-tPdAP8QgXTNtykwu9Y49+RwXhyrJxsae+vkqMKxw@mail.gmail.com>
Subject: Re: New repo request: phosphor-ipmi-blobs-binarystore
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 19:09:55 -0000

On Mon, Jan 14, 2019 at 7:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Dec 17, 2018, at 6:16 PM, Kun Yi <kunyi@google.com> wrote:
> >
> > Hi Ed,
> >
> > I hope my last email and the design doc address your questions? =3D)
> >
> > Hi Brad,
> >
> > Since the handler is made more general, the name should not contain
> > SKM anymore. Please use 'phosphor-ipmi-blobs-binarystore=E2=80=99.
>
> Hi Kun
>
> Just wanted to verify quick before I do it that you still want a
> phosphor-ipmi-blobs-binarystore repository?
>
> thx - brad

Yes, we still intend to make the code available for upstream. Thanks!

>
> > Changed email subject for clarity.
> >
> >>> On Thu, Dec 6, 2018 at 10:30 AM Ed Tanous <ed.tanous@intel.com> wrote=
:
> >>>>
> >>>> Can you go into a little more details on what this repository would =
do?  A quick google of "storage key management" didn't really turn up much =
in terms of specifics.  Is there a spec or design doc you could point us at=
?
> >>>
> >>> After some internal discussions we feel the design could be more
> >>> generalized. It is better described as a BMC binary blob store backen=
d
> >>> with simple read/write interface through IPMI blobs. The
> >>> characteristics of this backend are:
> >>> 1. Support for read/write of short binary data onto BMC persistent
> >>> storage, or any storage device that BMC has access to
> >>> 2. The binary data are stored at compile-time known offsets and can b=
e
> >>> accessed offline
> >>>
> >>> It is *NOT* meant for storing keys despite my original email
> >>> mentioning a "storage key management system". Our internal use-case i=
s
> >>> basically placing some strings onto BMC persistent storage and have
> >>> them accessible online(through IPMI) and/or offline. Again, due to th=
e
> >>> fact that multiple entities have access to the data, no keys/secrets
> >>> should be stored using this backend.
> >>>
> >>> I could definitely send a design to the docs repo for anyone
> >>> interested to comment on.
> >>>
> >>>>
> >>>> Some initial questions I have (assuming this repo relates to key man=
agement)
> >>>>
> >>>> 1. How would this repository relate to phosphor-certificate-manager?=
  Reimplementation of the same interface?  Different?  What are the major d=
ifferences that would warrant not simply putting the implementation there? =
 Some of my confusion here is that phosphor-certificate-manager has an impl=
ementation that can store certificates and private keys, and has gone throu=
gh many rounds of review on the interfaces.  I'm worried that another key m=
anager would simply be duplicating functionality that already exists (altho=
ugh I hope not).
> >>>>
> >>>> 2. What interfaces and workflows would this implementation support? =
 What does this implementation let us do that we can't do already?
> >>>
> >>> I hope my response above clarifies 1) and 2): it is not similar to
> >>> existing keystore infrastructure since they serve different purposes.
> >>>
> >>>>
> >>>> 3. When you say the storage format is SKM specific, what does that m=
ean?
> >>>
> >>> My original design involves some specific metadata fields, but those
> >>> are overly arbitrary and can be replaced by a generic approach.
> >>>
> >>>>
> >>>> -Ed
> >>>>
> >>>> On 12/6/18 10:19 AM, Kun Yi wrote:
> >>>>
> >>>> Hi Brad,
> >>>>
> >>>> May I request a new repository: phosphor-ipmi-blobs-skm?
> >>>>
> >>>> It is a phosphor-ipmi-blobs[1] based handler that supports simple bi=
nary data read/write/enumerate operations from the host to a storage only v=
isible to BMC. Google uses it for storing Storage Key Management (SKM) spec=
ific binary data, and it may probably belong to the openBMC customizations =
that Google want to publish and permit others to use.
> >>>>
> >>>> Currently the storage format is skm specific, but it could be expand=
ed to support other use cases, thus the "phosphor" naming. If you feel that=
 it is still Google-specific, then "google-ipmi-blobs-skm" is acceptable as=
 well. We can always rename this later if the use cases expand. =3D)
> >>>>
> >>>> Please add myself, Benjamin Fair (benjaminfair@google.com), and Patr=
ick Venture (venture@google.com) as maintainers. Thanks!
> >>>>
> >>>> [1] https://github.com/openbmc/phosphor-ipmi-blobs
> >>>> --
> >>>> Regards,
> >>>> Kun
> >>>
> >>>
> >>>
> >>> --
> >>> Regards,
> >>> Kun
> >>
> >> I have uploaded the design doc at
> >> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/16584. Currently
> >> added Joseph, Brad, Patrick and Benjamin for review. If you are
> >> interested please add your self as a reviewer. Thanks!
> >>
> >> --
> >> Regards,
> >> Kun
> >
> >
> >
> > --
> > Regards,
> > Kun



--=20
Regards,
Kun
