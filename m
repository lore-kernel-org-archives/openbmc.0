Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DPM94SMmzDqCs
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 04:41:09 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 5 Mar 2019 12:41:39 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Dong Wei <Dong.Wei@arm.com>, 
 "ed.tanous@intel.com" <ed.tanous@intel.com>,
 zshelle <zshelle@linux.vnet.ibm.com>
Subject: Re: anyone interested in chip register error diagnostics?
Message-ID: <20190305174139.ya4kvilcng3adfcd@thinkpad>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <D80C3F77-70A1-4ECF-A492-97D6D28B9484@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <D80C3F77-70A1-4ECF-A492-97D6D28B9484@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 17:41:10 -0000

On Mon, Mar 04, 2019 at 04:01:16PM -0500, Brad Bishop wrote:
>oops=E2=80=A6I did not mean to take the list off copy.  Adding it back o=
n=E2=80=A6
>
>> On Mar 4, 2019, at 3:56 PM, Supreeth Venkatesh <Supreeth.Venkatesh@arm=
.com> wrote:
>>
>>
>> Thanks Brad.
>>
>> Hi Zane/Brad,
>>
>> On Arm Platforms, We use Common Platform Error Record (CPER) to report=
 these kinds of hardware errors.

Supreeth - Is the code that generates these open source?
