Return-Path: <miltonm@us.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 557C21A02E6
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 09:57:38 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 9 Mar 2016 15:57:36 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 15:57:34 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id DBF033E4003E
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 15:57:33 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u29MvXGb38600750
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 15:57:33 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u29MvXQm029514
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 15:57:33 -0700
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u29MvWZn029433
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 15:57:32 -0700
Message-Id: <201603092257.u29MvWZn029433@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 9 Mar 2016 17:57:32 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 9 Mar 2016 17:57:29 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 9 Mar 2016 22:57:27 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 22:57:17 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016030922571723-491941 ;
 Wed, 9 Mar 2016 22:57:17 +0000 
In-Reply-To: 
Subject: Re: [PATCH skeleton] Updated SCU88 register for Correct PCIe inventory
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Norman James" <njames@us.ibm.com>, adi.gangidi@rackspace.com
Cc: openbmc@lists.ozlabs.org
Date: Wed, 9 Mar 2016 22:57:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_02222016_FP4 March 02, 2016
X-LLNOutbound: False
X-Disclaimed: 57987
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16030922-0013-0000-0000-00001DD21368
X-IBM-ISS-SpamDetectors: Score=0.40962; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.40962; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005017; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00671029; UDB=6.00306621; UTC=2016-03-09
 22:57:22
x-cbparentid: 16030922-5090-0000-0000-000007853A4F
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Wed, 09 Mar 2016 22:57:39 -0000


Norm James wrote:
> =C2=A0 That process is no longer ran. All scu setup is done in kernel.=20
> We should probably remove that whole .c file from repository.
=20
The kernel is writing the register to the same values in
 =20
do=5Fcommon=5Fsetup in arch/arm/mach-aspeed/aspeed.c. =20

so the concept of the patch needs to be moved there.

>=20
>=20
>> On Mar 9, 2016, at 9:32 AM, Adi Gangidi <adi.gangidi@rackspace.com> wrot=
e:
>>
>> Before This change:
>> a) SCU 88 was double assigned, first to 0x01C000FF in line:97 and then t=
o 0x01C0007F in line:100.
>> b) Which meant (in both cases, some or all of) bits 7:0 were set to 1. T=
hat is: We were reading : PWMx or VPIGx instead of GPIONx (GPIONx gives us =
the PCIe inventory status, where x is bit number)
>>
>> After This Change:
>> a) Got rid of the double assignment by commenting out the second SCU88 a=
ssignment
>> b) Bits (7:0) of SCU 88 are set to 0 . (According to Page 111 of data sh=
eet these have to be set to 0 for us to to read GPION0 to GPIO N7 which ind=
icate if PCIe device is present )
>>
>> Description of pins 7:0 of SCU 88:
>> 7 RW Enable PWM7 or VPIG7 function pin (SCU90[5:4]=3D0x2 select Video pi=
n)
>> 6 RW Enable PWM6 or VPIG6 function pin (SCU90[5:4]=3D0x2 select Video pi=
n)
>> 5 RW Enable PWM5 or VPIG5 function pin (SCU90[5:4]!=3D0 select Video pin)
>> 4 RW Enable PWM4 or VPIG4 function pin (SCU90[5:4]!=3D0 select Video pin)
>> 3 RW Enable PWM3 or VPIG3 function pin (SCU90[5:4]!=3D0 select Video pin)
>> 2 RW Enable PWM2 or VPIG2 function pin (SCU90[5:4]!=3D0 select Video pin)
>> 1 RW Enable PWM1 or VPIG1 function pin (SCU90[5:4]=3D0x3 select Video pi=
n)
>> 0 RW Enable PWM0 or VPIG0 function pin (SCU90[5:4]=3D0x3 select Video pi=
n)
>> ---

A couple of comments for the change log:  The kernel prefers the change log=
=20
be written in the imperative, and clearly state the problem (see=20
Documentation/SubmittingPatches).  Instead of describing the code before
and after describe the problem and the change.

Something like this be an improvement:

The Barreleye system uses the N0 through N5 GPIOs for inventory presence,
but the kernel is initializing the pin mux to the alternate PWM or Video in=
=20
functions.

Initialize bits 0-7 of SCU 88 Multi-function Pin Control Register #3 to 0=20
and remove the second write which had a different value only in these bit=20
positions.

milton
