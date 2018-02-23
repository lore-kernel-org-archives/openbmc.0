Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zp2sJ1yftzF1kB
 for <openbmc@lists.ozlabs.org>; Sat, 24 Feb 2018 07:30:09 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2018 12:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,383,1515484800"; d="scan'208";a="20351210"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga008.jf.intel.com with ESMTP; 23 Feb 2018 12:30:05 -0800
Date: Fri, 23 Feb 2018 12:30:05 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Yugi Mani <yupalani@microsoft.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180223203005.GH113334@mauery>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <MWHPR21MB086454F2C875043A3B7FCBF9D6F10@MWHPR21MB0864.namprd21.prod.outlook.com>
 <877er4pjin.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <877er4pjin.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 20:30:13 -0000

On 23-Feb-2018 12:44 PM, Stewart Smith wrote:
>Yugi Mani <yupalani@microsoft.com> writes:
>> We should consider both of these requirements for image signing:
>> 1. Update verification
>> 2. Boot Verification
>>
>> Appending signature to image meets verification during firmware update. =
To do verification on every boot, we need something like FIT.
>> https://chromium.googlesource.com/chromiumos/third_party/u-boot-next/+/c=
hromeos-v2013.06/doc/uImage.FIT
>>
>> As far as actual signing is concerned, we don't have access to private k=
ey for security reasons. We should support two models:
>> Model 1:
>> Source code has private key and signing is part of build process ("bitba=
ke obmc-phosphor-image")
>>
>> Model 2:
>> Source code does not have private key, Signing is done externally and
>> some post-processing is done to add hash to image.  (maybe a new task,
>> "bitbake obmc-phosphor-image -c add_hash")
>
>For reference, for OpenPOWER host firmware, we support three models:
>
>Local mode (a.k.a. development mode) =E2=80=94 Build the container and sign
>using locally available private keys. Signatures are generated using
>simple openssl operations. Because the private keys are exposed on the
>local system (the build machine), this mode should be used only for
>development signing, or when the user is confident that the build
>machine is secure against unauthorized access.
>
>Independent mode =E2=80=94 Generate the signing requests locally and expor=
t the
>requests for signing externally. External signing is by user's method of
>choice: any method capable of generating a ECDSA p521 signature (the
>built-in support uses openssl). Resulting signatures are re-imported to
>the container build process, to create the completed container. No
>private or privileged information is exposed at the build machine.
>
>Production mode =E2=80=94 Build the container locally and interface with t=
he
>remote signframework to retrieve signatures and (public) keys as
>needed. Signing is done remotely on a secure signing server using a
>hardware security module (HSM). Private keys are stored securely in the
>HSM and never exposed. Completed signatures are returned by the
>signframework and integrated into the container.
>
>(gratuitously copy&pasted from Nick's great docs up at
>https://github.com/open-power/sb-signing-utils/wiki )

Historically, we have supported two signing modes, similar to one and=20
three:

Local mode (a.k.a. development mode) - similar to what you describe=20
where the keys are insecure and should not be used to generate=20
production images.

Re-Sign mode (for Production images) - takes a binary image, parses and=20
deconstructs it, verifies the signature, and puts it back together with=20
a new signature and public key certificate. This makes it so we only=20
ever sign 'blessed' images with the production key, where this blessing=20
comes from the validation team. The production build server initially=20
signs the release image with a non-production key and that image gets=20
tested. Then it gets re-signed with the production key only if it passes=20
validation.

--Vernon
