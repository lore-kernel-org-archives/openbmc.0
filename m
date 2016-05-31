Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJjst1MGBzDqW8
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 16:16:01 +1000 (AEST)
Received: from pps.filterd (m0048827.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u4V6Dx5h005601
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 02:15:59 -0400
Message-Id: <201605310615.u4V6Dx5h005601@mx0a-001b2d01.pphosted.com>
Received: from e28smtp08.in.ibm.com (e28smtp08.in.ibm.com [125.16.236.8])
 by mx0a-001b2d01.pphosted.com with ESMTP id 238k6v747y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 02:15:58 -0400
Received: from localhost
 by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 31 May 2016 11:45:55 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp08.in.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 31 May 2016 11:45:53 +0530
X-IBM-Helo: d28dlp01.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 5B56AE0076
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 11:49:10 +0530 (IST)
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4V6Fi5D63635548
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 11:45:45 +0530
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 31 May 2016 00:15:44 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 31 May 2016 00:15:41 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 31 May 2016 06:15:40 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 31 May 2016 06:15:37 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016053106153706-41827 ;
 Tue, 31 May 2016 06:15:37 +0000 
MIME-Version: 1.0
In-Reply-To: <201605302322.u4UNEQaO012122@mx0a-001b2d01.pphosted.com>
Subject: Re: [PATCH ipmi-fru-parser] Replacing std::ifstream by access(2) for
 checking file existence
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Tue, 31 May 2016 11:45:34 +0530
References: <20160530082014.21716-1-openbmc-patches@stwcx.xyz>
 <20160530082014.21716-2-openbmc-patches@stwcx.xyz>
 <201605302322.u4UNEQaO012122@mx0a-001b2d01.pphosted.com>
X-KeepSent: D7B57630:8D78D111-65257FC4:001FCC45;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 57259
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF557DF8C4AD58f9e8a93df938690918cEABBF557DF8C4AD5"
Content-Disposition: inline
x-cbid: 16053106-0056-0000-0000-000002572960
X-IBM-ISS-SpamDetectors: Score=0.459521; BY=0.030781; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.459521; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005320; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000168; SDB=6.00709816; UDB=6.00329807; UTC=2016-05-31
 06:15:38
x-cbparentid: 16053106-4778-0000-0000-0000068E814B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-05-31_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=7
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1605310073
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
X-List-Received-Date: Tue, 31 May 2016 06:16:02 -0000


--0__=EABBF557DF8C4AD58f9e8a93df938690918cEABBF557DF8C4AD5
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

hello Sam,

Thanks for the review and suggestion.. I refreshed the pull request.

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------

"openbmc" <openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org> wrote =
on
31/05/2016 04:51:02 am:

> From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Cc: openbmc@lists.ozlabs.org
> Date: 31/05/2016 04:52 am
> Subject: Re: [PATCH ipmi-fru-parser] Replacing std::ifstream by
> access(2) for checking file existence
> Sent by: "openbmc" <openbmc-bounces
+vishwanath=3Din.ibm.com@lists.ozlabs.org>
>
> On Mon, May 30, 2016 at 03:20:14AM -0500, OpenBMC Patches wrote:
> > From: vishwa <vishwanath@in.ibm.com>
> >
> > ---
> >  writefrudata.C | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/writefrudata.C b/writefrudata.C
> > index 7ee2127..6e28341 100644
> > --- a/writefrudata.C
> > +++ b/writefrudata.C
> > @@ -663,7 +663,7 @@ int ipmi=5Fvalidate=5Ffru=5Farea(const uint8=5Ft
> fruid, const char *fru=5Ffile=5Fname,
> >                           (fruid, get=5Ffru=5Farea=5Ftype(fru=5Fentry),
> bus=5Ftype, bmc=5Ffru);
> >
> >          // Physically being present
> > -        bool present =3D std::ifstream(fru=5Ffile=5Fname);
> > +        bool present =3D (access(fru=5Ffile=5Fname, F=5FOK) !=3D -1) ?=
 true :
false;
>
> Hi Vishwa,
>
> Since (access(..) !=3D -1) returns a boolean you can simplify this to:
>
>         bool present =3D access(fru=5Ffile=5Fname, F=5FOK) !=3D -1;
>
> >          fru=5Farea->set=5Fpresent(present);
> >
> >          // Only setup dbus path for areas defined in BMC.
> > --
> > 2.8.3
> >
> >
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=EABBF557DF8C4AD58f9e8a93df938690918cEABBF557DF8C4AD5
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hello Sam,<br><br>Thanks for the review and suggestion.. I r=
efreshed the pull request.<br><br>Thanks<br><br>---------------------------=
----------------------------------------------------------<br>Thanks and Re=
gards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Power Firmware Deve=
lopment, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy B=
usiness Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br>E-mail:=
 vishwanath@in.ibm.com<br>-------------------------------------------------=
---------------------------------<br><br><tt>&quot;openbmc&quot; &lt;openbm=
c-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt; wrote on 31/05/2016 =
04:51:02 am:<br><br>&gt; From: Samuel Mendoza-Jonas &lt;sam@mendozajonas.co=
m&gt;</tt><br><tt>&gt; To: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt=
;</tt><br><tt>&gt; Cc: openbmc@lists.ozlabs.org</tt><br><tt>&gt; Date: 31/0=
5/2016 04:52 am</tt><br><tt>&gt; Subject: Re: [PATCH ipmi-fru-parser] Repla=
cing std::ifstream by <br>&gt; access(2) for checking file existence</tt><b=
r><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din=
.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; On Mon, May 30, 201=
6 at 03:20:14AM -0500, OpenBMC Patches wrote:<br>&gt; &gt; From: vishwa &lt=
;vishwanath@in.ibm.com&gt;<br>&gt; &gt; <br>&gt; &gt; ---<br>&gt; &gt; &nbs=
p;writefrudata.C | 2 +-<br>&gt; &gt; &nbsp;1 file changed, 1 insertion(+), =
1 deletion(-)<br>&gt; &gt; <br>&gt; &gt; diff --git a/writefrudata.C b/writ=
efrudata.C<br>&gt; &gt; index 7ee2127..6e28341 100644<br>&gt; &gt; --- a/wr=
itefrudata.C<br>&gt; &gt; +++ b/writefrudata.C<br>&gt; &gt; @@ -663,7 +663,=
7 @@ int ipmi=5Fvalidate=5Ffru=5Farea(const uint8=5Ft <br>&gt; fruid, const=
 char *fru=5Ffile=5Fname,<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (fruid, get=5Ffru=5F=
area=5Ftype(fru=5Fentry), <br>&gt; bus=5Ftype, bmc=5Ffru);<br>&gt; &gt; &nb=
sp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Physically being pres=
ent<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;bool present =3D std::ifstrea=
m(fru=5Ffile=5Fname);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;bool presen=
t =3D (access(fru=5Ffile=5Fname, F=5FOK) !=3D -1) ? true : false;<br>&gt; <=
br>&gt; Hi Vishwa,<br>&gt; <br>&gt; Since (access(..) !=3D -1) returns a bo=
olean you can simplify this to:<br>&gt; <br>&gt; &nbsp; &nbsp; &nbsp; &nbsp=
; bool present =3D access(fru=5Ffile=5Fname, F=5FOK) !=3D -1;<br>&gt; <br>&=
gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fru=5Farea-&gt;set=5Fpresent(pre=
sent);<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/=
/ Only setup dbus path for areas defined in BMC.<br>&gt; &gt; -- <br>&gt; &=
gt; 2.8.3<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; =5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; &gt; openbmc mailing lis=
t<br>&gt; &gt; openbmc@lists.ozlabs.org<br>&gt; &gt; <a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</=
a><br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<=
br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists=
.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=EABBF557DF8C4AD58f9e8a93df938690918cEABBF557DF8C4AD5--
