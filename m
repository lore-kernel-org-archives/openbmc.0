Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTXXc4LzTzDqdy
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 00:46:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5EEhoRK129307
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 10:46:37 -0400
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23je2k5gj8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 10:46:37 -0400
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 14 Jun 2016 20:16:31 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 14 Jun 2016 20:16:29 +0530
X-IBM-Helo: d28dlp02.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay08.in.ibm.com (d28relay08.in.ibm.com [9.184.220.159])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id 051D43940067
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 20:16:29 +0530 (IST)
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28relay08.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5EEkR7F38928440
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 20:16:28 +0530
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 14 Jun 2016 08:46:26 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 14 Jun 2016 08:46:24 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 14 Jun 2016 14:46:23 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 14 Jun 2016 14:46:19 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016061414461856-351447 ;
 Tue, 14 Jun 2016 14:46:18 +0000 
MIME-Version: 1.0
In-Reply-To: <630F062D-1D42-4DA5-B9DA-D422901F7F2D@fuzziesquirrel.com>
Subject: Re: Authentication for OpenBMC port 3000
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Tue, 14 Jun 2016 20:16:17 +0530
References: <OF97E67B46.5B644A38-ON86257FD2.000986B3-86257FD2.000A1137@notes.na.collabserv.com>
 <20160614110341.GY19968@asimov.austin.ibm.com>
 <630F062D-1D42-4DA5-B9DA-D422901F7F2D@fuzziesquirrel.com>
X-KeepSent: 24BDEA24:1B1CB5D1-65257FD2:00511ECF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 33651
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F"
x-cbid: 16061414-0004-0000-0000-000002A140BA
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.133454; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005381; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00716194; UDB=6.00333695; UTC=2016-06-14
 14:46:21
x-cbparentid: 16061414-7792-0000-0000-0000040A4A8F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF24BDEA24.1B1CB5D1-ON65257FD2.00511ECF-65257FD2.00512491@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-14_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606140161
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
X-List-Received-Date: Tue, 14 Jun 2016 14:46:41 -0000

--0__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F
Content-type: multipart/alternative; 
	Boundary="1__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F"


--1__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Take mine too.

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



From:	Brad Bishop <bradleyb@fuzziesquirrel.com>
To:	Patrick Williams <patrick@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org
Date:	14/06/2016 08:10 pm
Subject:	Re: Authentication for OpenBMC port 3000
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



+1

> On Jun 14, 2016, at 7:03 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Jun 13, 2016 at 08:49:58PM -0500, Adriana Kobylak wrote:
>> Adi brought up the concern that accessing port 3000 doesn't require
>> authentication. Since the OpenBMC UI, which would replace the port 3000,

>> is not close to being delivered yet, and the Barreleye GA build
>> approaches, any thoughts on how to proceed: add authentication to the
port
>> 3000, remove it from the build, other?
>>
>
> In my view, the port 3000 code was only there for debug / development
> purposes.  I would suggest we disable it in production builds.
>
> --
> Patrick Williams
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Take mine too.<br><br>Thanks<br><br>------------------------=
-------------------------------------------------------------<br>Thanks and=
 Regards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Power Firmware D=
evelopment, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embass=
y Business Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br>E-ma=
il: vishwanath@in.ibm.com<br>----------------------------------------------=
------------------------------------<br><br><img width=3D"16" height=3D"16"=
 src=3D"cid:1=5F=5F=3DEABBF541DFC2985F8f9e8a93df938690918cEAB@" border=3D"0=
" alt=3D"Inactive hide details for Brad Bishop ---14/06/2016 08:10:21 pm---=
+1 &gt; On Jun 14, 2016, at 7:03 AM, Patrick Williams &lt;patrick@s"><font =
color=3D"#424282">Brad Bishop ---14/06/2016 08:10:21 pm---+1 &gt; On Jun 14=
, 2016, at 7:03 AM, Patrick Williams &lt;patrick@stwcx.xyz&gt; wrote:</font=
><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=
=3D"2">Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;</font><br><font size=
=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">Patrick William=
s &lt;patrick@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc=
:        </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font s=
ize=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">14/06/2016=
 08:10 pm</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </fo=
nt><font size=3D"2">Re: Authentication for OpenBMC port 3000</font><br><fon=
t size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quo=
t;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.or=
g&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=
=3D"color:#8091A5; "><br><br><br><tt>+1<br><br>&gt; On Jun 14, 2016, at 7:0=
3 AM, Patrick Williams &lt;patrick@stwcx.xyz&gt; wrote:<br>&gt; <br>&gt; On=
 Mon, Jun 13, 2016 at 08:49:58PM -0500, Adriana Kobylak wrote:<br>&gt;&gt; =
Adi brought up the concern that accessing port 3000 doesn't require <br>&gt=
;&gt; authentication. Since the OpenBMC UI, which would replace the port 30=
00, <br>&gt;&gt; is not close to being delivered yet, and the Barreleye GA =
build <br>&gt;&gt; approaches, any thoughts on how to proceed: add authenti=
cation to the port <br>&gt;&gt; 3000, remove it from the build, other?<br>&=
gt;&gt; <br>&gt; <br>&gt; In my view, the port 3000 code was only there for=
 debug / development<br>&gt; purposes. &nbsp;I would suggest we disable it =
in production builds.<br>&gt; <br>&gt; -- <br>&gt; Patrick Williams<br>&gt;=
 =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&g=
t; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </tt><tt><=
a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.o=
rg/listinfo/openbmc</a></tt><tt><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs=
.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">http=
s://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F--


--0__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF541DFC2985F8f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF541DFC2985F8f9e8a93df938690918cEABBF541DFC2985F--
