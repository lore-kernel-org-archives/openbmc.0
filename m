Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qv4cb6ksFzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 11:04:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=oNYUoeLC; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 2E413234B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461632669;
 bh=SlWu846ave9g9scYK2YRqwK0ZmyRUvLgOLzrGSSStRI=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=oNYUoeLCyTVWjX2W2iYrxEnyShO2h5IuZeXHnODr2rVJHjz+AL5ny9RLOgNBRIR6i
 BdyhIYYdGPtZ6tyuc+64JvV3D54gmS5H+R+u2XSWN7VKcJQ5rL8geF6QwIG9z8+G2D
 ajRJN4/7v+BR+kn0FAKm9qj54y3ZnP58RJIbV0fU=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 306FB2347F;
 Mon, 25 Apr 2016 21:04:28 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20160426103529.2c4ff3fa@camb691>
Date: Mon, 25 Apr 2016 21:04:28 -0400
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4DFF7E3-7207-4F86-AB93-E36CF6B31DDC@fuzziesquirrel.com>
References: <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160426103529.2c4ff3fa@camb691>
To: Cyril Bur <cyrilbur@gmail.com>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Tue, 26 Apr 2016 01:04:32 -0000

Yep, thats what it does.  Did you use =
obmc-phosphor-image-<machine>.cpio.lzma.u-boot?

-brad

> On Apr 25, 2016, at 8:35 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
>=20
> On Thu, 21 Apr 2016 16:20:29 -0500
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>=20
>> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>>=20
>> Build a rootfs cpio uimage with everything along with the other
>> images.
>=20
> There isn't much to go with, are you saying you're building a =
initramfs image
> that contains the full openbmc userspace so that a booting system =
doesn't need
> access to the flash at all. This is exactly what I need right now, =
thankyou!!
>=20
> I've applied this patch, and I THINK I booted with the right file... =
doesn't
> appear to have worked, it still tried to mount the flash and because I =
can't
> flash openbmc on my machine I got dropped into recovery shell.
>=20
> Thoughts?
>=20
> Thanks anyway...
>=20
> Cyril
>=20
>> ---
>> meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc =
b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
>> index 60ed088..260cc90 100644
>> --- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
>> +++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
>> @@ -14,6 +14,7 @@ UBOOT_SUFFIX ?=3D "bin"
>> MACHINEOVERRIDES =3D. "openbmc:"
>>=20
>> IMAGE_FSTYPES +=3D "overlay"
>> +IMAGE_FSTYPES +=3D "cpio.${INITRAMFS_CTYPE}.u-boot"
>> IMAGE_INSTALL +=3D "u-boot-fw-utils"
>>=20
>> IMAGE_CLASSES +=3D "obmc-phosphor-image_types_uboot"
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
