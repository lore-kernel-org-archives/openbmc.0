Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW7br0MCnzDqdt
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:09:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=LJpsYh1/; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 682E828B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1466140197;
 bh=E13F/psKKWlwMeO0iqVaX+djINC9DJ0iRkuCgPU567Y=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=LJpsYh1/JkJTKt8Tsa4m4rnymaNzPln2f2IOvQ0oBRRbsJMk/KxkAHeRiM7xnfzb7
 UGLmRLFc6iGMyk1OjagwoWGaoKN09989X+dD0c/eTx3fRomVE6WjA9Io0Rf/Qik5pF
 As90UzIT5qKeXSKvA0kQ26Ij0D1fbJX1gMLVjCEw=
Received: from [192.168.253.29] (unknown [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id A572128AEB;
 Fri, 17 Jun 2016 01:09:56 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Need some thoughts on systemd service file
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20160616184811.GB19968@asimov.austin.ibm.com>
Date: Fri, 17 Jun 2016 01:09:56 -0400
Cc: Vishwanatha Subbanna <vishwanath@in.ibm.com>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F5C0FC8-B8CF-4E7B-9B24-48FEE1E5CB45@fuzziesquirrel.com>
References: <OF27BAEC52.32D2FF79-ON65257FD4.0060E8C5-65257FD4.0061238B@notes.na.collabserv.com>
 <20160616184811.GB19968@asimov.austin.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3124)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 05:10:01 -0000

Vishwa

I applied your patch and it works great!  I sent you a picture=E2=80=A6

Do you have e36358c in your openbmc tree?

-brad

> On Jun 16, 2016, at 2:48 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Vishwa,
>=20
> A few suggestions on your commit:
>=20
> 1. I see you put the files into .../network/files/ and moved them from
> .../network/network/ .  Why is that?
>=20
> 2. 'inherit obmc-phosphor-systemd' causes your recipe to import
> obmc-phosphor-systemd.bbclass.  This file has:

rebase - I have been working on this file.

> =3D=3D=3D=3D
> inherit systemd
>=20
> SYSTEMD_SERVICE_${PN} =3D "${BPN}.service"
> SRC_URI +=3D " \
>    file://${BPN}.service \
>    "
>=20
> do_install_append() {
>    # install systemd unit files
>    install -d ${D}${systemd_unitdir}/system
>    install -m 0644 ${WORKDIR}/${BPN}.service =
${D}${systemd_unitdir}/system
> }
> =3D=3D=3D=3D=3D
> This means a few things...
>    a. By setting SYSTEMD_SERVICE_${PN} +=3D "network.service", you're
>       actually getting network.service added twice.
>    b. network.service will be installed by this do_install_append
>       snippet, but network-update-dns.service will not.  I think you
>       need to 'install' it.
>    c. I'm surprised we don't 'install' everything in
>       SYSTEMD_SERVICE_${PN} automatically or in this .bbclass.  Maybe
>       Brad can comment on why it is set up this way.

agreed - and I think I fixed this up better in the new version of this =
class - so again..rebase for the latest.

>=20
> 3. Before you made your change are we sure 'network.service' was
> working?  Hopefully someone has previously tested this but there is
> always the possibility that systemd is confused by 'network.service' =
vs
> 'network.target'.  Maybe 'network' is effectively a reserved word.
>=20
> 4. There is no advantage to setting SYSTEMD_AUTO_ENABLE because it is
> already defaulted to 'enable'.
>=20
> On Thu, Jun 16, 2016 at 11:11:00PM +0530, Vishwanatha Subbanna wrote:
>>=20
>>=20
>> hello Team,
>>=20
>> So here is what I am trying to do with :
>> =
https://github.com/vishwabmc/openbmc/commit/f28651bb92bc7af6b503c9ca07aa8d=
76a3f0660c
>>=20
>> 1/. Point bb to the git repo with commit #
>> c69c3d30fd7d5fd04ba990788b6d75b19f275fc8 that introduced =
netman_watch_dns
>> binary
>> 2/. Create 2 .service files inside
>> meta-phosphor/common/recipes-phosphor/network/files/ --> =
network.service
>> and network-update-dns.service
>> 3/  Make necessary changes to bitbake file so systemd can enable the
>> services and start at boot.
>> 4/. Build a Palmetto image ( or qemu too ) and copy 'em over to =
tftpserver
>> ( /tftpboot/cuImage_vishwa_1 and /tftpboot/initrd_vishwa_1 )
>> 5/. reboot palmetto and run netboot to new image.
>>=20
>> I expected that the netman.py ( which is part of network.service ) =
and
>> netman_watch_dns ( part of network-update-dns.service ) would get =
auto
>> started but they did *not* start and I need some thoughts on why this =
may
>> be happening.
>>=20
>> https://lists.yoctoproject.org/pipermail/yocto/2015-April/024470.html
>> ( Someone else also had same issue )
>>=20
>> What is that I am seeing :
>>=20
>> 1/. I see these 2 files are actually inside =
/lib/systemd/system/network
>> Palmetto in as expected --> Good
>> 2/. Services not started
>> 3/. systemctl status network shows that its disabled. Same for =
update-dns.
>> 4/. I see systemctl status skeleton displays everything is running
>> 4.1/ Removing the Requires=3D and After=3D in network.service and =
booting to
>> that changed image still does not help.
>> 5/. Manual start using systemctl start network -and/or- systemctl =
start
>> network-update-dns does everything okay and starts the expected =
services.
>> 6/. No error seen in journal
>>=20
>> Thanks
>>=20
>> =
--------------------------------------------------------------------------=
-----------
>>=20
>> Thanks and Regards,
>> Vishwanath.
>> Advisory Software Engineer,
>> Power Firmware Development,
>> Systems &Technology Lab,
>> MG2-6F-255 , Manyata Embassy Business Park,
>> Bangalore , KA , 560045
>> Ph: +91-80-46678255
>> E-mail: vishwanath@in.ibm.com
>> =
--------------------------------------------------------------------------=
--------
>>=20
>=20
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>=20
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
