Return-Path: <miltonm@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E3B211A02CD
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 11:35:30 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 13 Feb 2016 19:35:26 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 13 Feb 2016 19:35:24 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id B2700C90043
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 19:35:21 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1E0ZOWR31523010
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 00:35:24 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1E0Vxem032436
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 19:31:59 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1E0VwnG032426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 19:31:59 -0500
Message-Id: <201602140031.u1E0VwnG032426@d01av05.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 13 Feb 2016 17:35:22 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 13 Feb 2016 17:35:20 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 14 Feb 2016 00:35:19 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 14 Feb 2016 00:35:16 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016021400351585-100688 ;
 Sun, 14 Feb 2016 00:35:15 +0000 
In-Reply-To: <CACPK8XedTDoPRTc2madutwo_qJcJ4VinuXnXfFGpiQaJ1iinng@mail.gmail.com>
Subject: Re: [PATCH linux 1/2] i2c: aspeed: Don't rename added devices
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Sun, 14 Feb 2016 00:35:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XedTDoPRTc2madutwo_qJcJ4VinuXnXfFGpiQaJ1iinng@mail.gmail.com>,
 <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455154228-7217-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02012016_FP2 February 05, 2016
X-LLNOutbound: False
X-Disclaimed: 12215
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16021400-0057-0000-0000-0000036B7694
X-IBM-ISS-SpamDetectors: Score=0.40962; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.40962; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004916; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000144; SDB=6.00659555; UDB=6.00299626; UTC=2016-02-14
 00:35:17
x-cbparentid: 16021400-7792-0000-0000-000001FAE235
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
X-List-Received-Date: Sun, 14 Feb 2016 00:35:31 -0000




On 02/11/2016 10:23PM, Joel Stanley wrote:
>Subject: Re: [PATCH linux 1/2] i2c: aspeed: Don't rename added devices
>
>On Thu, Feb 11, 2016 at 12:00 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
>> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>>
>> Changing the name of a device with dev=5Fset=5Fname after device=5Fadd
>> is not allowed.
>>
>> However, of=5Fcreate=5Fdevice takes a bus=5Fid parameter that specifies
>> the name of the platform device being added.
>>
>> This does mean the bus property has to be retrieved multiple times.
>> Creation is skiped if there is trouble retrieving or formatting
>> the name.

Spell checking this pointed out skipped above is missing a p in the
commit message.

>
> Ok, this approach looks alright.
>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-as=
peed.c
>> index 5488233..ccb438f 100644
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for=5Feach=5Fchild=5Fof=5Fnode(pdev->dev.of=
=5Fnode, np) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of=5Fplatform=5Fdevic=
e=5Fcreate(np, NULL, &pdev->dev);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 bus=5Fnum;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char bus=5Fid[sizeof(=
"i2c-12345")];
>
> Clever, but I don't think it's kernel style. A constant will do.

git grep  'sizeof("'  | wc -l

yields 235 occurrences, 94 with an additional \[ in front.  Including=20
well maintained sections of the kernel like vsnprintf for uuid length=20
and network code for formatting ip addresses.

I admit the 5 digit bus number is a bit arbitrary, but I think the origin o=
f=20
a constant will be less clear than this code.

>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D snprintf(bus=
=5Fid, sizeof(bus=5Fid), "i2c-%u", bus=5Fnum);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret >=3D sizeof(b=
us=5Fid))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
>
> You should check for a negative value as well.

It's defined to return "the number of characters which would be written to =
the buffer",=20
not sure how that can ever be < 0 other than the undefined overflow of the =
int type.=20
vscnprintf doesn't consider a need to check for < 0.  The size=5Ft input of=
 the underlying=20
vsnprintf is checked vs INT=5FMAX and returns 0 in that case.

Can you point to other kernel code that checks printf family for returns < =
0 ?

Thanks,
milton
