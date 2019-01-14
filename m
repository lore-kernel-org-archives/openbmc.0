Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ddNZ4yNCzDqX6
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 02:55:42 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 4C65E6DC7D;
 Mon, 14 Jan 2019 10:55:39 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: New repo request: phosphor-ipmi-blobs-binarystore
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGMNF6Ura0a-+N_ApsZfBEAcMxMWk=xxtWYMZ9kP_DaC13gCVg@mail.gmail.com>
Date: Mon, 14 Jan 2019 10:55:39 -0500
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8ED680A1-41E3-43AE-B12A-722AC71B518E@fuzziesquirrel.com>
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
 <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
 <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
 <CAGMNF6VP9watHPHcOq2=SsoZ+fd+x-KSN2tfQwwLDvqg1sisgQ@mail.gmail.com>
 <CAGMNF6Ura0a-+N_ApsZfBEAcMxMWk=xxtWYMZ9kP_DaC13gCVg@mail.gmail.com>
To: Kun Yi <kunyi@google.com>
X-Mailer: Apple Mail (2.3445.102.3)
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
X-List-Received-Date: Mon, 14 Jan 2019 15:55:43 -0000



> On Dec 17, 2018, at 6:16 PM, Kun Yi <kunyi@google.com> wrote:
>=20
> Hi Ed,
>=20
> I hope my last email and the design doc address your questions? =3D)
>=20
> Hi Brad,
>=20
> Since the handler is made more general, the name should not contain
> SKM anymore. Please use 'phosphor-ipmi-blobs-binarystore=E2=80=99.

Hi Kun

Just wanted to verify quick before I do it that you still want a
phosphor-ipmi-blobs-binarystore repository?

thx - brad

> Changed email subject for clarity.
>=20
>>> On Thu, Dec 6, 2018 at 10:30 AM Ed Tanous <ed.tanous@intel.com> =
wrote:
>>>>=20
>>>> Can you go into a little more details on what this repository would =
do?  A quick google of "storage key management" didn't really turn up =
much in terms of specifics.  Is there a spec or design doc you could =
point us at?
>>>=20
>>> After some internal discussions we feel the design could be more
>>> generalized. It is better described as a BMC binary blob store =
backend
>>> with simple read/write interface through IPMI blobs. The
>>> characteristics of this backend are:
>>> 1. Support for read/write of short binary data onto BMC persistent
>>> storage, or any storage device that BMC has access to
>>> 2. The binary data are stored at compile-time known offsets and can =
be
>>> accessed offline
>>>=20
>>> It is *NOT* meant for storing keys despite my original email
>>> mentioning a "storage key management system". Our internal use-case =
is
>>> basically placing some strings onto BMC persistent storage and have
>>> them accessible online(through IPMI) and/or offline. Again, due to =
the
>>> fact that multiple entities have access to the data, no keys/secrets
>>> should be stored using this backend.
>>>=20
>>> I could definitely send a design to the docs repo for anyone
>>> interested to comment on.
>>>=20
>>>>=20
>>>> Some initial questions I have (assuming this repo relates to key =
management)
>>>>=20
>>>> 1. How would this repository relate to =
phosphor-certificate-manager?  Reimplementation of the same interface?  =
Different?  What are the major differences that would warrant not simply =
putting the implementation there?  Some of my confusion here is that =
phosphor-certificate-manager has an implementation that can store =
certificates and private keys, and has gone through many rounds of =
review on the interfaces.  I'm worried that another key manager would =
simply be duplicating functionality that already exists (although I hope =
not).
>>>>=20
>>>> 2. What interfaces and workflows would this implementation support? =
 What does this implementation let us do that we can't do already?
>>>=20
>>> I hope my response above clarifies 1) and 2): it is not similar to
>>> existing keystore infrastructure since they serve different =
purposes.
>>>=20
>>>>=20
>>>> 3. When you say the storage format is SKM specific, what does that =
mean?
>>>=20
>>> My original design involves some specific metadata fields, but those
>>> are overly arbitrary and can be replaced by a generic approach.
>>>=20
>>>>=20
>>>> -Ed
>>>>=20
>>>> On 12/6/18 10:19 AM, Kun Yi wrote:
>>>>=20
>>>> Hi Brad,
>>>>=20
>>>> May I request a new repository: phosphor-ipmi-blobs-skm?
>>>>=20
>>>> It is a phosphor-ipmi-blobs[1] based handler that supports simple =
binary data read/write/enumerate operations from the host to a storage =
only visible to BMC. Google uses it for storing Storage Key Management =
(SKM) specific binary data, and it may probably belong to the openBMC =
customizations that Google want to publish and permit others to use.
>>>>=20
>>>> Currently the storage format is skm specific, but it could be =
expanded to support other use cases, thus the "phosphor" naming. If you =
feel that it is still Google-specific, then "google-ipmi-blobs-skm" is =
acceptable as well. We can always rename this later if the use cases =
expand. =3D)
>>>>=20
>>>> Please add myself, Benjamin Fair (benjaminfair@google.com), and =
Patrick Venture (venture@google.com) as maintainers. Thanks!
>>>>=20
>>>> [1] https://github.com/openbmc/phosphor-ipmi-blobs
>>>> --
>>>> Regards,
>>>> Kun
>>>=20
>>>=20
>>>=20
>>> --
>>> Regards,
>>> Kun
>>=20
>> I have uploaded the design doc at
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/16584. Currently
>> added Joseph, Brad, Patrick and Benjamin for review. If you are
>> interested please add your self as a reviewer. Thanks!
>>=20
>> --
>> Regards,
>> Kun
>=20
>=20
>=20
> --=20
> Regards,
> Kun
