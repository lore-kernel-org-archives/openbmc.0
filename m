Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D1AE61A0034
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2015 17:32:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: Palmetto netboot instructions
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <CACPK8XdBN0RUHbCrk6OZXuV5q=t7FsTtn68=DeTq8HpRNEvbTg@mail.gmail.com>
Date: Tue, 6 Oct 2015 02:32:16 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <54035C08-0E79-4392-A29B-21AA481E800E@bwbmail.net>
References: <B4E73D93-EAC0-4F2F-A1F1-74D969EDBDE8@bwbmail.net>
 <CACPK8XdBN0RUHbCrk6OZXuV5q=t7FsTtn68=DeTq8HpRNEvbTg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 06:32:21 -0000

Joel

Phosphor is just an alias for openbmc.  The target for a build in OE is =
set in build/conf/local.conf by the machine variable.  The qemu target =
is =E2=80=98qemuarm=E2=80=99  -  the Palmetto target is palmetto.  =
obmc-phosphor-image is an image recipe - those are orthogonal to the =
build target.

If you are starting from scratch without a build/conf directory you can =
just:

=
TEMPLATECONF=3Dmeta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto=
/conf . oe-init-build-env

and that will populate local.conf for palmetto.

OE does has support for putting the initramfs into the kernel.  I tried =
briefly to get that going but I didn=E2=80=99t get very far.

Thx - Brad

> On Oct 6, 2015, at 2:17 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> Hey Brad,
>=20
> On Tue, Oct 6, 2015 at 4:35 PM, Brad Bishop <brad@bwbmail.net> wrote:
>> Please let me know if you run into any problems with this procedure =
or have
>> any feedback.  Thanks.
>=20
> Thanks for the instructions!
>=20
>> On build system:
>>=20
>> 1 - pull updates from here: https://github.com/bradbishop/openbmc-1
>> 2 - bitbake obmc-phosphor-image
>=20
> I thought 'phosphor' was the qemu target we were using for OpenBMC
> development, and that we would have a 'palmetto' target for running on
> the hardware. Can you clarify for me?
>=20
>> 3 - tmp/sysroots/x86_64-linux/usr/bin/mkimage -A arm -O linux -C none =
-T
>> ramdisk -a 0x50200000 -d
>> tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz =
initrd
>> 4 - scp tmp/deploy/images/palmetto/cuImage <tftp>:/tftpboot
>> 5 - scp tmp/deploy/images/palmetto/initrd <tftp>:/tftpboot
>=20
> Can we get bitbake to build the rootfs into the kernel?
>=20
> Cheers,
>=20
> Joel
