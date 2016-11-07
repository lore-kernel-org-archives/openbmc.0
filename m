Return-Path: <shliyi@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC6hZ3n0kzDsxc
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 20:34:05 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA79UEYV129219
 for <openbmc@lists.ozlabs.org>; Mon, 7 Nov 2016 04:34:03 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26jpv6rnry-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 04:34:03 -0500
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 7 Nov 2016 19:34:00 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 7 Nov 2016 19:33:59 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 961892BB0055
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 20:33:58 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA79XwMf6488484
 for <openbmc@lists.ozlabs.org>; Mon, 7 Nov 2016 20:33:58 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uA79XwXW025645
 for <openbmc@lists.ozlabs.org>; Mon, 7 Nov 2016 20:33:58 +1100
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uA79XuB0025533
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 7 Nov 2016 20:33:57 +1100
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 7 Nov 2016 02:33:56 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Mon, 7 Nov 2016 02:33:54 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 7 Nov 2016 09:33:53 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 7 Nov 2016 09:33:51 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016110709335103-96802 ;
 Mon, 7 Nov 2016 09:33:51 +0000 
MIME-Version: 1.0
In-Reply-To: <20161107040643.GE15757@heinlein.lan>
Subject: Re: How to handle GPIO differences between P8 and P9
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Mine <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Mon, 7 Nov 2016 17:10:59 +0800
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
X-KeepSent: 7F37D1BE:BCC7E74A-48258064:00313B2C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 26499
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BB0AF7DFA2BDBC8f9e8a93df938690918cC7BB0AF7DFA2BDBC"
Content-Disposition: inline
x-cbid: 16110709-0052-0000-0000-000001E4C59B
X-IBM-ISS-SpamDetectors: Score=0.445263; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.445263; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006035; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00777639; UDB=6.00374413; UTC=2016-11-07
 09:33:52
x-cbparentid: 16110709-7094-0000-0000-00000230DBE4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-07_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611070152
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2016 09:34:07 -0000


--0__=C7BB0AF7DFA2BDBC8f9e8a93df938690918cC7BB0AF7DFA2BDBC
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

I committed a patch: https://gerrit.openbmc-project.xyz/#/c/1019/
to add a getSystemName() dbus method in org.obmc.managers.System interface.
There are several places in skeleton requires fix for a specific system.

Other way be add a compile flag in yocto when building Skeleton.

> From: Patrick Williams <patrick@stwcx.xyz>
> To: Mine <mine260309@gmail.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 11/07/2016 12:07 PM
> Subject: Re: How to handle GPIO differences between P8 and P9
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> On Fri, Nov 04, 2016 at 11:45:02AM -0500, Mine wrote:
> > Hi All,
> >
> > This mail is to discuss how to handle GPIO differences (e.g.
> > functionality, IN/OUT) between different HWs.
> >
> > I went into a case the P8 uses two GPIOs, but P9 does not use them: in
> > skeleton/op-hostctl/control=5Fhost=5Fobj.c:
> >
> > GPIO Throttle =3D (GPIO){ "BMC=5FTHROTTLE" };
> > GPIO idbtn =3D (GPIO){ "IDBTN" };
> > ...
> > rc |=3D gpio=5Fwrite(&Throttle,1);
> > rc |=3D gpio=5Fwrite(&idbtn,0);
> >
> > In P9, BMC=5FTHROTTLE is renamed to N=5FMODE=5FN, and changed to an IN =
GPIO;
> > IDBTN is changed to IN GPIO as well.
> > If we keep the above code and overriding the GPIOs, writing
> > BMC=5FTHROTTLE takes no effect, but writing to IDBTN may break the
> > function of its related front panel button.
> >
> > So I think we need to distinguish such cases to avoid issues.
> >
> > The question is, how to change the code to support different HWs that
> > have unique GPIOs?
>
> The current GPIO names are "Barreleye-Centric" in that they are named
> based on names that were on the Barreleye board.  We need to move the
> GPIO structure to be "Function-Centric" instead so that it is more
> generally applicable.
>
> That is something that will probably happen over the next few months.
> Joel is working on a proposal and we'll schedule some of the refactoring
> work afterwards in the userspace code.
>
> We might go the route of having dbus objects for GPIOs instead of having
> direct access, similar to what I believe the current proposal is for
> LEDs.  We'll have to see what Joel proposes first and then discuss it.
>
> I would suggest for now we simply do the minimum we need to to "make P9
> work".  If this means using GPIO names that continue to match Barreleye
> naming schemes, rather than Witherspoon / Romulus, I think that makes
> sense.  You can always keep a comment in the System.py file that names
> the "real board" name.
>
> In cases where they have different functionality, doesn't using a
> different name solve that?  Having a different name means the lookup to
> "BMC=5FTHROTTLE" or "IDBTN" will fail on Witherspoon and thus this code
> will no longer function, right?

For a temp fix, the simplest way is not to define IDBTN in Romulus.py.
This will cause an error message reported - but does not hurt.

Thanks,
-Yi

--0__=C7BB0AF7DFA2BDBC8f9e8a93df938690918cC7BB0AF7DFA2BDBC
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>I committed a patch: </tt><a href=3D"https://gerrit.open=
bmc-project.xyz/#/c/1019/"><tt>https://gerrit.openbmc-project.xyz/#/c/1019/=
</tt></a><br><tt>to add a getSystemName() dbus method in org.obmc.managers.=
System interface.</tt><br><tt>There are several places in skeleton requires=
 fix for a specific system.</tt><br><br><tt>Other way be add a compile flag=
 in yocto when building Skeleton.</tt><br><tt><br>&gt; From: Patrick Willia=
ms &lt;patrick@stwcx.xyz&gt;</tt><br><tt>&gt; To: Mine &lt;mine260309@gmail=
.com&gt;</tt><br><tt>&gt; Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org=
&gt;</tt><br><tt>&gt; Date: 11/07/2016 12:07 PM</tt><br><tt>&gt; Subject: R=
e: How to handle GPIO differences between P8 and P9</tt><br><tt>&gt; Sent b=
y: &quot;openbmc&quot; &lt;openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs=
.org&gt;</tt><br><tt>&gt; <br>&gt; On Fri, Nov 04, 2016 at 11:45:02AM -0500=
, Mine wrote:<br>&gt; &gt; Hi All,<br>&gt; &gt; <br>&gt; &gt; This mail is =
to discuss how to handle GPIO differences (e.g.<br>&gt; &gt; functionality,=
 IN/OUT) between different HWs.<br>&gt; &gt; <br>&gt; &gt; I went into a ca=
se the P8 uses two GPIOs, but P9 does not use them: in<br>&gt; &gt; skeleto=
n/op-hostctl/control=5Fhost=5Fobj.c:<br>&gt; &gt; <br>&gt; &gt; GPIO Thrott=
le =3D (GPIO){ &quot;BMC=5FTHROTTLE&quot; };<br>&gt; &gt; GPIO idbtn =3D (G=
PIO){ &quot;IDBTN&quot; };<br>&gt; &gt; ...<br>&gt; &gt; rc |=3D gpio=5Fwri=
te(&amp;Throttle,1);<br>&gt; &gt; rc |=3D gpio=5Fwrite(&amp;idbtn,0);<br>&g=
t; &gt; <br>&gt; &gt; In P9, BMC=5FTHROTTLE is renamed to N=5FMODE=5FN, and=
 changed to an IN GPIO;<br>&gt; &gt; IDBTN is changed to IN GPIO as well.<b=
r>&gt; &gt; If we keep the above code and overriding the GPIOs, writing<br>=
&gt; &gt; BMC=5FTHROTTLE takes no effect, but writing to IDBTN may break th=
e<br>&gt; &gt; function of its related front panel button.<br>&gt; &gt; <br=
>&gt; &gt; So I think we need to distinguish such cases to avoid issues.<br=
>&gt; &gt; <br>&gt; &gt; The question is, how to change the code to support=
 different HWs that<br>&gt; &gt; have unique GPIOs?<br>&gt; <br>&gt; The cu=
rrent GPIO names are &quot;Barreleye-Centric&quot; in that they are named<b=
r>&gt; based on names that were on the Barreleye board. &nbsp;We need to mo=
ve the<br>&gt; GPIO structure to be &quot;Function-Centric&quot; instead so=
 that it is more<br>&gt; generally applicable.<br>&gt; <br>&gt; That is som=
ething that will probably happen over the next few months.<br>&gt; Joel is =
working on a proposal and we'll schedule some of the refactoring<br>&gt; wo=
rk afterwards in the userspace code.<br>&gt; <br>&gt; We might go the route=
 of having dbus objects for GPIOs instead of having<br>&gt; direct access, =
similar to what I believe the current proposal is for<br>&gt; LEDs. &nbsp;W=
e'll have to see what Joel proposes first and then discuss it.<br>&gt; <br>=
&gt; I would suggest for now we simply do the minimum we need to to &quot;m=
ake P9<br>&gt; work&quot;. &nbsp;If this means using GPIO names that contin=
ue to match Barreleye<br>&gt; naming schemes, rather than Witherspoon / Rom=
ulus, I think that makes<br>&gt; sense. &nbsp;You can always keep a comment=
 in the System.py file that names<br>&gt; the &quot;real board&quot; name.<=
br>&gt; <br>&gt; In cases where they have different functionality, doesn't =
using a<br>&gt; different name solve that? &nbsp;Having a different name me=
ans the lookup to<br>&gt; &quot;BMC=5FTHROTTLE&quot; or &quot;IDBTN&quot; w=
ill fail on Witherspoon and thus this code<br>&gt; will no longer function,=
 right?</tt><br><br><tt>For a temp fix, the simplest way is not to define I=
DBTN in Romulus.py.</tt><br><tt>This will cause an error message reported -=
 but does not hurt.</tt><br><tt><br>Thanks,</tt><br><tt>-Yi</tt><BR>
</body></html>

--0__=C7BB0AF7DFA2BDBC8f9e8a93df938690918cC7BB0AF7DFA2BDBC--
