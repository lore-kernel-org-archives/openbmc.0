Return-Path: <anoo@us.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7pmF4Km8zDq6B
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 04:25:17 +1000 (AEST)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 16 May 2016 14:25:14 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 16 May 2016 14:25:11 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 2294A38C804A
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 14:25:10 -0400 (EDT)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4GIP9kj34668748
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 18:25:09 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4GIP9iE016078
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 14:25:09 -0400
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4GIP8AN015983
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 14:25:09 -0400
Message-Id: <201605161825.u4GIP8AN015983@d01av03.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 16 May 2016 12:25:08 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 16 May 2016 12:25:07 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 16 May 2016 18:25:06 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 16 May 2016 18:25:04 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016051618250326-358957 ;
 Mon, 16 May 2016 18:25:03 +0000 
In-Reply-To: <CACPK8Xfwb3TJeUHWZYY6LRHUK+eyjPfo5B2Hq=jcJ4p2UUFd2A@mail.gmail.com>
To: ken.th.liu@foxconn.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux] Add debounce for power button,
 pull down gpioQ7 to unlock identify LED
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Mon, 16 May 2016 13:25:03 -0500
References: <1461908454-24209-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461908454-24209-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XdBaCC5npZ8UvfxEaeLuDL72n3p98-sx_XnpwbaRqYuHQ@mail.gmail.com>
 <CACPK8Xfwb3TJeUHWZYY6LRHUK+eyjPfo5B2Hq=jcJ4p2UUFd2A@mail.gmail.com>
MIME-Version: 1.0
X-KeepSent: 5072E176:FA4BBDF2-86257FB5:00649C77;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 54631
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 00652B3B86257FB5_="
x-cbid: 16051618-0045-0000-0000-000004330831
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005289; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00703054; UDB=6.00325740; UTC=2016-05-16
 18:25:05
x-cbparentid: 16051618-4778-0000-0000-0000064F1A3F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Mon, 16 May 2016 18:25:18 -0000


--=_alternative 00652B3B86257FB5_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi Ken,

Could you reply to Joel if you have any questions about his comments or=20
make a new pull request so that the change can be merged? Specifically is=20
provide more info regarding the changes, I'm copying the comments here.=20
Thanks.


>> From: Ken <ken.sk.lai@mail.foxconn.com>
> We need to include a description of why this change is being made.
> What does it fix? Why does the previous behaviour need to be modified?

>> +       writel(0x00001080, AST=5FIO(AST=5FBASE=5FGPIO | 0x84));
> We have a GPIO driver that handles setting this register.

>> +       writel(0x010FFFFF, AST=5FIO(AST=5FBASE=5FSCU | 0xA8));
> Can you explain each of these you're setting each of these bits?




From:   Joel Stanley <joel@jms.id.au>
To:     OpenBMC Patches <openbmc-patches@stwcx.xyz>,=20
ken.th.liu@foxconn.com
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:   05/12/2016 02:11 AM
Subject:        Re: [PATCH linux] Add debounce for power button, pull down =

gpioQ7 to unlock identify LED
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



ping

On Mon, May 2, 2016 at 11:12 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Apr 29, 2016 at 3:10 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
>> From: Ken <ken.sk.lai@mail.foxconn.com>
>>
>
> We need to include a description of why this change is being made.
> What does it fix? Why does the previous behaviour need to be modified?
>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>  mode change 100644 =3D> 100755 arch/arm/mach-aspeed/aspeed.c
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c=20
b/arch/arm/mach-aspeed/aspeed.c
>> old mode 100644
>> new mode 100755
>> index 594a781..fa5d467
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -138,9 +138,10 @@ static void =5F=5Finit do=5Fbarreleye=5Fsetup(void)
>>         /* GPIO setup */
>>         writel(0x9E82FCE7, AST=5FIO(AST=5FBASE=5FGPIO | 0x00));
>>         writel(0x0370E677, AST=5FIO(AST=5FBASE=5FGPIO | 0x04));
>> -
>> +       writel(0x00001080, AST=5FIO(AST=5FBASE=5FGPIO | 0x84));
>
> We have a GPIO driver that handles setting this register.
>
>>         /* SCU setup */
>>         writel(0x01C00000, AST=5FIO(AST=5FBASE=5FSCU | 0x88));
>> +       writel(0x010FFFFF, AST=5FIO(AST=5FBASE=5FSCU | 0xA8));
>
> Can you explain each of these you're setting each of these bits?
>
>>         /*
>>          * Do read/modify/write on power gpio to prevent resetting=20
power on
>> @@ -150,7 +151,10 @@ static void =5F=5Finit do=5Fbarreleye=5Fsetup(void)
>>         reg |=3D 0xCFC8F7FD;
>>         writel(reg, AST=5FIO(AST=5FBASE=5FGPIO | 0x20));
>>         writel(0xC738F20A, AST=5FIO(AST=5FBASE=5FGPIO | 0x24));
>> -       writel(0x0031FFAF, AST=5FIO(AST=5FBASE=5FGPIO | 0x80));
>> +       writel(0x0031FF2F, AST=5FIO(AST=5FBASE=5FGPIO | 0x80));
>> +       writel(0x00000001, AST=5FIO(AST=5FBASE=5FGPIO | 0x48));
>> +       writel(0x00000001, AST=5FIO(AST=5FBASE=5FGPIO | 0x4C));
>> +       writel(0x00075300, AST=5FIO(AST=5FBASE=5FGPIO | 0x58));
>
> As above; we have a GPIO driver that handles setting this register.
> Changing these states needs to be done from userspace. See
> https://github.com/openbmc/skeleton/blob/master/bin/Barreleye.py#L531
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc





--=_alternative 00652B3B86257FB5_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Hi Ken,</font><br><br><font size=3D2 fac=
e=3D"sans-serif">Could you reply to Joel if you have
any questions about his comments or make a new pull request so that the
change can be merged? Specifically is provide more info regarding the chang=
es,
I'm copying the comments here. Thanks.</font><br><br><br><tt><font size=3D2=
>&gt;&gt; From: Ken &lt;ken.sk.lai@mail.foxconn.com&gt;</font></tt><br><tt>=
<font size=3D2>&gt; We need to include a description of why this
change is being made.<br>&gt; What does it fix? Why does the previous behav=
iour need to be modified?</font></tt><br><br><tt><font size=3D2>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; writel(0x00001080,
AST=5FIO(AST=5FBASE=5FGPIO | 0x84));<br>&gt; We have a GPIO driver that han=
dles setting this register.</font></tt><br><br><tt><font size=3D2>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; writel(0x010FFFFF,
AST=5FIO(AST=5FBASE=5FSCU | 0xA8));<br>&gt; Can you explain each of these y=
ou're setting each of these bits?</font></tt><br><br><br><br><br><font size=
=3D1 color=3D#5f5f5f face=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Joel Stanley &lt;joel@jms.i=
d.au&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">To: &=
nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt;,
ken.th.liu@foxconn.com</font><br><font size=3D1 color=3D#5f5f5f face=3D"san=
s-serif">Cc: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Maillist &lt;openbm=
c@lists.ozlabs.org&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"san=
s-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">05/12/2016 02:11 AM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: [PATCH linux]
Add debounce for power button, pull down gpioQ7 to unlock identify LED</fon=
t><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Sent by: &nbsp; &n=
bsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><tt><font size=3D2>ping<br><br>On Mon, May 2, 2016 at 11:=
12 AM, Joel Stanley &lt;joel@jms.id.au&gt; wrote:<br>&gt; On Fri, Apr 29, 2=
016 at 3:10 PM, OpenBMC Patches<br>&gt; &lt;openbmc-patches@stwcx.xyz&gt; w=
rote:<br>&gt;&gt; From: Ken &lt;ken.sk.lai@mail.foxconn.com&gt;<br>&gt;&gt;=
<br>&gt;<br>&gt; We need to include a description of why this change is bei=
ng made.<br>&gt; What does it fix? Why does the previous behaviour need to =
be modified?<br>&gt;<br>&gt;&gt; ---<br>&gt;&gt; &nbsp;arch/arm/mach-aspeed=
/aspeed.c | 8 ++++++--<br>&gt;&gt; &nbsp;1 file changed, 6 insertions(+), 2=
 deletions(-)<br>&gt;&gt; &nbsp;mode change 100644 =3D&gt; 100755 arch/arm/=
mach-aspeed/aspeed.c<br>&gt;&gt;<br>&gt;&gt; diff --git a/arch/arm/mach-asp=
eed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c<br>&gt;&gt; old mode 100644<br=
>&gt;&gt; new mode 100755<br>&gt;&gt; index 594a781..fa5d467<br>&gt;&gt; --=
- a/arch/arm/mach-aspeed/aspeed.c<br>&gt;&gt; +++ b/arch/arm/mach-aspeed/as=
peed.c<br>&gt;&gt; @@ -138,9 +138,10 @@ static void =5F=5Finit do=5Fbarrele=
ye=5Fsetup(void)<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; /* GPIO setup */<b=
r>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; writel(0x9E82FCE7, AST=5FIO(AST=5FBA=
SE=5FGPIO
| 0x00));<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; writel(0x0370E677, AST=5F=
IO(AST=5FBASE=5FGPIO
| 0x04));<br>&gt;&gt; -<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; writel(0x0000108=
0, AST=5FIO(AST=5FBASE=5FGPIO
| 0x84));<br>&gt;<br>&gt; We have a GPIO driver that handles setting this r=
egister.<br>&gt;<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; /* SCU setup */<br=
>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; writel(0x01C00000, AST=5FIO(AST=5FBAS=
E=5FSCU
| 0x88));<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; writel(0x010FFFFF, AST=5FIO(AS=
T=5FBASE=5FSCU
| 0xA8));<br>&gt;<br>&gt; Can you explain each of these you're setting each=
 of these bits?<br>&gt;<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; /*<br>&gt;&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Do read/modify/write on power
gpio to prevent resetting power on<br>&gt;&gt; @@ -150,7 +151,10 @@ static =
void =5F=5Finit do=5Fbarreleye=5Fsetup(void)<br>&gt;&gt; &nbsp; &nbsp; &nbs=
p; &nbsp; reg |=3D 0xCFC8F7FD;<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; writ=
el(reg, AST=5FIO(AST=5FBASE=5FGPIO |
0x20));<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; writel(0xC738F20A, AST=5FIO=
(AST=5FBASE=5FGPIO
| 0x24));<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; writel(0x0031FFAF, AST=5FIO(AS=
T=5FBASE=5FGPIO
| 0x80));<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; writel(0x0031FF2F, AST=5FIO(AS=
T=5FBASE=5FGPIO
| 0x80));<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; writel(0x00000001, AST=5FIO(AS=
T=5FBASE=5FGPIO
| 0x48));<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; writel(0x00000001, AST=5FIO(AS=
T=5FBASE=5FGPIO
| 0x4C));<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; writel(0x00075300, AST=5FIO(AS=
T=5FBASE=5FGPIO
| 0x58));<br>&gt;<br>&gt; As above; we have a GPIO driver that handles sett=
ing this register.<br>&gt; Changing these states needs to be done from user=
space. See<br>&gt; </font></tt><a href=3Dhttps://github.com/openbmc/skeleto=
n/blob/master/bin/Barreleye.py#L531><tt><font size=3D2>https://github.com/o=
penbmc/skeleton/blob/master/bin/Barreleye.py#L531</font></tt></a><tt><font =
size=3D2><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></font></tt><=
a href=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><font size=3D2>https=
://lists.ozlabs.org/listinfo/openbmc</font></tt></a><tt><font size=3D2><br>=
</font></tt><br><br><BR>
--=_alternative 00652B3B86257FB5_=--
