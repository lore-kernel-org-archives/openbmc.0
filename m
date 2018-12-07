Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::132; helo=mail-it1-x132.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RBXjZeBf"; 
 dkim-atps=neutral
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BLlQ17PSzF09n
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 05:36:17 +1100 (AEDT)
Received: by mail-it1-x132.google.com with SMTP id c9so8546338itj.1
 for <openbmc@lists.ozlabs.org>; Fri, 07 Dec 2018 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=chN2R8s6VbgQxitB5PsAupMS37KWXkUA+7URWgIzau0=;
 b=RBXjZeBf0BEENh3W7OvDscJNLaTMRzHAqtyhvguNPlR2zODGiAjkWDt7W+cr1ju592
 o0WVGwaAC3i4Y/S/I3Yawu1ucnOfqc2M+RI7DSMDTotxs9pLDBWCPFUieWbdjuLFSvxB
 Pl806ORsfteg2AAXI+9A8c8J6YO540FRIKiMCYquuAzoMqs8sL6hVNQCrSjKwDq0g/0t
 A3mFjXNrIHYO8LelTbuxW9fDWohv/oGCR6+fvqFALBZldeRdLeBiA/9IlKa6YdyTwETh
 qlH5uHYrcPoVwfmTUqf2Is2y9/DQdWag5PZIuEY4QmNr8Pz85FEEIBTfdmWEjsh14/mW
 jcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=chN2R8s6VbgQxitB5PsAupMS37KWXkUA+7URWgIzau0=;
 b=Wubi4cJdxDUt+BJXh7ehhVZJZ94CBanzfrcXG1Dx4Qixvy8SXShd8zUoNe46Q7JU1q
 Y6qWkM3USyDP39FddYLsuk+bJPMsV0TWRFZNOz2Fc8WQSt4pOGeR+L0yGupc7GN5uWQS
 wg4Lce6Da6dSnVhJvIe7Fjnqp6CLxIIiM+v6OC2okBZc++AnUrCT8VXMcXHCKZibito+
 QdHMPg1Gnqp4KvDdNe+BEPdRn9CQTQivu7cnQRqOEVEW+AubYhOdkLtYv1lLXcIAmKKQ
 CxM4cIQBNhXKoOE71eZ8eLJ9nIGRZDgvwqsnX43fcm+F/742ytXDtAehN9WR0Qwk1GEb
 1phg==
X-Gm-Message-State: AA+aEWby+viybzcGEqoTxNsUNU5XRKouQz+Z05QXKB57rpsj3Nc37o3G
 5DFDo0tkZIqyM+/3hj6SCADcNUsQFr2iKuFp++OONQ==
X-Google-Smtp-Source: AFSGD/Wz9Alrxbi1qCOsrhDixhHBLg4XvzoqKCWFx+vC9MiRW4k9ae6b8yvZLknzwYa9FLQ8Toltm6KTphSkdlf9Z8g=
X-Received: by 2002:a05:660c:452:: with SMTP id
 d18mr2987420itl.124.1544207774848; 
 Fri, 07 Dec 2018 10:36:14 -0800 (PST)
MIME-Version: 1.0
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
 <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
In-Reply-To: <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 7 Dec 2018 10:35:48 -0800
Message-ID: <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
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
X-List-Received-Date: Fri, 07 Dec 2018 18:36:19 -0000

Great questions and sorry for not being clear in the first email.
Responses inline.

On Thu, Dec 6, 2018 at 10:30 AM Ed Tanous <ed.tanous@intel.com> wrote:
>
> Can you go into a little more details on what this repository would do?  =
A quick google of "storage key management" didn't really turn up much in te=
rms of specifics.  Is there a spec or design doc you could point us at?

After some internal discussions we feel the design could be more
generalized. It is better described as a BMC binary blob store backend
with simple read/write interface through IPMI blobs. The
characteristics of this backend are:
1. Support for read/write of short binary data onto BMC persistent
storage, or any storage device that BMC has access to
2. The binary data are stored at compile-time known offsets and can be
accessed offline

It is *NOT* meant for storing keys despite my original email
mentioning a "storage key management system". Our internal use-case is
basically placing some strings onto BMC persistent storage and have
them accessible online(through IPMI) and/or offline. Again, due to the
fact that multiple entities have access to the data, no keys/secrets
should be stored using this backend.

I could definitely send a design to the docs repo for anyone
interested to comment on.

>
> Some initial questions I have (assuming this repo relates to key manageme=
nt)
>
> 1. How would this repository relate to phosphor-certificate-manager?  Rei=
mplementation of the same interface?  Different?  What are the major differ=
ences that would warrant not simply putting the implementation there?  Some=
 of my confusion here is that phosphor-certificate-manager has an implement=
ation that can store certificates and private keys, and has gone through ma=
ny rounds of review on the interfaces.  I'm worried that another key manage=
r would simply be duplicating functionality that already exists (although I=
 hope not).
>
> 2. What interfaces and workflows would this implementation support?  What=
 does this implementation let us do that we can't do already?

I hope my response above clarifies 1) and 2): it is not similar to
existing keystore infrastructure since they serve different purposes.

>
> 3. When you say the storage format is SKM specific, what does that mean?

My original design involves some specific metadata fields, but those
are overly arbitrary and can be replaced by a generic approach.

>
> -Ed
>
> On 12/6/18 10:19 AM, Kun Yi wrote:
>
> Hi Brad,
>
> May I request a new repository: phosphor-ipmi-blobs-skm?
>
> It is a phosphor-ipmi-blobs[1] based handler that supports simple binary =
data read/write/enumerate operations from the host to a storage only visibl=
e to BMC. Google uses it for storing Storage Key Management (SKM) specific =
binary data, and it may probably belong to the openBMC customizations that =
Google want to publish and permit others to use.
>
> Currently the storage format is skm specific, but it could be expanded to=
 support other use cases, thus the "phosphor" naming. If you feel that it i=
s still Google-specific, then "google-ipmi-blobs-skm" is acceptable as well=
. We can always rename this later if the use cases expand. =3D)
>
> Please add myself, Benjamin Fair (benjaminfair@google.com), and Patrick V=
enture (venture@google.com) as maintainers. Thanks!
>
> [1] https://github.com/openbmc/phosphor-ipmi-blobs
> --
> Regards,
> Kun



--=20
Regards,
Kun
