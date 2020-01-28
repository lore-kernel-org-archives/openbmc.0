Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486gJZ4cf3zDqJX
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 08:50:05 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: BIOS, Hypervisor, and OS detailed boot progress in Redfish
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CALLMt=q-f=_5dR=E7QNwB893c1+inv4EPe5ZrAfhG1Va8fUHQQ@mail.gmail.com>
Date: Tue, 28 Jan 2020 16:50:01 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E7E4DB5-1AD6-4B8C-A3B2-F7ED12265D37@fuzziesquirrel.com>
References: <CALLMt=q-f=_5dR=E7QNwB893c1+inv4EPe5ZrAfhG1Va8fUHQQ@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 28 Jan 2020 21:50:07 -0000


> I think our goal should be to provide a high level summary of the boot =
from
> the BIOS, to the Hypervisor, to the OS.
>=20
> Something like this?
> Unknown -> MotherboardInit -> MemoryInit -> SecondaryProcInit ->
>        -> HypervisorStart -> HypervisorStandby -> OSStart -> OSRunning

I would suggest renaming the hypervisor steps with =E2=80=9Csystem =
firmware=E2=80=9D where system firmware is things like:

BIOS
UEFI
coreboot
petitboot
PowerVM

On our PowerVM systems the system firmware also happens to be the =
hypervisor but I don=E2=80=99t think that is typically the case =
elsewhere.=
